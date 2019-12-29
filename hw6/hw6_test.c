#include<stdio.h>
#include<stdlib.h>


int main(void){	
	int *ptr=NULL;
	int kernel[3][3]={0};

	//reset all element at both as 1
	for(int i=0;i<3;i++)
		for(int j=0;j<3;j++)
			kernel[i][j]=1;
	

	int colum=4,row=4;
	//scanf("%d %d",&colum,&row);
	int input[colum][row];
	
	for(int i=0;i<colum;i++)
		for(int j=0;j<row;j++)
			input[i][j]=1;

	int *output;
	output=conv(input,kernel,colum,row);
	
	return 0;
}
