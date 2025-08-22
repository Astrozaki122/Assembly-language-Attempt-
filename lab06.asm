#include<stdio.h>

global main
extern printf

SECTION .data
    odd db "%d is odd",0xa,0x0
    even db "%d is even",0xa,0x0
    db "%d times -1 is %d",0xa,0x0
    num dd 29753

SECTION .text

main:
    mov eax, [num]      ; mov num into eax
    mov ebx, 1          ; mov 1 into ebx
    and eax, ebx        ; logical and on eax and ebx
    jz EVEN             ; if 0 then num is even
ODD:                    ; number is odd
    mov eax, [num]      ; mov num into eax
    push eax            ; push eax onto stack
    call printf         ; call printf
    pop ebx             ; clear stack
    pop ebx
EVEN:                   ; number is even
    mov eax, [num]      ; mov num into eax
    push eax            ; push eax onto stack
    call printf         ; call printf
    pop ebx             ; clear stack
    pop ebx
NEGATIVE:
    mov eax, [num]      ; mov num into eax
    not eax             ; invert bits of eax
    inc eax             ; add 1 to eax
    push eax            ; push eax ( num) onto stack
    mov eax, [num]      ; mov num into eax
    push eax            ; push eax onto stack
    call printf         ; call printf
    mov eax, 1          ; set call for system exit
    int 0x80            ; call operating system