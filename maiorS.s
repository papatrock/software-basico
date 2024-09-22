.section .data
    I: .quad 0
    MAIOR: .quad 0
    DATA_ITEMS: .quad 3 , 67 , 34 , 222 , 45 , 75 , 54 , 34 , 44 , 33 , 22 , 11 , 66 , 0
.section .text
.globl _start
_start:
    movq $0, %rdi
    movq DATA_ITEMS(, %rdi,8), %rbx # rbx = DATA_ITEMS[0] "8" = fator escada
    movq $1, %rdi
loop:
    movq DATA_ITEMS(, %rdi,8), %rax # %rax = DATA_ITESM[i]
    cmpq $0, %rax
    je fim_loop # if(DATA_ITEMS[I] == 0) sai
    cmpq %rbx, %rax
    jle fim_if  # se DATA_ITEMS [ i ] <= MAIOR , sai do " if "
    movq %rax, %rbx # MAIOR = DATA_ITEMS [ i ]
    fim_if:
    addq $1, %rdi
    jmp loop

    # return
fim_loop:
    movq %rbx , %rdi
    movq $60 , %rax
    syscall
