; fcalc.asm
extern printf
section .data
    number1     dq      9.0
    number2     dq      73.0
    fmt         db      "The number are %f and %f",10,0

    f_sum       db      "The float sum of %f and %f is %f",10,0
    f_dif       db      "The float difference of %f and %f is %f",10,0
    f_mul       db      "The float product of %f and %f is %f",10,0
    f_div       db      "The float division of %f and %f is %f",10,0
    f_sqrt      db      "The float squareroot of %f is %f",10,0
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp
; print numbers
    movsd       xmm0, [number1]
    movsd       xmm1, [number2]
    mov         rdi, fmt
    mov         rax, 2
    call        printf
;sum
    movsd       xmm2, [number1]     ; double precision float into xmm
    addsd       xmm2, [number2]     ;add double precision to xmm
        ;print result
        movsd       xmm0, [number1]
        movsd       xmm1, [number2]
        mov         rdi, f_sum
        mov         rax, 3      ; three floats
        call        printf

;difference
    movsd       xmm2, [number1]     ; double precision float into xmm
    subsd       xmm2, [number2]
        ;print result
        movsd       xmm0, [number1]
        movsd       xmm1, [number2]
        mov         rdi, f_dif
        mov         rax, 3      ; three floats
        call        printf

;product
    movsd       xmm2, [number1]     ; double precision float into xmm
    mulsd       xmm2, [number2]
        ;print result
        movsd       xmm0, [number1]
        movsd       xmm1, [number2]
        mov         rdi, f_mul
        mov         rax, 3      ; three floats
        call        printf

;division
    movsd       xmm2, [number1]     ; double precision float into xmm
    divsd       xmm2, [number2]
        ;print result
        mov         rdi, f_div
        movsd       xmm0, [number1]
        movsd       xmm1, [number2]
        mov         rax, 1
        call        printf

;squareroot
    sqrtsd          xmm1, [number1]
        ;result
        mov         rdi, f_sqrt
        movsd       xmm0, [number1]
        mov         rax,2
        call        printf

    mov rsp, rbp
    pop rbp
    ret

