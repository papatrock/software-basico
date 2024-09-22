# 2.1 Proponha uma forma de tradução para os comandos
#   “for”, “switch” e “do .. while”.
# 2.2 Desenhe uma figura semelhante à Figura 2 detalhando
#   onde é mapeada a seção text e a seção data.
# 2.3 Altere o algoritmo 2.15 para ordenar o vetor.

.section .data
.section .text
.global _start
_start:
    movq $0, %rax
# -----FOR--------
for_loop:               
    cmpq $10, %rax
    je fim_for_loop
    cmpq $7, %rax
    je fim_for_loop
    addq $1, %rax
    jmp for_loop
fim_for_loop:
# ------FIM FOR -----

# -------SWITCH-------
    cmp $7, %rax
    je case_7
    cmp $10, %rax
    je case_10
    cmp $11, %rax
    je case_11
    # .....default
    jmp default_case
case_7:
    addq $7, %rax
    jmp fim_case
case_10:
    addq $10, %rax
    jmp fim_case
case_11:
    addq $11, %rax
    jmp fim_case
default_case:
    addq $50, %rax
    jmp fim_case

fim_case:

# -------SWITCH FIM -------

# ---- DO WHILE -----------
do:
    subq $1, %rax
    cmp $0, %rax
    je fim_do_while
    jmp do
fim_do_while: 

# ----- FIM DO WHILE-------
    movq %rax, %rdi
    movq $60, %rax
    syscall
    