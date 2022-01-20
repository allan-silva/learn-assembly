;betterloop.asm
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
    mov rcx, [number]   ;initialize rcx with number
    mov rax, 0
bloop:
    add rax, rcx        ;add rcx to sum
    loop bloop          ;loop while dereasing rcx with 1
                        ;until rcx = 0
    mov rdi, fmt        ;rcx=0 continue here
    mov rsi, [number]   ;sum to be displayed
    mov rdx, rax
    mov rax, 0
    call printf
    
    mov rsp, rbp
    pop rbp
    ret
    