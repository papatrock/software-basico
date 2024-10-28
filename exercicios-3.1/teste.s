.section .text
.globl _start

_start:
    # Acessa `argc` e `argv` a partir da pilha
    movq (%rsp), %rdi           # `argc` está em %rdi
    movq 8(%rsp), %rsi          # `argv` está em %rsi, aponta para a lista de argumentos

    # Verifica se argv[1] está disponível
    cmpq $1, %rdi               # Compara argc com 1 (verifica se argv[1] existe)
    jle exit                    # Se argc <= 1, sai (não há argv[1])

    # Carrega o segundo argumento (argv[1])
    movq 8(%rsi), %rdi          # Carrega argv[1] em %rdi

    # Converte o primeiro caractere de argv[1] para um número
    movb (%rdi), %al            # Carrega o primeiro byte de argv[1] em %al
    sub $'0', %al               # Converte o caractere ASCII para um número (0-9)

    # Configurações para syscall de saída
    movzx %al, %rdi             # Move o valor convertido para %rdi como código de saída
    movq $60, %rax              # Código da syscall para sys_exit
    syscall                     # Saída com o valor de argv[1] como código de saída

exit:
    movq $0, %rdi               # Se não houver argv[1], retorna 0
    movq $60, %rax              # Código da syscall para sys_exit
    syscall                     # Saída com o código 0

