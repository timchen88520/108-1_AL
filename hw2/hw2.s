//r0=r1*r2 + r3*r4
	.section .text
	.global main
	.type main,%function
main:
	mov r0, #0
	mov r1, #10
	mov r2, #20
	mov r3, #12
	mov r4, #15
	mov r5, #0
	//set up r0 to r5
	mul r0,r1,r2//r0=r1*r2
	mul r5,r3,r4//r5=r3*r4
	add r0,r0,r5//r0=r0+r5
	nop//end
	.end
