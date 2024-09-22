.section .data
    A: .quad 0 # reservva 64 bits e inicia com 0 (tem q inicializar com 0)
    B: .quad 0 # same
.section .text
.globl _start
_start:
    movq $7, A # A = 7
    movq $6, B # B = 6
    movq A, %rax # rax = A
    movq B, %rbx # rbx = B
    addq %rax, %rbx # rbx = rbx + rax
    movq $60, %rax # syscall = exit
    movq %rbx, %rdi # rdi = rbx = soma
    syscall
    
