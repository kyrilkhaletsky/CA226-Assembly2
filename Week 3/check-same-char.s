.data
str: .asciiz "H"
strs: .asciiz "H"
don: .asciiz "yes"
dons: .asciiz "no"
CONTROL: .word 0x10000
DATA:    .word 0x10008
.text

	ld r20,CONTROL(r0) 
	ld r21,DATA(r0)
	
	daddi r5,r0,0
	lb r3,str(r5)
	lb r4,strs(r5)
	
check:
	beq r3,r4,doni
	
	daddi r6,r0,dons	;no
	sd r6, 0(r21)	
	daddi r1, r0, 4	
	sd r1, 0(r20)	
	
	halt
	
doni:
	daddi r6,r0,don		;yes
	sd r6, 0(r21)	
	daddi r1, r0, 4	
	sd r1, 0(r20)	