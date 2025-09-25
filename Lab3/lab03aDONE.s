.data

productString: .string "The product of all these integers is "
newline: .string "\n"

array: .word 1, 2, 3, 4

.global main
.text

main:

	la a3, array
	li t2, 0
	
#la t0, promptN
#li t1, 0x48657921
#sw t1, 0(t0)

	lw t0, 0(a3)
	add t2, t2, t0

	lw t0, 4(a3)
	mul t2, t2, t0

	lw t0, 8(a3)
	mul t2, t2, t0

	lw t0, 12(a3)
	mul t2, t2, t0
	
	li a7, 4
	la a0, productString
	ecall

	li a7, 1
	mv a0, t2
	ecall

	li a7, 10
	ecall
	