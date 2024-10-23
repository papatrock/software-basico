.section .data
    A: .quad 0
    B: .quad 0
.section .text
.globl _start
soma:
    pushq %rbp # empilha %rbp
    movq %rsp, %rbp # %rbp aponta para este R.A.

    subq $16, %rsp # Aloca variaveis locais

    movq A, %rax
    movq %rax, -8(%rbp)
    
    movq B, %rax
    movq %rax, -16(%rbp)

    movq -8(%rbp), %rax
    movq -16(%rbp), %rbx

    addq %rbx, %rax


    addq $16, %rsp     # Libera variaveis locais
    popq %rbp          # Desempiha (restaura) %rbp
    ret       # retorna ao chamador

_start:
    movq $4, A
    movq $5, B
    call soma # empilha %rip e jmp soma
    
    movq %rax, A
    movq A, %rdi
    movq $60, %rax
    syscall 
