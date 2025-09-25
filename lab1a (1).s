.data
# TODO: What are the following 5 lines doing? Assigning Varabiles 
promptA: .string "Enter an int A:\n"
promptB: .string "Enter an int B:\n"
resultAdd: .string "A + 42 = "
resultMul: .string "A * B = "
newline: .string "\n"
.globl main
.text
main:
# TODO: Set a breakpoint here and step through.
# What does this block of 3 lines do? assings a0 to the value of promptA. (The users first number)
li a7, 4 #I think 4 is the numerical call for print?
la a0, promptA #Assgines what value is being printed. Not sure how a0 and a7 are related thoguh.
ecall #Calls the print
# TODO: Set a breakpoint here and step through.
# What does this block of 2 lines do?
li a7, 5 
ecall
mv t0, a0 

li a7, 4 # Changes to print operation again
la a0, promptB  # Sets the value to be printed
ecall # Prints the value
# TODO: Explain what happens if a non-integer is entered
# by the user. May crash since registers can only contain numerical values.
li a7, 5 # Assings this back to user input operation 
ecall # Sends user input call.
# TODO: t stands for "temp" -- why is the value from a0
mv t5, a0
# being moved to t1? The value must be stored for later use at the end of the program to add int A and int B together.
la a4, 42
mv t1, a4 # moves a0 (at this time the result of prompt B) to tempory register 1
# TODO: What if I want to get A + 1 and B + 42 instead?
add t2, t1, t0 #adds the data in temp register 1 and temp register 0 and sends that result to temp regsiter 2
sub t3, t5, t0 # muliptles the data in temp regisetr 1 and temp regiser 0 and sents that result to temp register 2
li a7, 4 # loads the print method in a7 register
la a0, resultAdd # prints using the resultadd variable (NOT THE ADDTION RESULT)
ecall
# TODO: What is the difference between "li" and "mv"? #li assigns a numerical call to a register. mv moves a value from a register to a rempory register
li a7, 1
mv a0, t2
ecall
# TODO: Why is the next block of three lines needed?
# Remove them and explain what happens.
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