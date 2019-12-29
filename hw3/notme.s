/* data section */
.data
    .align 4

/*-----variable a-----*/
    .type a, %object
    .size a, 24        /*---4 * 6---*/
a:
    .word 1            /*-----------*/
    .word 2            /*--- 1  2---*/
    .word 3            /*--- 3  4---*/
    .word 4            /*--- 5  6---*/
    .word 5            /*-----------*/
    .word 6
/*-----variable b-----*/
    .type b, %object
    .size b, 24        /*---4 * 6---*/
b:
    .word 7
    .word 8            /*-----------*/
    .word 9            /*-  7  8  9-*/
    .word 10           /*- 10 11 12-*/
    .word 11           /*-----------*/
    .word 12
c:
    .space 36, 0       /*---4 * 9---*/
/* text section */
    .section .text
    .global main
    .type main, %function

.matrix:
    .word a
    .word b
    .word c

main:
    ldr r0, .matrix         /*---address of a---*/
    ldr r2, .matrix + 8     /*---address of c---*/
    mov r3, #0              /*---for loop_one---*/
    b loop_one
/*---for(r3 = 0; r3 < 3; r3++)---*/
loop_one:
    ldr r5, [r0], #4
    ldr r6, [r0], #4
    ldr r1, .matrix + 4     /*---address of b---*/
    mov r4, #0              /*---for loop_two---*/
/*---for(r4 = 0; r4 < 3; r4++)---*/
loop_two:
    ldr r7, [r1], #4
    ldr r8, [r1], #4
    mul r7, r5, r7
    mul r8, r6, r8
    add r7, r7, r8
    str r7, [r2], #4    /*---store the data into c---*/
    add r4, r4, #1
    cmp r4, #3
    blt loop_two
    add r3, r3, #1
    cmp r3, #3
    blt loop_one
    nop
    .end
