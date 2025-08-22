global main
extern printf

SECTION .data
    A dd 24
    B dd 12
    msg db "24 / 12 = %d",0xa,0x0

SECTION .text

main:
    mov eax, [A]
    mov ebx, [B]
    mul ebx             ; Division eax by value in ebx. Stored in eax
    push eax
    push msg
    call printf
    mov eax, 1
    int 0x80
