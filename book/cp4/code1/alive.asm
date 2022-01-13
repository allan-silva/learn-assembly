;alive.asm
section .data
    msg1    db  "Hello, World!", 10, 0
    msg1Len equ $-msg1-1    ;measure the len minus the 0
    msg2    db  "Alive and Kicking!", 10, 0
    msg2Len equ $-msg2-1    ;measure the len minus the 0
    radius  dq  357
    pi      dq  3.14
section .bss
section .text
    global main
main:
    push    rbp         ; function prologue
    mov     rbp, rsp    ; function prologue
    mov     rax, 1      ; 1 = write
    mov     rdi, 1      ; 1 = to stdout
    mov     rsi, msg1
    mov     rdx, msg1Len
    syscall
    mov     rax, 1
    mov     rdi, 1
    mov     rsi, msg2
    mov     rdx, msg2Len
    syscall
    mov     rsp, rbp    ; function epilogue
    pop     rbp         ; function epilogue
    mov     rax, 60
    mov     rdi, 0
    syscall
