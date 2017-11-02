.data
n:			.word 	20      ; There are 20 elements in array "a".
a:			.word 	23      ; 4
			.word 	12      ; 7
			.word 	19      ; 
			.word 	9       ; 12
			.word 	98      ; 
			.word 	4       ; 23
			.word 	7
			.word 	9
			.word 	30405
			.word 	21
			.word 	16288
			.word 	26483
			.word 	9982
			.word 	261
			.word 	5025
			.word 	18825
			.word 	30405
			.word 	9575
			.word 	9575
			.word 	25247   ; a[19]
CONTROL:	.word	0x10000 
DATA:		.word	0x10008
   
.text
main:
	ld r20, CONTROL(r0)
	ld r21, DATA(r0)
	
	daddi r2, r0, 0			; i = 0
	ld r3, n(r0)		; k = n 
	daddi r3, r3, -1
	
outerLoop:
	slt r5, r3, r2
	bnez r5, printArray
	
	daddi r6, r2, 0		; j = i
	
	dadd r7, r2, r2
	dadd r7, r7, r7
	dadd r7, r7, r7
	
	ld r4, a(r7)		; current item
	j innerLoop
	
innerLoop:
	slt r8, r3, r6		; while j < i
	bnez r8, endInner
	
	dadd r14, r6, r6
	dadd r14, r14, r14
	dadd r14, r14, r14
	
	ld r9, a(r14) 		; cur = a[j]
	beq r9, r4, newMin
	slt r11, r9, r4		; if a[j] < min
	bnez r11, newMin
	
	daddi r6, r6, 1
	j innerLoop
	
newMin:
	ld r4, a(r14)		; value
	daddi r15, r14, 0	; index
	daddi r6, r6, 1
	j innerLoop
	
endInner:
	ld r12, a(r7)		; swap
	ld r13, a(r15)		;
	sd r13, a(r7)		;
	sd r12, a(r15)		;
	
	daddi r2, r2, 1
	j outerLoop
	
printArray:
	daddi r2, r0, 0
	
loopArray:
	slt r5, r3, r2
	bnez r5, done
	
	dadd r7, r2, r2
	dadd r7, r7, r7
	dadd r7, r7, r7
	
	ld r4, a(r7)
	
	dadd r10, r0, r4 
	sd r10, 0(r21)
	daddi r10, r0, 2
	sd r10, 0(r20)
	
	daddi r2, r2, 1
	j loopArray

done:
	halt