    .data
    .align 4
    
c:
    .word 0	/*n*/
    .word 0	/*m*/
    .word 0	/*i*/
    .word 0	/*j*/

/* ========================= */
/*       conv section        */
/* ========================= */
	.section .text
	.global conv
	.type conv,%function
.matrix:
	.word c

conv:
    MOV ip,sp
    STMFD sp!,{r4-r10, fp, ip, lr, pc}
    SUB fp, ip, #4

    mov r5,r0
    sub r6,r2,#2
    sub r7,r3,#2
    mul r0,r6,r7
    mov r8,#4
    mul r0,r8,r0
    mov r8,r1
    mov r9,r2
    bl malloc	/*malloc 4(n-2)(m-2)*/

    mov r1,r8
    mov r2,r9
    ldr r4, .matrix
    mov r6,#0
    mov r7,#0
    str r6,[r4]
    b roop_a
roop_d:	

    ldr r8,[r4, #8]	/*i*/
    mul r8,r3,r8
    ldr r6,[r4,#12]
    add r8,r8,r6	/* 5i+j */
    mov r9,#4
    mul r8,r9,r8
    ldr r8,[r1, r8]	/*a*/

    ldr r9,[r4, #8]
    ldr r6,[r4]
    sub r9,r9,r6	/* r9 = i-n */ 
    mov r10,#3
    mul r9,r10,r9	/*r9 = r9*3   3(i-n)*/

    ldr r6,[r4, #12]	/*j*/
    add r9,r9,r6	/*r9 +j*/
    ldr r6,[r4, #4]
    sub r9,r9,r6	/*-m*/
    mov r10,#4
    mul r9,r10,r9
    ldr r9,[r5, r9]	 /*b*/

    mul r9,r8,r9	/*r9 = a*b*/
    add r7,r7,r9	/*tmp = tmp+r9*/

    ldr r6,[r4, #12]
    add r6,r6,#1	/* j++ */
    str r6,[r4, #12]

    ldr r8,[r4, #4]
    add r8,r8,#3	/*r8 = m+3*/
    ldr r6,[r4, #12]
    cmp r6,r8	/*j(r6) <m+3(r8)*/
    bne roop_d

    ldr r6,[r4, #8]
    add r6,r6,#1	/*i(r6)++*/
    str r6,[r4, #8]

roop_c:
    ldr r6,[r4, #4]	/* j=m */
    str r6,[r4, #12]
    ldr r8,[r4]
    add r8,r8,#3
    ldr r6,[r4, #8]
    cmp r6,r8
    bne roop_d
 
    ldr r6,[r4]
    mov r8,#3
    mul r6,r8,r6
    ldr r8,[r4, #4]
    add r6,r6,r8

    mov r8,#4
    mul r6,r8,r6
    str r7,[r0, r6]	/* str tmp[r0]*/
    mov r7,#0

    ldr r6,[r4, #4]
    add r6,r6,#1	/*m++*/
    str r6,[r4, #4]

roop_b:		
    ldr r6,[r4]	/* i=n */
    str r6,[r4, #8]	/*i= [r4+8]*/
    ldr r6,[r4, #4]
    sub r8,r3,#2
    cmp r6,r8	/*m<3*/
    bne roop_c
    ldr r6,[r4]
    add r6,r6,#1	/*n++*/
    str r6,[r4]

roop_a:	
    mov r6,#0
    str r6,[r4, #4]
    ldr r6,[r4]
    sub r8,r2,#2
    cmp r6,r8	/* n<2 */
    bne roop_b
	
    LDMEA fp, {r4-r10, fp, sp, pc}
    .end
