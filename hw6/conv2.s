    .data
    .align 4
//reset all c elemental to 0 
c:
    .word 0	
    .word 0	
    .word 0	
    .word 0	

	.section .text
	.global conv
	.type conv,%function
//declare matrix c  
.matrix:
	.word c

conv:

  //callee step
  MOV ip,sp
  STMFD sp!,{r4-r10, fp, ip, lr, pc}
  SUB fp, ip, #4

  //start to malloc
  mov r5,r0
  sub r6,r2,#2
  sub r7,r3,#2
  mul r0,r6,r7
  mov r8,#4
  mul r0,r8,r0
  mov r8,r1
  mov r9,r2
  bl malloc
  mov r1,r8
  mov r2,r9
  ldr r4, .matrix
  mov r6,#0
  mov r7,#0
  str r6,[r4]
  b loop_first



loop_second:
  ldr r8,[r4, #8]	//load r8 as i
  mul r8,r3,r8
  ldr r6,[r4,#12]
  add r8,r8,r6  //i=5i+j
  mov r9,#4
  mul r8,r9,r8
  ldr r8,[r1, r8]	//load r8 = a, and jump to 5i+j place
  ldr r9,[r4, #8]
  ldr r6,[r4]
  sub r9,r9,r6	//r9 = i-n 
  mov r10,#3
  mul r9,r10,r9	//r9 = r9*3  
  ldr r6,[r4, #12]	// load r6 = j
  add r9,r9,r6	//r9=r9+j -> 3(i-n)+j
  ldr r6,[r4, #4]
  sub r9,r9,r6	//load r9 =m
  mov r10,#4
  mul r9,r10,r9
  ldr r9,[r5, r9]	 //load r9= b
  mul r9,r8,r9	//r9=a*b
  add r7,r7,r9	//tmp+=r9 -> tmp+=(a*b)
  ldr r6,[r4, #12]
  add r6,r6,#1	//j++
  str r6,[r4, #12]
  ldr r8,[r4, #4]
  add r8,r8,#3	//r8 = m+3
  ldr r6,[r4, #12]
  cmp r6,r8	/*j(r6) <m+3(r8)*/
  bne roop_d
  ldr r6,[r4, #8]
  add r6,r6,#1	//i++
  str r6,[r4, #8]
  
loop_third:
  ldr r6,[r4, #4]	//let j=m
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
  str r7,[r0, r6]	//str the result back to output
  mov r7,#0
  ldr r6,[r4, #4]
  add r6,r6,#1	//m++
  str r6,[r4, #4]

loop_second:		
  ldr r6,[r4]	//let i=n
  str r6,[r4, #8]	//i=[r4+8]     /*x x*/
  ldr r6,[r4, #4]                /*x x*///first jump to third need jump 8
  sub r8,r3,#2
  cmp r6,r8	//cmp m<3 -> break
  bne roop_c
  ldr r6,[r4]
  add r6,r6,#1	//n++
  str r6,[r4]

loop_first:	
  mov r6,#0
  str r6,[r4, #4]
  ldr r6,[r4]
  sub r8,r2,#2
  cmp r6,r8	//cmp if n<2 -> break
  bne roop_b
	
  //put reg back and return
  LDMEA fp, {r4-r10, fp, sp, pc}
  .end
