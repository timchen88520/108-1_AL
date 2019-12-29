//data
	.data
	.align 4
	.type a, %object
	.size a,80//5*4*4
a: //start to reset a matrix
	.word 1  //1 1 1 1 
	.word 1  //1 1 1 1
	.word 1  //1 1 1 1
	.word 1  //1 1 1 1
	.word 1  //1 1 1 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1

	.type b, %object
	.size b , 36 //3*3*4
b://reset b matrix below
	.word 1		//1 1 1
	.word 1		//1 1 1 
	.word 1		//1 1 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1
	.word 1

c:
	.space 24,0
//text below
	.section .text
	.global conv
	.type conv, %function
.matrix:
	.word a
	.word b
	.word c
conv:

	mov ip, sp
	stmfd sp!, {r4-r10,fp,ip,lr,pc}
	sub fp, ip, #4

	//start to do function below
	ldr r0, .matrix  		//load r0 as start of a
	ldr r1, .matrix+4		//load r1 as start of b
	ldr r2, .matrix+8		//load r2 as start of c
	//reset all variable below to 0
	//all those variable is use to run for loop
	mov r4, #0  //n
	mov r5, #0	//m
	mov r6, #0	//i
	mov r7, #0	//j

	loop_first:							//for(n=0;n<2;n++)

		
		loop_second:					//for(m=0;m<3;m++)

				mov r6,r4
				mov r8, #0
				ldr r0, .matrix  		//load r0 as start of a
				ldr r1, .matrix+4		//load r1 as start of b
				//ldr r2, .matrix+8		//load r2 as start of c
				loop_third:				//for(i=n,i<n+3;i++)

						mov r7, r5		//for(j=m;j<m+3;j++)
						
						
						loop_fourth:

							//start to tmp+=a[i][j]*b[i-n][j-m]a
							//r9=a[i-n][j-m]
							//sub r10, r6, r4
							//sub r3, r7, r5
							//mul r10, r3, r10
							ldr r9,[r0], #4
							ldr r10,[r1], #4
							mul r3, r10, r9
							add r8, r8, r3
							
							add r10,r5,#3
							add r7, r7, #1
							cmp r7, r10		//cmp r6,(r4+3)
							blt loop_fourth
					
					add r10, r4, #3
					add r6, r6, #1
					cmp r6, r10//cmp r6,(r4+3)
					blt loop_third
			
			str r8,[r2],#4
			add r5, r5, #1
			cmp r5, #3
			blt loop_second		
		
	
		mov r5, #0
		add r4, r4, #1
		cmp r4, #2
		blt loop_first		
	ldr r0, .matrix + 8
	ldr r1, [r0] //test first elementle is 9 or not and set it as r0


	mov r0, r0
end:
	ldmea fp,{r4-r10,fp,sp,pc}
	.end
//.end
