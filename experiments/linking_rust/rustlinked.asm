;rustlinked.asm

extern print_int_as_binary
extern say_hi

section .data
    numberOneId         db  "numberOne", 0
    numberOne           dq  1
    numberTwoId         db  "numberTwo", 0
    numberTwo           dq  2
    numberMinusOneId    db  "numberMinusOne", 0
    numberMinusOne      dq  -1
    numberMinusTwoId    db  "numberMinusOne", 0
    numberMinusTwo      dq  -2
section .bss
section .text
    global main
main:
    push rbp
    mov rbp, rsp

; call no parameter function
    call say_hi

; call function with two parameters
; identifier: The value identifier
; value: The 64bits integer value to display a log message with big endian bit order (I think)

    mov rdi, numberOneId    ; Identifier
    mov rsi, [numberOne]    ; Value
    mov rax, 0
    call print_int_as_binary

    mov rdi, numberTwoId    ; Identifier
    mov rsi, [numberTwo]    ; Value
    mov rax, 0
    call print_int_as_binary

    mov rdi, numberMinusOneId    ; Identifier
    mov rsi, [numberMinusOne]    ; Value
    mov rax, 0
    call print_int_as_binary

    mov rdi, numberMinusTwoId    ; Identifier
    mov rsi, [numberMinusTwo]    ; Value
    mov rax, 0
    call print_int_as_binary

    mov rsp, rbp
    pop rbp

    mov     rax, 60     ;60 = exit
    mov     rdi, 0      ;0 = success exit code
    syscall
