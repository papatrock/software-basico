.section .data
.section .text

.globl main

main:
    
    jp %rip
    # popq %rax

    movq %rax, %rdi
    movq $60, %rax
