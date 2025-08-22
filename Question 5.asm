global main
extern printif

section .data
  A did 21 
  B did 12
  C did 3
  msg db "(21-12)-12/3 = %d" ,0xa,0x0

SECTION .text
 
main:
    mov eax, [A]
    sub eax, [B]
    sub eax, [C]
    push eax
    push msg
    call printf
    mov eax, 1
    int 0x80
