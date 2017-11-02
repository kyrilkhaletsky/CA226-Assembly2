.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
a: .asciiz "Hello"
b: .asciiz " World"
c: .asciiz "XXXXXXXXXXX"

.text
main:

   ld r20,CONTROL(r0)
   ld r21,DATA(r0)

   daddi r1,r0,0
   daddi r2,r0,0

   daddi r10,r0,0 
   daddi r11,r0,5

loop2:
	beq r10,r11,done1
	
	lb r3, a(r1)
	sb r3, c(r1)
	
	daddi r1,r1,1
	daddi r2,r2,1
	daddi r10,r10,1
	j loop2

done1:
   daddi r1,r0,0
   daddi r6,r0,5  
   
   daddi r10,r0,0 
   daddi r11,r0,6

loop3:
	beq r10,r11,prin
	
	lb r4, b(r1)
	sb r4, c(r6)
	
	daddi r1,r1,1
	daddi r6,r6,1
	daddi r10,r10,1
	j loop3

prin:
   daddi r4,r0,c
   sd r4,0(r21)
   daddi r1,r0,4
   sd r1,0(r20)

halt