#include <iostream>
#include <fstream>
using namespace std;

int main()
{
	ofstream fout;//创建文件对象
	fout.open("out.txt");
	if(!fout)
	{
		cout << "fail to open the file" <<endl;
		return -1;	
	}
	int a=1;
	fout<<"outfile test"<<" "<<a<<endl;
	fout<<2<<endl;
	fout.close();
	return 0;
}
