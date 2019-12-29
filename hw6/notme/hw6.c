#include <stdio.h>
#include <stdlib.h>

int main(){
	int kernel[3][3];
	int i,j,n=4,m=4;
	for(i=0 ; i<3 ; i++){
		for(j=0 ; j<3 ; j++){
			kernel[i][j] = 1;
		}
	}
	//scanf("%d %d",&n,&m);
	int input[n][m];
	for(i=0 ; i<n ; i++){
		for(j=0 ; j<m ; j++){
			input[i][j] = 2;
		}
	}
	int *ans;
	ans = conv(kernel,input,n,m);
	return 0;
}
