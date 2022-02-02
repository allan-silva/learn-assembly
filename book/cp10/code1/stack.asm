;stack.asm
extern printf
section .data
    strng       db      "ABCDE",0
    strgnLen    equ     $ - strng - 1   ;str len without 0
    fmt1        db      "The original string: %s", 10, 0
    fmt2        db      "The reversed string: %s", 10, 0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp

; print original string
    mov rdi, fmt1
    mov rsi, strng
    mov rax, 0
    call printf

; push the string char per char on the stack
    xor rax, rax        ; clear rax
    mov rbx, strng      ; address of the string in rbx (rbx can be optionally a base pointer)
    mov rcx, strgnLen
    mov r12, 0          ; use r12 as pointer
    pushLoop:
        mov al, byte[rbx+r12]   ;mov char into rax
        push rax                ; push rax on the stack
        inc r12                 ; increment char pointer
        loop pushLoop           ; ;continue loop

; pop the string char per char from stack
; this will reverse the string
    mov rbx, strng      ; address of the string in rbx (rbx can be optionally a base pointer)
    mov rcx, strgnLen   ;len in rcx counter
    mov r12, 0
    popLoop:
        pop rax                 ;pop a char from the stack
        mov byte[rbx+r12], al   ; move the char into the string
        inc r12
        loop popLoop
        mov byte[rbx+r12],0     ;terminate thr str with 0

; print the reversed string
    mov rdi, fmt2
    mov rsi, strng
    mov rax, 0
    call printf

    mov rsp, rbp
    pop rbp
    ret
