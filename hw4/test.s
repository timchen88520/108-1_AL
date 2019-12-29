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
	.word 1		//1 2 3
	.word 2		//4 5 6
	.word 3		//7 8 9 
	.word 4
	.word 5
	.word 6
	.word 7
	.word 8
	.word 9

c:
	.space 36,0
d: 
	.space 24,0

//text below
	.section .text
	.global main
	.type main, %function
.matrix:
	.word a
	.word b
	.word c
	.word d
main:
	ldr r0, .matrix  		//load r0 as start of a
	ldr r1, .matrix+4		//load r1 as start of b
	ldr r2, .matrix+8		//load r2 as start of c-> tmp
	ldr r3, .matrix+12  //load r3 as start of d->final output
	
	//load 6 time 3*3 matrix to c
	mov r4, #0
	mov r5, #0
	loop_load_to_c_1:		//for(r4=0,r4<3;r4++)
		cmp r4, #3
		blt loop_load_to_c_1
		add r4, r4, #1
							
