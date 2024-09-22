.section .data
.section .text
.globl _start # .global tb é aceito (????)
_start :
    movq $60 , % rax # % rax := 60
    movq $13 , % rdi # % rdi := 13
    syscall