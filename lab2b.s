.data
# TODO: What are the following 5 lines doing? Assigning Varabiles 
promptA: .string "Enter an int A:\n"
promptB: .string "Enter an int B:\n"
even_: .string "Interger is even"
odd_: .string "Interger is odd"
resultAdd: .string "A + 42 = "
resultMul: .string "A * B = "
newline: .string "\n"
.globl main
.text
main:

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
	
li a7, 4
la a0, newline
ecall
	
li a7, 4 # Changes to print operation again
la a0, promptB  # Sets the value to be printed
ecall # Prints the value

li a7, 5 # Assings this back to user input operation 
ecall # Sends user input call.

mv t5, a0
#
la a4, 42
mv t1, a4

add t2, t1, t0 
sub t3, t5, t0 
li a7, 4 
la a0, resultAdd 
ecall

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
li a7, 4
la a0, newline
ecall
li a7, 10
ecall
