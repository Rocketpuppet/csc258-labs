.data
number_prompt: .string "Choose a postive number n"
newline: .string "\n"

.text
.global _start
_start:
	
# def main():
# n = input("Enter a number\n")
# print("The result is ", mystery(n))

#THIS CODE IS NOT CHATGPT :) 

li a7, 4
la a0, number_prompt
ecall

li a7, 5
ecall
mv t1, a0

li a7, 4
la a0, newline
ecall

mv a0, t1

jal func

li a7, 1
ecall

li a7, 10
ecall

func:
	beq a0, zero, baseCase
	
	
	#shift bit left by 1 to mulitply by 2. 
	slli t0, a0, 1
	#add negtive as per mystery function
	addi t0, t0, -1 
	
	#save ra and a0 in stack
	
	addi sp, sp, -8
	sw ra, 0(sp)
	sw t0, 4(sp)
	
	addi a0, a0, -1
	jal func #calling mystery(n-1)
	
	lw ra, 0(sp)
	lw t0, 4(sp)
	addi sp, sp, 8
	
	add a0, t0, a0
	jr ra
# def mystery(n):
# if n == 0:
# return 0
# return mystery(n-1) + 2*n - 1

baseCase:
	li a0, 0
	jr ra
	
	
