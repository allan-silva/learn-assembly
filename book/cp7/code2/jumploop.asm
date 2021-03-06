;jumploop.asm
extern printf
section .data
    number  dq  1000000000
    fmt     db  "The sum from 0 to %1d is %1d", 10, 0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp
    mov rbx, 0  ;counter
    mov rax, 0  ;sum will be in rax
jloop:
    add rax, rbx
    inc rbx
    cmp rbx, [number]   ;number already rechaed ?
    jle jloop           ;jump not reached yet, loop
                        ;number reached continue
    mov rdi, fmt
    mov rsi, [number]
    mov rdx, rax
    mov rax, 0
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
    
    