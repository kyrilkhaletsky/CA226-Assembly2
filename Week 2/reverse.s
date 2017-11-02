.data
CONTROL: .word 0x10000
DATA:    .word 0x10008
str: .asciiz "dlroW olleH"

.text
main:

   ld r20,CONTROL(r0)
   ld r21,DATA(r0)

   daddi r1,r0,0 ; i

loop1:
   lb r3,str(r1)
   beqz r3,done1
   daddi r1,r1,1
   j loop1

done1:
   daddi r1,r1,-1 
   daddi r2,r0,0 

loop2:
   slt r5,r1,r2 
   bnez r5, prin

   lb r3,str(r1)
   lb r4,str(r2)
   sb r4,str(r1)
   sb r3,str(r2)

   daddi r1,r1,-1 
   daddi r2,r2,1 
   j loop2

prin:
   daddi r4,r0,str
   sd r4,0(r21)
   daddi r1,r0,4
   sd r1,0(r20)

halt
