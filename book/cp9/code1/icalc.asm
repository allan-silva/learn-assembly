;icalc.asm
extern printf
section .data
    number1     dq      128
    number2     dq      19
    neg_num     dq      -12
    fmt         db      "The numbers are %1d and %1d", 10, 0
    fmtint      db      "%s %1d", 10, 0
    sumi        db      "The sum is", 0
    difi        db      "The difference is", 0
    inci        db      "Number 1 Incremented:", 0
    deci        db      "Number 1 Decrementes:", 0
    sali        db      "Number 1 Shift left 2 (x4):", 0
    sari        db      "Number 1 Shift right 2 (/4):", 0
    sariex      db      "Number 1 Shift right 2 (/4) with sign extension:", 0
    multi       db      "The product is", 0
    divi        db      "The integer quotient is", 0
    remi        db      "The modulo is", 0

section .bss
    resulti     resq    1
    modulo      resq    1

section .text
    global main

main:
    push rbp
    mov rbp, rsp

; Displayng the numbers
    mov rdi, fmt
    mov rsi, [number1]
    mov rdx, [number2]
    mov rax, 0
    call printf

; adding
    mov rax, [number1]
    add rax, [number2]      ;add number 2 to rax
    mov [resulti], rax        ;mov sum to resulti
    ;displaying the result
    mov rdi, fmtint
    mov rsi, sumi
    mov rdx, [resulti]
    mov rax, 0
    call printf

; subtracting
    mov rax, [number1]
    sub rax, [number2]      ;subtract from rax
    mov [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, difi
    mov rdx, [resulti]
    mov rax, 0
    call printf

; incrementing
    mov rax, [number1]
    inc rax             ; increment rax with 1
    mov [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, inci
    mov rdx, [resulti]
    mov rax, 0
    call printf

; decrementing
    mov rax, [number1]
    dec rax             ; increment rax with 1
    mov [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, deci
    mov rdx, [resulti]
    mov rax, 0
    call printf

; shift arithmetic left
    mov rax, [number1]
    sal rax, 2              ;multiply rax by 4
    mov [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, sali
    mov rdx, [resulti]
    mov rax, 0
    call printf

; shift arithmetic right
    mov rax, [number1]
    sar rax, 2          ;divide by 4
    mov [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, sari
    mov rdx, [resulti]
    mov rax, 0
    call printf

; shift arithmetic  right with sign extionsion
    mov rax, [neg_num]
    sar rax, 2             ;divide rax by 4
    mov [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, sariex
    mov rdx, [resulti]
    mov rax, 0
    call printf

; multiply
    mov     rax, [number1]
    imul    qword [number2]     ;multiply rax by number2
    mov     [resulti], rax
    ;displaying the result
    mov rdi, fmtint
    mov rsi, multi
    mov rdx, [resulti]
    mov rax, 0
    call printf

; divide
    mov     rax, [number1]
    mov     rdx, 0          ;rdx must be zero before idiv
    idiv    qword [number2] ;divide rax by number2, modulo in rdx
    mov     [resulti], rax
    mov     [modulo], rdx
    ;displaying the result
    mov rdi, fmtint
    mov rsi, divi
    mov rdx, [resulti]
    mov rax, 0
    call printf
    ;displaying the modulo
    mov rdi, fmtint
    mov rsi, remi
    mov rdx, [modulo]
    mov rax, 0
    call printf


    mov rsp, rbp
    pop rbp
    ret