; hello.asm
extern  printf      ; external function from C lang
section .data
    msg     db "hello, world", 0
    fmtstr  db "This is our string: %s", 10, 0  ; print format
section .bss
section .text
    global main
main:
    push    rbp
    mov     rbp, rsp
    mov     rdi, fmtstr ; first argument of printf
    mov     rsi, msg    ; seconf arg of printf
    mov     rax, 0
    call    printf
    mov     rsp, rbp
    pop     rbp
    mov     rax, 60     ;60 = exit
    mov     rdi, 0      ;0 = success exit c ode
    syscall
