.data
A:  .word 0
B:  .word 1
C:	.word 101

.text
main:
	ld r1, A(r0)
	ld r2, B(r0)
	ld r3, C(r0)
loopy:
		
	beq r2, r3, done
	dadd r1, r1, r2
	daddi r2, r2, 1
	j loopy
		
done:
	halt
          
