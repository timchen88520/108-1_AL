//data
	.data
	.align 4  //4 byte

	//all a matrix below
	.type a, %object
	.size a, 80 //5*4*4 bytes
a:
.word 1//   1  2  3  4  5
.word 2//   6  7  8  9  10
.word 3//   11 12 13 14 15
.word 4//   16 17 18 19 20
.word 5
.word 6
.word 7
.word 8
.word 9
.word 10
.word 11
.word 12
.word 13
.word 14
.word 15
.word 16
.word 17
.word 18
.word 19
.word 20

//all b matrix below
	.type b,%object
	.size b,80
b:
.word 21
.word 22
.word 23
.word 24
.word 25
.word 26
.word 27
.word 28
.word 29
.word 30
.word 31
.word 32
.word 33
.word 34
.word 35
.word 36
.word 37
.word 38
.word 39
.word 40

c:
.space 80,0

// TEXT
	.section .text
	.global main
	.type main, %function
.matrix:
	.word a
	.word b
	.word c
main:

	ldr r0, .matrix //load r0 as start of matrix a
	ldr r2, .matrix + 4//load r2 as start of matrix b
	ldr r4, .matrix + 8//load r3 as start of matrix c
	//start loop below use r6 to count to 20 times
	mov r6,#0 //reset r6 to 0
	//for r6=0;r6<20;r6++
	loop_try:
		ldr r1, [r0], #4	//load a to r1
	
		ldr r3, [r2], #4	//b

		add r5, r1,r3	//sum a+b to r5
		str r5, [r4], #4  //store r5 to c matrix and move 4 bytes
		add r6, r6, #1 //r6+=1
		//if r6 >=20 break
		cmp r6,#19 
		blt loop_try
		//last one doesnt need to move mem addr
		ldr r1, [r0]	//load a to r1
		ldr r3, [r2]	//b
		add r5, r1,r3	//sum a+b to r5
		str r5, [r4]  //store r5 to c matrix and move 4 bytes
	
		ldr r1, .matrix + 8//set r1 as c's first address
	nop
.end
