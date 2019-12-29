#include <stdio.h>
#include <stdlib.h>

#define ROW 400
#define COLUMN 400

int main(void)
{
   FILE *fp;
   int i, j;

   float matrix[ROW][COLUMN];
   
   fp = fopen("data.txt","r"); // Open a file for reading.

   for (i=0; i<ROW; i++) {
      for (j=0; j<COLUMN; j++) {
         fscanf(fp, "%f", &matrix[i][j]);
      }
   }


   /*
   for (i=0; i<ROW; i++) {
      for (j=0; j<COLUMN; j++) {
         printf("%f ", matrix[i][j]);
      }
      printf("\n");
   }
   */

   fclose(fp);

   return 0;
}
