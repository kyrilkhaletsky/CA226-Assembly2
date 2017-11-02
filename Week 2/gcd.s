.data

CONTROL:	.word 0x10000
DATA:		.word 0x10008

A:	.word 102
B:	.word 36

.text

	ld r20,CONTROL(r0) 
	ld r21,DATA(r0)
	
	daddi r1,r0,0
	ld r2,A(r0)
	ld r3,B(r0)
	
loopy:
	beqz r2,doni
	dadd r5,r2,r0
	ddiv r2,r2,r3
	dmulu r6,r2,r3
	dsub r4,r5,r6
	dadd r2,r3,r0
	dadd r3,r4,r0	
j loopy
	
doni:
	sd r3, 0(r21)	
	daddi r1, r0, 2
	sd r1, 0(r20)

halt