#include <iostream>
#include <stdio.h>
using namespace std;

typedef struct _Laser_Data
{
	float Azimuth[2];
	float distance[2][2];
	long long timestamp;
}Laser_Data;
Laser_Data data;

int main()
{
	FILE* binaryfileID=NULL;
	const char *binaryfilename="srcdata_b";
	if((binaryfileID = fopen(binaryfilename,"wb+")) == NULL )
		printf("ERROR : binary file cann't open .\n");		

	data.Azimuth[0]=1.1;
	data.Azimuth[1]=1.2;
	data.distance[0][0]=0.1;
	data.distance[0][1]=0.2;
	data.distance[1][0]=0.3;
	data.distance[1][1]=0.4;
	data.timestamp=1234567;
	fwrite(&data,sizeof(Laser_Data),1,binaryfileID);

	data.Azimuth[0]=11.1;
	data.Azimuth[1]=11.2;
	data.distance[0][0]=10.1;
	data.distance[0][1]=10.2;
	data.distance[1][0]=10.3;
	data.distance[1][1]=10.4;
	data.timestamp=11234567;
	fwrite(&data,sizeof(Laser_Data),1,binaryfileID);

	fclose(binaryfileID);
	return 0;
}
