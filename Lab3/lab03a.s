.data
NInput: .string "Provide a positive integer N:\n"
inputError: .string "Please input a positive integer\n"
integerInputs: .string "Input an integer:\n"
productString: .string "The product of all these integers is "
newline: .string "\n"

.globl main
.text

main:

LOOPINIT:
	li t6, 1
	
WHILE:
	li a7, 4
	la a0, NInput
	ecall
	
	li a7, 5
	ecall
	mv t0, a0
	
	bge t0, t6, DONE
	
	li a7, 4
	la a0, inputError
	ecall
	
	li a7, 4
	la a0, newline
	ecall
	
	j WHILE

DONE:

LOOPINIT2:
	li t5, 0
	li t2, 1
	
WHILE2:
	li a7, 4
	la a0, integerInputs
	ecall
	
	li a7, 5
	ecall
	mv t1, a0
	
	mul t2, t2, t1
	
	addi t5, t5, 1
	beq t5, t0, DONE2
	
	j WHILE2
	
DONE2:
	li a7, 4
	la a0, productString
	ecall
	
	li a7, 1
	mv a0, t2
	ecall

	li a7, 10
	ecall
	