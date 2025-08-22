section .data 
        msg db "My name is Sakariya and my cohort work together to solve task my computing skills are good but it needs more practise and my expectations are to get a decent grade, the type of collueagues that i want to work with is someone who gives me brilliant ideas and solve the problem together throughout the term.."
        len: equ $-msg

secton .text
       
main:
       mov edx, len
       mov ecx, msg
       mov ebx, 1
       mov eax, 4
       int 0x80
       mov eax, 1
       mov edx, 0
       int 0x80
