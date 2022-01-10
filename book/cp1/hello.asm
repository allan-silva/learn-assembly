; hello.asm
section .data
    msg db "hello, world", 0
section .bss
section .text
    global main
main:
    mov     rax, 1      ;1 = write
    mov     rdi, 1      ;1 to stdout
    mov     rsi, msg    ;string to display in rsi
    mov     rdx, 12     ;len of string without 0
    syscall             ;display the string
    mov     rax, 60     ;60 = exit
    mov     rdi, 0      ;0 = success exit c ode
    syscall
