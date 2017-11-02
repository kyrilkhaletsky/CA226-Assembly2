.data
A:  .word 0
B:  .word 1
N:	.word 10

.text
main:
	ld r1, A(r0)
	ld r2, B(r0)
	ld r3, N(r0)
	daddi r3, r3, 1
loopy:
		
	beq r2, r3, done
	dadd r1, r1, r2
	daddi r2, r2, 1
	j loopy
		
done:
	halt