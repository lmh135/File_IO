#include <iostream>
#include <stdio.h>
using namespace std;

typedef struct _Laser_Data
{
	float Azimuth[2];
	float distance[2][2];
	long long timestamp;
}Laser_Data;
Laser_Data tdata;

int main()
{
	FILE* binary_file=NULL;
	binary_file=fopen("srcdata_b","rb+");
	if(binary_file==NULL)
        	printf("open file failed!");
	fseek(binary_file,0,SEEK_SET);//把文件指针指向文件的开头
	while(1)
	{
		int num_to_read = fread(&tdata,sizeof(tdata),1,binary_file);
		if(num_to_read != 1)
		{
			printf("fread1 have wrong!\n");
			break;
		}
		cout<<tdata.Azimuth[0]<<" "<<tdata.Azimuth[1]<<" "<<tdata.distance[0][0]<<" "<<tdata.distance[0][1]<<" "<<tdata.distance[1][0]<<" "<<tdata.distance[1][1]<<" "<<tdata.timestamp<<endl;
	}	
	fclose(binary_file);
	return 0;
}
