.section .text
.globl _start
_start:
    movq $0, %rax
    movq $10, %rbx
loop:
    cmpq %rbx, %rax # compara o SEGUNDO argumento com o primero
    je fim_loop # if (rax > rbx )
    add $1, %rax
    jmp loop
fim_loop:
    movq $60, %rax
    movq %rax, %rdi
    syscall
