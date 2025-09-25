.data
# TODO: What are the following 5 lines doing?
promptA: .string "Enter an int A:\n"
promptB: .string "Enter an int B:\n"
resultAdd: .string "A + B = "
resultMul: .string "A * B = "     
newline: .string "\n"

.globl main
.text

main:
    # TODO: Set a breakpoint here and step through.
    # What does this block of 3 lines do?
    li a7, 4
    la a0, promptA
    ecall

    # TODO: Set a breakpoint here and step through.
    # What does this block of 2 lines do?
    li a7, 5
    ecall
    mv t0, a0

    # TODO: What is the value of "promptB"? Hint: Check the
    # value of a0 and see what it corresponds to.
    li a7, 4
    la a0, promptB
    ecall

    # TODO: Explain what happens if a non-integer is entered
    # by the user.
    li a7, 5
    ecall
    # TODO: t stands for "temp" -- why is the value from a0
    # being moved to t1?
    mv t1, a0

    # TODO: What if I want to get A + 1 and B + 42 instead?
    add t2, t1, t0
    mul t3, t0, t1

    li a7, 4
    la a0, resultAdd
    ecall

    # TODO: What is the difference between "li" and "mv"?
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
