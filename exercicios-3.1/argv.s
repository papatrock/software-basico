.section .data

.section .text
.globl _start

_start:
    # Carrega o endereço de argv[1] (16 bytes acima de %rsp) em %rdi
    movq 16(%rsp), %rsi  # Carrega argv[1] no registrador %rsi

    # Configura a chamada sys_write para imprimir argv[1]
    movq $1, %rdi        # File descriptor para stdout (1)
    movq %rsi, %rsi      # Passa o ponteiro de argv[1] para %rsi
    movq $1, %rax        # syscall para sys_write
    syscall              # Faz a chamada para write

    # Saída do programa com código 0
    movq $60, %rax       # Número da syscall para sys_exit
    xor %rdi, %rdi       # Código de saída 0
    syscall

