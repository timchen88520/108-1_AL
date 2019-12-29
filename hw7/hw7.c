#include<stdio.h>
#include<stdlib.h>

#define N 400

int main(){
  freopen("data.txt","r",stdin);
  freopen("output.txt","w",stdout);

  float m[N][N],table[N][N],answer[N],add;
  int count=200;
  //reset all element to 0.0
  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      m[i][j]=0.0;
      table[i][j]=0.0;
    }
    answer[i]=0.0;
  }

  //start to put data to m matrix
  for(int i=0;i<N;i++)
    for(int j=0;j<N;j++) scanf("%f", &m[i][j]);

  //ans[i]=a[i]*(a[1]+a[2]+...........a[n-1])

  for(int i=0;i<N;i++){
    for(int j=0;j<N;j++){
      if(table[i][j]>0){
        answer[i]+=table[i][j];
        continue;
      }
      
      add=0.0;
      for(int k=0;k<N;k++)
        add+=(m[i][k]*m[j][k]);
      //start to build table from data
      table[i][j]=table[j][i]=add;
      answer[i]+=add;
    }
  }

  //printf out the answer

  for(int i=0;i<N;i++) printf("%f\n", answer[i]);
  return 0;
}
