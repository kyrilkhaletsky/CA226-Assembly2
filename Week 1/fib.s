.data
A:	.word 1
B:	.word 17

C:  .word 2		
CONTROL:	.word 0x10000
DATA:		.word 0x10008

.text
main:
	dadd r1, r1, r0
	ld r2, B(r0)
	ld r3, A(r0)
	ld r4, A(r0)

	ld r20, CONTROL(r0)
	ld r21, DATA(r0)

	sd r1, 0(r21)		
	ld r1, C(r0)		
	sd r1, 0(r20)	

	sd r3, 0(r21)	
	sd r1, 0(r20)	
	
	sd r3, 0(r21)	
	sd r1, 0(r20)


while:
	beqz r2, finish	
	dadd r1, r4, r0
	dadd r4, r4, r3
	dadd r3, r1, r0	

	sd r4, 0(r21)		
	ld r1, C(r0)	
	sd r1, 0(r20)		

	daddi r2, r2, -1

	j while

finish:
	halt