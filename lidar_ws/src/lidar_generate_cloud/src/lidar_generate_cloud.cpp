#include <ros/ros.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<stdio.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<unistd.h>
#include<stdlib.h>
#include<string.h>
#include<errno.h>
#include<pthread.h>
#include<sys/time.h>
#include <math.h>
#include "lidar_msgs/SynchrPacket.h"
#include "dataProcess.h"
#include <pcl/io/pcd_io.h>
#include <pcl/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <sensor_msgs/PointCloud2.h>
#include "shm.h"


using namespace std;

FILE* binaryfileID=NULL;
FILE* p1=NULL;

list<lidar_msgs::SynchrPacket> synchrpkt_list; //同步数据链表，用于对其中GPS数据进行插值

int val_data,val_place;
int shmid;
Points *p_shared;
Points pts;
int pts_ptr = 0;

double Vertical_table[16]={-0.2618,0.0175,-0.2269,0.0524,-0.1920,0.0873,-0.1571,0.1222,-0.1222,0.1571,-0.0873,0.1920,-0.0524,0.2269,-0.0175,0.2618};


class Generate_pointcloud
{
	protected:	
		ros::NodeHandle nh;
		//ros::Publisher pcl_pub;
		//ros::Publisher surroundings_pub;
		char filename[512];
		//char point_filename[512];

	public:
		Generate_pointcloud()
		{
			
			//pcl_pub = nh.advertise<sensor_msgs::PointCloud2> ("realtime", 1);
			//surroundings_pub = nh.advertise<sensor_msgs::PointCloud2> ("surroundings", 1);
			char test_inlab[512];
			time_t now;
			struct tm *tm_now;

			time(&now);
			tm_now = localtime(&now);
	
			sprintf(test_inlab,"/home/longmen/laser_data/checkout_data/%d-%d-%d_%d_%d_%d",(1900+tm_now->tm_year),(1+tm_now->tm_mon),tm_now->tm_mday,tm_now->tm_hour,tm_now->tm_min,tm_now->tm_sec);
			strcpy(filename,test_inlab);
			strcat(filename,"_ori_data_b");
			//strcpy(point_filename,test_inlab);
			//strcat(point_filename,"_point.txt");

			if((binaryfileID = fopen(filename,"wb+")) == NULL )
				printf("ERROR : binary file cann't open .\n");

		}

		void generate_callback(const lidar_msgs::SynchrPacket::ConstPtr& data);
		

		~Generate_pointcloud()
		{
			;
		}

               //pcl::PointCloud<pcl::PointXYZ> allcloud;


};

