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
//#include"lidar_receive/Data.h"
//#include"lidar_receive/MySocket.h"
#include"Data.h"
#include"MySocket.h"
//#include "lidar_msgs/LaserPacket.h"
//#include "lidar_msgs/ImuPacket.h"
//#include "lidar_msgs/GPSPacket.h"
#include "lidar_msgs/RecvPacket.h"




int main(int argc, char** argv)
{
	ros::init(argc, argv, "lidar_receive_online");

	ros::NodeHandle nh;

	Socket rec_socket; 
	

	int udprecvbuflen,udprecvbuf;
	socklen_t optlen;
	optlen=sizeof(udprecvbuf);
	rec_socket.UDPCreateServer("IPV4","UDP","192.168.1.100",2006);
 	if(getsockopt(rec_socket.GetSocketFD(),SOL_SOCKET,SO_RCVBUF,(char*)&udprecvbuf,&optlen)!=0)
	perror("getsockopt1 error");
	//printf("the original udprecvbuflen is %d\n",udprecvbuf);
	udprecvbuflen=0;
	if(setsockopt(rec_socket.GetSocketFD(),SOL_SOCKET,SO_RCVBUF,(char*)&udprecvbuflen,sizeof(int))!=0)
	perror("setsockopt error");
	if(getsockopt(rec_socket.GetSocketFD(),SOL_SOCKET,SO_RCVBUF,(char*)&udprecvbuf,&optlen)!=0)
	perror("getsockopt2 error");
	//printf("the final udprecvbuflen is %d\n",udprecvbuf);

	ros::Publisher recv_pub = nh.advertise<lidar_msgs::RecvPacket>("recv_packet", 2);	
	ros::Publisher imu_pub = nh.advertise<lidar_msgs::ImuPacket>("imu_packet", 2);
	ros::Publisher gps_pub = nh.advertise<lidar_msgs::GPSPacket>("gps_packet", 2);

	lidar_msgs::ImuPacket imu_pkt;
	lidar_msgs::GPSPacket gps_pkt;

	lidar_msgs::GPSPacket last_gps_pkt;

	Packet tdata;
	lidar_msgs::RecvPacket recv_pkt;
	char buf[100000];

	long recv_cout = 0;
	double err_yaw = 0;
	int yaw_cout = 0;

	fd_set fds;
	struct timeval tv;
	int r;
	long time_s;
	long time_us;
	int i,j;

	static long long laser_timestamp = 0, last_laser_timestamp = 0;
	int num_in_loop = 0;

	char test_inlab[512];
    	char filename[512];
    	
    	time_t now;
    	struct tm *tm_now;

    	time(&now);
    	tm_now = localtime(&now);

	sprintf(test_inlab,"/home/longmen/laser_data/%d-%d-%d_%d_%d_%d",(1900+tm_now->tm_year),(1+tm_now->tm_mon),tm_now->tm_mday,tm_now->tm_hour,tm_now->tm_min,tm_now->tm_sec);
    	strcpy(filename,test_inlab);
    	strcat(filename,"_srcdata_b");

	FILE* binaryfileID=NULL;
	//const char *binaryfilename="srcdata_b";
        if((binaryfileID = fopen(filename,"wb+")) == NULL )
		printf("ERROR : binary file cann't open .\n");
    	

	while(ros::ok())
	{
		FD_ZERO (&fds);//将指定的?件描述符集清空
		FD_SET (rec_socket.GetSocketFD(), &fds);//在文件描述符集合中增鍔????个新的文件描述符
		static int tempcount=0;
		tv.tv_sec = 0;
		tv.tv_usec = 200;
		r = select (rec_socket.GetSocketFD() + 1, &fds, NULL, NULL, &tv);//判断是否可读，tv是定时
		if (-1 == r)
		{
			printf ("select laser err\n");
			exit(1);
		}
		if (0 == r) 
		{
			tempcount++;
			//printf("tempcount=%d\n",tempcount);
			if(tempcount>30)
			{
				tempcount=0;
			}
			else
				continue;
					
		}
		else
		{
			memset(buf, 0, sizeof(buf));
			rec_socket.UDPReceivePackets(buf,sizeof(tdata));
			memset(&tdata, 0, sizeof(tdata));
        		memcpy(&tdata,buf,sizeof(tdata));

        		//printf("get laser data:%lld !\n",tdata.id_num);
			/*  数据解包  */

			for(i=0;i<12;i++)
			{
				recv_pkt.laserpkt.Azimuth[i] = tdata.laser_data.Azimuth[i];
				for(j=0;j<16;j++)
					recv_pkt.laserpkt.distance[16*i+j] = tdata.laser_data.distance[i][j];
			}
			recv_pkt.laserpkt.timestamp = tdata.laser_data.timestamp-T_DELAY_SYS_LASER;
			recv_pkt.laserpkt.id_num = tdata.id_num;

			for(i=0;i<3;i++)
			{
				recv_pkt.imupkt.imu_gyro[i] = tdata.imu_data.imu_gyro[i];
				recv_pkt.imupkt.imu_accel[i] = tdata.imu_data.imu_accel[i];
				recv_pkt.imupkt.imu_magn[i] = tdata.imu_data.imu_magn[i];
				recv_pkt.imupkt.imu_euler[i] = tdata.imu_data.imu_euler[i];
			}
			recv_pkt.imupkt.timestamp = tdata.imu_data.timestamp-T_DELAY_SYS_IMU;
			recv_pkt.imupkt.id_num = tdata.id_num;

			for(i=0;i<3;i++)
			{
				recv_pkt.gpspkt.ned_xyz[i] = tdata.gps_data.ned_xyz[i];
				recv_pkt.gpspkt.ned_uvw[i] = tdata.gps_data.ned_uvw[i];
			}
			recv_pkt.gpspkt.heading = tdata.gps_data.heading;
			recv_pkt.gpspkt.gps_sats = tdata.gps_data.gps_sats;
			recv_pkt.gpspkt.gps_mod = tdata.gps_data.gps_mod;
			recv_pkt.gpspkt.timestamp = tdata.gps_data.timestamp;
			recv_pkt.gpspkt.id_num = tdata.id_num;
			
			imu_pkt = recv_pkt.imupkt;
			gps_pkt = recv_pkt.gpspkt;
			
			//查看接收情况
			laser_timestamp = tdata.laser_data.laser_timestamp;
			num_in_loop++;

			if(laser_timestamp-last_laser_timestamp>1500)
			{
				printf("%d \n",num_in_loop);
				num_in_loop = 0;
			}

			last_laser_timestamp = laser_timestamp;
			//记录原始数据
			fwrite(&tdata,sizeof(Packet),1,binaryfileID);
			
			//航向修正
			if(recv_cout < start_num)
			{
				recv_cout++;
				if(1 != recv_cout)
				{
					float last_pos[3],current_pos[3];
					for(i=0;i<3;i++)
					{
						last_pos[i] = last_gps_pkt.ned_xyz[i];
						current_pos[i] = gps_pkt.ned_xyz[i];
					}
					
					if((fabs(current_pos[0]-last_pos[0])>0.0001) || (fabs(current_pos[1]-last_pos[1])>0.0001) || (fabs(current_pos[2]-last_pos[2])>0.0001))
					{
						yaw_cout++;
						err_yaw = err_yaw+(gps_pkt.heading-imu_pkt.imu_euler[2]+heading_bais);
					}

				}

				last_gps_pkt = gps_pkt;
				if(recv_cout == start_num && yaw_cout)
				{
					err_yaw = (double) err_yaw/yaw_cout;
				}
			}
			else
			{
				imu_pkt.imu_euler[2] = imu_pkt.imu_euler[2]+err_yaw;
				recv_pkt.imupkt.imu_euler[2] = imu_pkt.imu_euler[2];
				/* 发布recv_pkt消息 */	
				recv_pub.publish(recv_pkt);	
				imu_pub.publish(imu_pkt);	
				gps_pub.publish(gps_pkt);	
	
				ros::spinOnce();
			}

		}

	

	}


	return 0;


}
