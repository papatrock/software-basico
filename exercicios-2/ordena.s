.section .data
    I: .quad 0
    MAIOR: .quad 0
    DATA_ITEMS: .quad 4,5,3
    # 3 , 67 , 34 , 222 , 45 , 75 , 54 , 34 , 44 , 33 , 22 , 11 , 66 , 0
.section .text
.globl _start
_start:
    # rcx = i, rdx = vetor[i]
    movq $0, %rdi
    # rcx = j, rdx = vetor[j]

ordena_vet:
    cmp $3, %rdi # Se rdi > n, sai do loop i
    jge fim_ordena_vet
    movq DATA_ITEMS(, %rdi,8), %rax # %rax = DATA_ITESM[i]
    # rax = menor naquele loop
    movq %rdi, %rcx
    addq $1,%rcx

loop_j:
    cmp $3, %rcx
    jge fim_loop_j

    movq DATA_ITEMS(, %rcx,8), %rdx
    cmp %rax, %rdx
    jl troca_valor
    jmp fim_troca
fim_troca:
    addq $1, %rcx
    jmp loop_j

troca_valor:
    movq %rdx, DATA_ITEMS(, %rdi,8)
    movq %rax, DATA_ITEMS(, %rcx,8)
    jmp fim_troca

fim_loop_j:
    addq $1,%rdi    
    jmp ordena_vet

    # return
fim_ordena_vet:
    movq %rdx , %rdi
    movq $60 , %rax
    syscall
