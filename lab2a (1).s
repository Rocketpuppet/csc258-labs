.data
# TODO: What are the following 5 lines doing? Assigning Varabiles 
promptA: .string "Enter an int A:\n"
promptB: .string "Enter an int B:\n"
even_: .string "Interger is even"
odd_: .string "Interger is odd"
promptC: .string "Input an integer"
promptN: .string "TOO MANY TIMES"
resultAdd: .string "A + 42 = "
resultMul: .string "A * B = "
newline: .string "\n"
n: .word 4
.globl main
.text
main:
lw t6, n
li t4, 0

prompt1:


li a7, 4 
la a0, promptA 
ecall 
li a7, 5 
ecall
mv t0, a0 

IF1:
	li a1, 0
	andi t1, t0, 1
	beq a1, t1, EVEN
	j ODD
	
EVEN:
	li a7, 4
	la a0, even_
	ecall
ODD:
	li a7, 4
	la a0, odd_
	ecall

loopbody:

beq t4, t6, NTIMES

li a1, 1
andi t1, t0, 1
addi t4, t4, 1
beq a1, t1, prompt1


NTIMES:
li a7, 4
la a0, promptN
ecall


loopend:
li a7, 4
la a0, newline
ecall
li a7, 10
ecall



mv t5, a0
#
la a4, 42
mv t1, a4



mv a0, t2
ecall


li a7, 4
la a0, newline
ecall
li a7, 4
la a0, resultMul
ecall
mv a0, t3
li a7, 1
ecall
