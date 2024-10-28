.section .data
    A: .quad 0
    B: .quad 0

.section .text
.globl _start

troca:
    pushq %rbp # empilha %rbp
    movq %rsp, %rbp # rbp aponta para novo R.A.
    subq $8, %rsp # long int z (em -8(%rbp))
    
    movq 16(%rbp), %rax # rax = x (endereço)
    movq (%rax), %rbx # rbx = *x (valor)

    movq %rbx, -8(%rbp)

    movq 24(%rbp), %rax # rax = y (endereço)
    movq (%rax), %rbx # rbx = *y (valor)

    movq 16(%rbp), %rax # rax = x (endereço), porq ele fez isso?
    
    movq %rbx, (%rax) # *x = *y

    movq -8(%rbp), %rbx # rbx = z
    movq 24(%rbp), %rax # %rax = y
    movq %rbx, (%rax) # *y = z

    addq $8, %rsp # libera espaço alocado para z
    popq %rbp
    ret

_start:
    movq $1, A
    movq $2, B
    pushq $B  # empilha endereço de B
    pushq $A # empilha endereço de A
    call troca

    addq $16, %rsp # libera espaço dos parametros
    movq A, %rdi
    movq $60, %rax
    syscall

