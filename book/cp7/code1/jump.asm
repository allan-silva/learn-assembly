;jump.asm
extern printf
section .data
    number1 dq  42
    number2 dq  41
    fmt1    db  "Number1 >= Number2", 10, 0
    fmt2    db  "Number1 < Number2", 10, 0
section .bss
section .text
    global main
main:
    mov rbp, rsp; for correct debugging
    push rbp
    mov rbp, rsp
    
    mov rax, [number1]  ;move numbers to registers
    mov rbx, [number2]
    cmp rax, rbx        ;compare rax with rbx
    jge greater         ;rax greater or equal, go to greater:
    
    mov rdi, fmt2       ;rax is smaller, continue here
    mov rax, 0          ; no xmm
    call printf
    jmp exit            ; jump to label exit

greater:
    mov rdi, fmt1
    mov rax, 0
    call printf

exit:
    mov rsp, rbp
    pop rbp
    ret