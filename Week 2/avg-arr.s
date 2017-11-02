.data
CONTROL: .word 0x10000
DATA:    .word 0x10008

n: .word 20      ; There are 20 elements in array "a".
a: .word 23      ; a[0]
   .word 12      ; a[1]
   .word 19      ; a[2]
   .word 9       ; .
   .word 98      ; .
   .word 4       ; .
   .word 7
   .word 9
   .word 30405
   .word 21
   .word 16288
   .word 26483
   .word 9982
   .word 261
   .word 5025
   .word 18825
   .word 30405
   .word 9575
   .word 9575
   .word 25247   ; a[19]


.text

	ld r20,CONTROL(r0) 
	ld r21,DATA(r0)
	
	add.d f2,f0,f2
	daddi r3,r0, 0
	daddi r9,r0, 0
	ld r10,n(r0)

loopy:
	beq r10,r3,doni
	l.d f4, a(r9)
	add.d f2, f2,f4
	daddi r3,r3,1
	daddi r9,r9,8
	j loopy
	
doni:
	l.d f3, n(r0)
	div.d f2,f2,f3
	s.d f2, 0(r21)	
	daddi r1, r0, 3
	sd r1, 0(r20)
halt