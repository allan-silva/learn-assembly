; hello.asm
section .data
    msg db "hello, world", 10, 0    ;10 is the decimnal repr of new line. Compare with code2, there is no additional syscall
section .bss
section .text
    global main
main:
    mov     rax, 1      ;1 = write
    mov     rdi, 1      ;1 to stdout
    mov     rsi, msg    ;string to display in rsi
    mov     rdx, 13     ;len of string without 0 --- Updated to 13, to fit the new 10 char.
    syscall             ;display the string
    mov     rax, 60     ;60 = exit
    mov     rdi, 0      ;0 = success exit c ode
    syscall
