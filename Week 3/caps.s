.data
str:		.asciiz	"Hello World!"
result:		.asciiz	"XXXXXXXXXXXX"
CONTROL:	.word	0x10000 
DATA:		.word	0x10008

.text
main:
	ld r20, CONTROL(r0)
	ld r21, DATA(r0)
	
findLen:
	lb r3, str(r1)
	beqz r3, setup
	daddi r1, r1, 1
	j findLen
	
setup:
	daddi r1, r1, -1
	daddi r2, r0, 0
	daddi r3, r0, 96
	
loopy:
	slt r6, r1, r2
	bnez r6, done
	
	lb r4, str(r2)
	slt r7, r3, r4
	bnez r7, lowSwap
	
	sb r4, result(r2)
	
	daddi r2, r2, 1
	j loopy
	
lowSwap:
	daddi r4, r4, -32
	sb r4, result(r2)
	
	daddi r2, r2, 1
	j loopy
	
done:
	daddi r10, r0, result
	sd r10, 0(r21)
	daddi r10, r0, 4
	sd r10, 0(r20)
	
	halt