void Generate_pointcloud::generate_callback(const lidar_msgs::SynchrPacket::ConstPtr& data)
{
	int i,j;

	lidar_msgs::SynchrPacket new_synchrpkt = *data;

	//static double err_yaw = 0;
	static double last_ned_pos[3];
	static int first_entry = 0;
	static int id_num = 0;
	static long int ori_id_num = 0;
	Ori_data tdata;

	/* 首次进入时，同步数据填入链表，记录gps与imu航向偏差，记录该时刻gps输出位置 */
	if(0 == first_entry)
	{
		synchrpkt_list.push_front(new_synchrpkt);

		//err_yaw = new_synchrpkt.gpspkt.heading-new_synchrpkt.imupkt[11].imu_euler[2]+heading_bais;  //航向偏差
		
		for(i=0;i<3;i++)
			last_ned_pos[i] = new_synchrpkt.gpspkt.ned_xyz[i];

		first_entry = 1;
		return;
	}

	double ned_pos[3];
	for(i=0;i<3;i++)
	{
		ned_pos[i] = new_synchrpkt.gpspkt.ned_xyz[i]; //得到当前gps输出位置
	}

	int item_num = synchrpkt_list.size();  //得到链表长度

	/* 当链表过长或者gps输出位置发生变化，则开始进行插值并生成点云数据，否则将新同步数据填入链表 */
	if((item_num<50)&&(fabs(ned_pos[0]-last_ned_pos[0])<0.0001) && (fabs(ned_pos[1]-last_ned_pos[1])<0.0001) && (fabs(ned_pos[2]-last_ned_pos[2])<0.0001))
	{
		synchrpkt_list.push_front(new_synchrpkt);	
	}
	else
	{
		list<lidar_msgs::SynchrPacket>::iterator item;
		
		/* 计算每步位置差 */
		double ned_dx,ned_dy,ned_dz;
		ned_dx = (ned_pos[0]-last_ned_pos[0])/item_num;
		ned_dy = (ned_pos[1]-last_ned_pos[1])/item_num;
		ned_dz = (ned_pos[2]-last_ned_pos[2])/item_num;

		/* 对链表内每个同步数据包的gps输出位置进行线性插值 */
		for(item=synchrpkt_list.begin(),i=1;item!=synchrpkt_list.end();item++,i++)
		{
			(*item).gpspkt.ned_xyz[0] = ned_pos[0]-ned_dx*i;
			(*item).gpspkt.ned_xyz[1] = ned_pos[1]-ned_dy*i;
			(*item).gpspkt.ned_xyz[2] = ned_pos[2]-ned_dz*i;
			//(*item).imupkt.imu_euler[2] = (*item).imupkt.imu_euler[2]+err_yaw;
		}

		/*记录原始数据*/


		/* 根据链表内每个同步数据包，生成点云数据 */
		for(item=synchrpkt_list.begin();item!=synchrpkt_list.end();item++)
		{
			float Azimuth[12];
			float distan[12][16];

			float euler[12][3];

			double ned_position[3];
			
			Point laser_point[12][16];
			Point ned_point[12][16];
		
			for(i=0;i<12;i++)
			{
				Azimuth[i] = (*item).laserpkt.Azimuth[i];
				for(j=0;j<16;j++)
					distan[i][j] = (*item).laserpkt.distance[16*i+j];
				for(j=0;j<3;j++)
					euler[i][j] = (*item).imupkt[i].imu_euler[j];
				//euler[i][2] = (*item).imupkt[i].imu_euler[j]+err_yaw;
			}
			for(i=0;i<3;i++)
				ned_position[i] = (*item).gpspkt.ned_xyz[i];

			for(i=0;i<12;i++)
			{
				for(j=0;j<16;j++)
					//if(distan[i][j]>1.0)
					{
						laser_point[i][j].x = distan[i][j]*cos(Vertical_table[j])*sin(Azimuth[i]*DEG2RAD);
						laser_point[i][j].y = distan[i][j]*cos(Vertical_table[j])*cos(Azimuth[i]*DEG2RAD);
						laser_point[i][j].z = distan[i][j]*sin(Vertical_table[j]);
						
						ori_id_num++;
						tdata.id_num = ori_id_num;
						for(unsigned int k=0; k<3; k++)
						{
							tdata.euler[k] = euler[i][k];
							tdata.posNED[k] = ned_position[k];
						}
						tdata.p_laser.x = laser_point[i][j].z;
						tdata.p_laser.y = laser_point[i][j].x;
						tdata.p_laser.z = laser_point[i][j].y;
						fwrite(&tdata,sizeof(Ori_data),1,binaryfileID);
					}
			}

			dataHandle(laser_point,ned_position,euler,ned_point);		//这里生成点云数据ned_point
/*
			for(i=0;i<12;i++)
				for(j=0;j<16;j++)
				{
					if(ned_point[i][j].z<3.4 || ned_point[i][j].z>7.32)
					{
						ned_point[i][j].x = 0;
						ned_point[i][j].y = 0;
						ned_point[i][j].z = -5;
					}
					else
						ned_point[i][j].z = ned_point[i][j].z-5.0;;
				}
*/
			

			//ROS_INFO("generate cloud!");

			//FILE* p1=NULL;
/*
			p1 = fopen(point_filename,"a+");
			for(i=0;i<12;i++)
			{
				for(j=0;j<16;j++)
				{
					fprintf(p1,"%lf %lf %lf \n",ned_point[i][j].x,ned_point[i][j].y,ned_point[i][j].z);
				}
			}
			fclose(p1);
*/

			for(i=0;i<12;i++)
			{
				for(j=0;j<16;j++)
				{
					pts.p[pts_ptr][16*i+j].x = ned_point[i][j].x;
					pts.p[pts_ptr][16*i+j].y = ned_point[i][j].y;
					pts.p[pts_ptr][16*i+j].z = ned_point[i][j].z;
				}
			}
			pts_ptr++;

			if(pts_ptr==share_num)
			{
				id_num++;
				semaphore_P(val_place);

				for(i=0;i<share_num;i++)
					for(j=0;j<192;j++)
						p_shared->p[i][j] = pts.p[i][j];
				p_shared->id_num = id_num;
				p_shared->flag = 1;
				semaphore_V(val_data);
				pts_ptr = 0;
			}



		}

		/* 点云数据生成后，清空链表，并将最新同步数据包填入链表中，记录该时刻的gps输出位置，继续循环 */
		synchrpkt_list.clear();
		synchrpkt_list.push_front(new_synchrpkt);
		for(i=0;i<3;i++)
			last_ned_pos[i] = new_synchrpkt.gpspkt.ned_xyz[i];
	}
	
	return;	



}




int main(int argc, char** argv)
{
	ros::init(argc, argv, "lidar_generate_cloud");
		
	ros::NodeHandle nh;

	if((val_data = semget(ftok("val_data",0),1,IPC_CREAT|0660)) == -1)
	{
		printf("semget val_data failed.");
		exit(1);
	}
	init_a_semaphore(val_data,0,0);

	if((val_place = semget(ftok("val_place",0),1,IPC_CREAT|0660)) == -1)
	{
		printf("semget val_place failed.");
		exit(1);
	}
	init_a_semaphore(val_place,0,1);

	if((shmid = shmget((key_t)1023457,sizeof(Points),IPC_CREAT|0660)) == -1)//注意，共享数据结构每改动一次，共享内存名也要改动一次
	{
		printf("shmget point_data failed.");
	exit(1);
	}

	p_shared = (Points*)shmat(shmid,0,0);  
	if(p_shared==(Points*)-1)  
	{
		printf("shm shmat point_data  failed"); 
		exit(1);
	}


	Generate_pointcloud opt = Generate_pointcloud();
	//ros::Publisher syn_pub = nh.advertise<lidar_msgs::SynchrPacket>("synchr_packet", 2);
	ros::Subscriber sub_generate_pkt = nh.subscribe("synchr_packet", 5000, &Generate_pointcloud::generate_callback, &opt);
	//ros::Subscriber sub_synchr = nh.subscribe("synchr_packet", 5000, cloud_callback);

	//while(ros::ok())
	//{
		ros::spin();
	//} 


	return 0;

}
