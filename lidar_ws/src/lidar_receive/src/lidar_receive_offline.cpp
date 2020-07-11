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



FILE* binary_file=NULL;
FILE* p1=NULL;

int main(int argc, char** argv)
{
	ros::init(argc, argv, "lidar_receive_offline");

	ros::NodeHandle nh;

	ros::Publisher recv_pub = nh.advertise<lidar_msgs::RecvPacket>("recv_packet", 200);	
	ros::Publisher imu_pub = nh.advertise<lidar_msgs::ImuPacket>("imu_packet", 200);
	ros::Publisher gps_pub = nh.advertise<lidar_msgs::GPSPacket>("gps_packet", 200);

	//ROS_INFO("argc:%d",argc);

	if(argc != 2)
	{
		ROS_ERROR("No file loaded!");
		exit(1);
	}

	char *fn;
	//char const *filename = fn;

	fn = (char*)argv[1];

	ROS_INFO("file name:%s",fn);

	//binary_file=fopen("/home/wwf/lidar_data_offline/srcdata_b","rb+");
	binary_file=fopen(fn,"rb+");
	
	if(binary_file==NULL)
        	printf("open file failed!");

	fseek(binary_file,0,SEEK_SET);

	lidar_msgs::ImuPacket imu_pkt;
	lidar_msgs::GPSPacket gps_pkt;

	lidar_msgs::GPSPacket last_gps_pkt;

	Packet tdata;
	lidar_msgs::RecvPacket recv_pkt;

	long recv_cout = 0;
	double err_yaw = 0;
	int yaw_cout = 0;

	int i,j;

	static long long laser_timestamp = 0, last_laser_timestamp = 0;
	int num_in_loop = 0;

	ros::Rate loop_rate(100);

	while (ros::ok())
	{
		
		int num_to_read = fread(&tdata,sizeof(tdata),1,binary_file);
		if(num_to_read != 1)
		{
			printf("fread1 have wrong!\n");
			break;
		}
		

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


		laser_timestamp = tdata.laser_data.laser_timestamp;
		num_in_loop++;

		if(laser_timestamp-last_laser_timestamp>1500)
		{
			printf("%d \n",num_in_loop);
			num_in_loop = 0;
		}

		last_laser_timestamp = laser_timestamp;

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

		loop_rate.sleep();

	}
	fclose(binary_file);
	printf("end! \n");

}
