.data
str: .asciiz "dlroW olleH"
CONTROL: .word 0x10000
DATA:    .word 0x10008
.text
	
	daddi r4, r0, str
	ld r20,CONTROL(r0) 
	ld r21,DATA(r0)
	
	sd r4, 0(r21)	
	daddi r1, r0, 4	
	sd r1, 0(r20)	