;shifts.asm
extern printf
section .data
    aByte           dq  1
    bFmt            db  "Current byte value %1d", 10, 0
section .bss
    bResult  resb   0
section .text
    global main
main:
    push rbp
    mov rbp, rsp

    mov rcx, 8
    xor rax, rax
    salLoop:
        mov rax, [aByte]
        sal rax, 1
        mov [aByte], rax

        push rcx

        mov rdi, bFmt
        mov rsi, [aByte]
        mov rax, 0
        call printf

        pop rcx

        loop salLoop

    mov rsp, rbp
    pop rbp
    ret
