global main
extern printf

SECTION .data
    printnum db " Even number %d",0x0
    printfizz db "fizz",0x0
    printbuzz db "buzz",0x0
    printtest db " odd number",0xa,0x0
    endprint db 0xa,0x0
    number dd 1
    number db 0

SECTION .text

main:
    mov ecx, 20         ; set counter to 20
ll:
    push ecx            ; store ecx on the stack
    call fizz
    call buzz
    call print
    push endprint
    call printf
    pop ebx
    inc DWORD [number]  ; increment number
    mov byte [number], 0   ; clear number
    pop ecx             ; retrieve counter from the stack
    loop ll
    call end

print:
    mov eax, [number]     ; move age into eax
    cmp eax, 0          ; check if number is set
    jne END_PRINTNUM    ; if age is set don't print
    mov eax, [number]   ; move number into eax
    push eax            ; push eax onto the stack
    push printnum       ; push printnum message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
    pop ebx             ; clear stack
END_PRINTNUM:
    ret                 ; return

fizz:
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; move number into eax
    mov ebx, odd number       ; move odd  into ebx
    div ebx             ; odd number eax by ebx (odd)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jnz END_FIZZ        ; if not 0 then end call
    inc byte [age]     ; set age to 1 - odd number
    push printfizz      ; push printfizz message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
END_FIZZ:
    ret                 ; return

buzz:
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; move number into eax
    mov ebx, even       ; move 12 into ebx
    div ebx             ; even number eax by ebx (even)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jnz END_BUZZ        ; if not 0 then end call
    inc byte [age]     ; set number to 1 - even number
    push printbuzz      ; push printbuzz message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
END_BUZZ:
    ret                 ; return

end:
    mov eax, 1          ; set system exit call
    int 0x80            ; call operating system
    ret