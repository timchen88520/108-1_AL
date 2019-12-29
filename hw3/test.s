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
	.word 41
	.word 42
	.word 43
	.word 44
	.word 45
	.word 46
	.word 47
	.word 48
	.word 49
	.word 50
	.word 51
	.word 52
	.word 53
	.word 54
	.word 55
	.word 56
	.word 57
	.word 58
	.word 59
	.word 60

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
 /*ldr r0, .matrix
 ldr r1, [r0], #4  //r1:=mem32[r0] -> r0=r0+4
 ldr r2, [r0]*/
	ldr r0, .matrix //r0 = a
	
