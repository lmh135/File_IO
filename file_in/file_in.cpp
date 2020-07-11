#include <iostream>
#include <fstream>
using namespace std;

int main()
{	
	//ifstream fin;
	//fin.open("in.txt");
	ifstream fin("in.txt");	
	if (!fin)
	{
	  cout << "fail to open the file" <<endl;
	  return -1;
	}
	char str[20]={0};
	//fin>>str;//只能读取第一行空格之前的数据
	while(fin.getline(str,sizeof(str)))
	{
		cout<<str<<endl;	
	}
	fin.close();
	return 0;
}
