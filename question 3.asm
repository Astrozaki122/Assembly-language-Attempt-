global main
extern printf

SECTION .data
    printnum db " %d",0x0
    printfizz db "Divisble by 12",0x0
    printbuzz db "Divisble by 3",0x0
    printtest db "%d",0xa,0x0
    endprint db 0xa,0x0
    number dd 48
    age db 0

SECTION .text

main:
    mov ecx, 20         ; set counter to 20
ll:
    push ecx            ; store ecx on the stack
    call Divisble by 12
    call Divisble by 3
    call print
    push endprint
    call printf
    pop ebx
    inc DWORD [number]  ; increment number
    mov byte [age], 0  ; clear age
    pop ecx             ; retrieve counter from the stack
    loop ll
    call end

print:
    mov eax, [age]     ; move age into eax
    cmp eax, 0          ; check if flag is set
    jne END_PRINTNUM    ; if age is set don't print
    mov eax, [number]   ; move number into eax
    push eax            ; push eax onto the stack
    push printnum       ; push printnum message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
    pop ebx             ; clear stack
END_PRINTNUM:
    ret                 ; return

Divisble by 12
    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; move number into eax
    mov ebx, 12        ; move 12 into ebx
    div ebx             ; divide eax by ebx (12)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jnz END_FIZZ        ; if not 0 then end call
    inc byte [age]     ; set age to 1 - divisible by 12
    push printfizz      ; push printfizz message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
END_FIZZ:
    ret                 ; return


    mov edx, 0          ; set edx to 0
    mov eax, [number]   ; move number into eax
    mov ebx, 3         ; move 3 into ebx
    div ebx             ; divide eax by ebx (3)
    cmp edx, 0          ; check if edx is 0 (no remainder)
    jnz END_BUZZ        ; if not 0 then end call
    inc byte [age]     ; set flag to 1 - divisible by 3
    push printbuzz      ; push printbuzz message onto the stack
    call printf         ; call printf
    pop ebx             ; clear stack
END_BUZZ:
    ret                 ; return

end:
    mov eax, 1          ; set system exit call
    int 0x80            ; call operating system
    ret