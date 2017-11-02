.data

n: .word 100      ; There are 20 elements in array "a".
a: .word 1      ; a[0]
   .word 3      ; a[1]
   .word 3      ; a[2]
   .word 3       ; .
   .word 6      ; .
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
   .word 1   ; a[19]

.text
	ld r10,n(r0)
	daddi r9,r0, 0
	daddi r8,r8,1

loopy:
	beqz r10,doni
	ld r4, a(r9)
	dsub r10,r10,r8
	dsll r5,r4,1       ;1 to multiply by 2, and 2 to multiply by 4
	dadd r4,r4,r5
	sd r4,a(r9)
	j loopy
	daddi r9,r9,8
doni:
halt