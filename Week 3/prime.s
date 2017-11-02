.data
msg:		.ascii	"Plese enter number: "
emsg:		.ascii	"Plese enter number greater than 1: "
a:			.word	2
			.word	3
			.word	5
			.word	7
CONTROL:	.word	0x10000 
DATA:		.word	0x10008

.text
main:
	ld r20, CONTROL(r0)
	ld r21, DATA(r0)
	
	daddi r10, r0, msg 
	sd r10, 0(r21)
	daddi r10, r0, 4
	sd r10, 0(r20)
	
	daddi r9, r0, 8		
	sd r9, 0(r20)
	ld r9, 0(r21)
	
	daddi r1, r0, 2
	beq r1, r9, printBase
	
	slti r8, r9, 2
	bnez r8, tryAgain
	
	daddi r9, r9, 1
	
	j outerLoop
	
tryAgain:
	daddi r10, r0, emsg 
	sd r10, 0(r21)
	daddi r10, r0, 4
	sd r10, 0(r20)
	
	daddi r9, r0, 8		
	sd r9, 0(r20)
	ld r9, 0(r21)
	
	slti r8, r9, 2
	bnez r8, tryAgain
	
	j outerLoop
	
printBase:
	dadd r10, r0, r1 
	sd r10, 0(r21)
	daddi r10, r0, 2
	sd r10, 0(r20)
	
	j done
	
outerLoop:
	beq r1, r9, done
	
	daddi r2, r0, 0
	
	slti r12, r1, 7
	bnez r12, checkList
	
	j innerLoop
	
checkList:
	slti r7, r2, 4
	beqz r7, endCheck
	
	dadd r11, r2, r2
	dadd r11, r11, r11
	dadd r11, r11, r11
	
	ld r6, a(r11)
	
	beq r6, r1, endInner
	
	daddi r2, r2, 1
	j checkList
	
endCheck:
	daddi r1, r1, 1
	j outerLoop
	
innerLoop:
	slti r7, r2, 4
	beqz r7, endInner
	
	dadd r11, r2, r2
	dadd r11, r11, r11
	dadd r11, r11, r11
	
	ld r6, a(r11)
	
	ddiv r3, r1, r6
	dmul r4, r3, r6
	dsub r5, r1, r4
	beqz r5, breakInner
	
	daddi r2, r2, 1
	j innerLoop
	
endInner:
	dadd r10, r0, r1 
	sd r10, 0(r21)
	daddi r10, r0, 2
	sd r10, 0(r20)
	
	daddi r1, r1, 1
	j outerLoop
	
breakInner:
	daddi r1, r1, 1
	j outerLoop
	
done:
	halt