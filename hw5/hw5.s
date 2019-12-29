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
	.global main
	.type main, %function
.matrix:
	.word a
	.word b
	.word c
main:

	mov ip, sp
	//stmfd sp!,{r0~r12,lr}
	stmfd sp!,{fp,ip,lr,pc}
	sub fp , ip, #4


	ldr r0, .matrix  		//load r0 as start of a
	ldr r1, .matrix+4		//load r1 as start of b
	ldr r2, .matrix+8		//load r2 as start of c
	//start try function
	bl try
	//end function
	nop
	ldmea fp, {fp,sp,pc}
	.end
