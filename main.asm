%include "in_out.asm"

SECTION .data
    msg_func db "Функция: f(x)=7+2x",0
    msg_res  db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx
    pop edx
    sub ecx, 1
    mov esi, 0

next:
    cmp ecx, 0
    jz _end

    pop eax
    call atoi

    mov ebx, eax
    imul ebx, 2
    add ebx, 7

    add esi, ebx
    loop next

_end:
    mov eax, msg_func
    call sprintLF

    mov eax, msg_res
    call sprint

    mov eax, esi
    call iprintLF

    call quit