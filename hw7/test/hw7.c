//  matrix addtion (not normal matrix addtion)
#include<stdio.h>
#define N 800


int main()
{
    freopen("data.txt","r",stdin);  // readfile
    freopen("output.txt","w",stdout);   // writefile
    int i,j,k,n=400;
    float m[N][N],table[N][N],ans[N],add;
    // initial
    for(i=0;i<N;i++)
    {
        for(j=0;j<N;j++)
            m[i][j] = table[i][j] = 0.0;
        ans[i] = 0.0;
    }
    // input n*n matrix
    for(i=0;i<n;i++)
        for(j=0;j<n;j++) scanf("%f",&m[i][j]);
    // ans[i] = A[i]*A[0] + A[i]*A[1] + ... + A[i]*A[n-1];
    for(i=0;i<n;i++)    // A[i]
    {
        for(j=0;j<n;j++)    // A[0]~A[n-1]
        {
            if( table[i][j] > 0 )    // if A[i]*A[j] has already done before,add the result directly.
            {
                ans[i] += table[i][j];
                continue;
            }
            add = 0.0;
            for(k=0;k<n;k++)    // A[i][0]~A[i][n-1]
                add += ( m[i][k] * m[j][k] );
            table[i][j] = table[j][i] = add;  // bulid table
            ans[i] += add;
        }
    }
    // print the ans
    for(i=0;i<n;i++) printf("%f\n",ans[i]);
    return 0;
}
