.section .data
    str1: .string "meu nome eh %s \n"

.section .text
.globl main

main:
    pushq %rbp
    movq %rsp, %rbp

    subq $32, %rsp # Locais para salvar rsi e rdi

    movq %rdi, -24(%rbp)  # Salva rdi (argc)
    movq %rsi, -32(%rbp) # salva rsi (argv[0)])

    movq -32 (%rbp), %rbx
    movq (%rbx), %rsi # segundo parametro: * arv[0]
    movq $str1, %rdi # primeiro parametro: $str1
    call printf

    movq -24(%rbp), %rdi # restaura rdi
    movq -32(%rbp), %rsi # restara rsi

    movq $0, %rdi
    movq $60, %rax
    syscall
