#ifndef _CLOUD_H
#define _CLOUD_H

#include <math.h>
#include <list>

//#define MDEG2RAD 0.01745329
#define DEG2RAD 0.01745329251

#define heading_bais 2.93 //初始gps航向安置偏差

#define delta_xb  1.05//0.645//1.08//0.12//1.05		//1.10             //new on big plane
#define delta_yb  0.02//0.075//0.00//0.02		                    //pianzhijiao
#define delta_zb  0.32//0.065//0.40//0.095//0.32		//0.21

#define DPlg_x  0
#define DPlg_y  0
#define DPlg_z  0

#define delta_theta0 -3.25//-2.96//-3.4068//-3.28671//-3.3629 //theta[0]偏移值
#define delta_theta1 -0.17//0.541//-0.0783//-0.21304//-0.1207	//theta[1]偏移值	
#define delta_theta2 -1.75//-1.62//-0.69054//-1.21927//1.3362//theta[2]偏移值

#define x_move 0        //整体平移x
#define y_move 0	//整体平移y
#define z_move 0	//整体平移z

#define share_num 50



typedef struct _Point
{
	double x;
	double y;
	double z;
}Point;


typedef struct _Points
{
	Point p[share_num][192];
	int id_num;
	int flag;
}Points;

typedef struct _Ori_Data
{
	long int id_num;
	float euler[3];
	double posNED[3];
	Point p_laser;
}Ori_data;



void generateCbn(float roll,float pitch,float yaw); //生成机体坐标到ned坐标的旋转矩阵
void dataHandle (Point point[][16], double posNED[], float euler[][3], Point pointXYZ[][16]); //将激光点云从激光坐标转换为ned坐标













#endif
