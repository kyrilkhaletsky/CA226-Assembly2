.data
DATA:    .word 0x10008
CONTROL: .word 0x10000
A:  .word 0
B:  .word 1
C:	.word 101
.text
main:
	ld r4,DATA(r0)
	ld r20,CONTROL(r0)
	ld r1, A(r0)
	ld r2, B(r0)
	ld r3, C(r0)
loopy:
		
	beq r2, r3, done
	dadd r1, r1, r2
	daddi r2, r2, 1
	j loopy
		
done:
	sd r1,0(r4)
	daddi r1,r0,2
	sd r1,0(r20) 