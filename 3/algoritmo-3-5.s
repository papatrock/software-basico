.section .data
    A: .quad 0
    B: .quad 0
.section .text
.globl _start

soma:
    pushq %rbp
    movq %rsp, %rbp

    # aloca espaço variavel local Z
    subq $8, %rsp # -8 de rsp = Z
    movq 16(%rbp), %rax
    addq %rax, -8(%rbp)

    movq 24(%rbp), %rax
    addq %rax, -8(%rbp)

    movq -8(%rbp), %rax

    # desaloca
    add $8, %rsp


    popq %rbp
    ret

_start:
    movq $4, A # a
    movq $5, B # b

    # empilha parametros
    pushq A
    pushq B
    call soma
    addq $16, %rsp # ??

    # return
    movq %rax, %rdi # Coloca o retorno da soma no rdi   
    movq $60, %rax
    syscall
