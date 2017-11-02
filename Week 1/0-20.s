.data
B:		.word	0
C:		.word	2
N:		.word 	21
I:		.word	0
CONTROL: .word 0x10000
DATA:    .word 0x10008

.text
   ld r20,CONTROL(r0) 
   ld r21,DATA(r0)
   ld r2, B(r0)
   ld r3, N(r0)
   ld r5, I(r0)

loopy:
	beq r5, r3, doney
		sd r2, 0(r21)		
		ld r1, C(r0)		
		sd r1, 0(r20)
		daddi r5, r5, 1
		daddi r2, r2, 1
		j loopy
doney:
	halt