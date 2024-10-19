
.data

array: .word 1, 0, 1, 12, 0, 1, 4

.text

    la a0, array
    li a1, 7    # unsigned
    li a2, 1
prog:
    beq a1, zero, none # if the array is empty return null
    slli a1, a1, 2     # get the size of the array in bytes
    add s0, a0, a1     # start right after the array
next:
    addi s0, s0, -4    # move to the previous element
    lw a1, 0(s0)       # get the current element
    beq a1, a2, done   # return if the current element is equal to a2
    bne s0, a0, next   # if there are more elements repeat
none:
    addi s0, zero, 0   # return null (this is skipped if a2 is found)
done:
    addi a7, zero, 10 
    ecall
