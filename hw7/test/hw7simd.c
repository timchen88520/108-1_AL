// matrix addtion with SIMD
#include<stdio.h>
#include<mmintrin.h>
#include<xmmintrin.h>

#define N 800

int main()
{
    freopen("data.txt","r",stdin);  // readfile
    freopen("output_simd.txt","w",stdout);  // writefile
    float m[N][N]__attribute__((aligned(16))) , add[N]__attribute__((aligned(16))) , ans[N] , table[N][N];
    float *ptr,*ptr2,temp;
    __m128 *A,*B,*C;
    int i,j,k,z,n=400;
    // initial
    for(i=0;i<N;i++)
    {
        for(j=0;j<N;j++) m[i][j] = table[i][j] = 0.0;
        add[i] = ans[i] = 0.0;
    }
    // input data , n*n matrix
    for(i=0;i<n;i++)
        for(j=0;j<n;j++) scanf("%f",&m[i][j]);
    // C is __m128 pointer to add
    C = (__m128*)add;
    // from row[0] to row[n-1]
    for(i=0;i<n;i++)
    {
        ptr = m[i]; // ptr = row[i];
        // row[i] * ( row[0]~row[n-1] )
        for(j=0;j<n;j++)
        {
            ptr2 = m[j];    //ptr2 = row[j] , j = 0~n-1;
            A = (__m128*)ptr;
            B = (__m128*)ptr2;
            // table>0 present it has be done before,so we do it again.
            if( table[i][j]>0 )
            {
                ans[i] += table[i][j];
                continue;
            }
            temp = 0.0;
            // compute row[i]*row[j]
            for(k=1;k<(n/4)+2;k++)
            {
                *C = _mm_mul_ps( *A , *B );
                for(z=0;z<4;z++) temp += add[z];
                A = (__m128*)(ptr+4*k);
                B = (__m128*)(ptr2+4*k);
            }
            table[i][j] = table[j][i] = temp;
            ans[i] += temp;
        }
    }
    for(i=0;i<n;i++) printf("%f\n",ans[i]);
    return 0;
}
