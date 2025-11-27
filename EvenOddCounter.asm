.model small
.data
    array db 10, 23, 4, 9, 12, 6, 7, 18, 21, 20
    msg   db "Even numbers Count: $"

.code
main:
    mov ax, @data
    mov ds, ax
    mov si, 0
    mov cx, 10
    mov bl, 0
    mov dl, 2          ; ? this line was missing in picture, but MUST be there

check_loop:
    mov al, array[si]
    mov ah, 0
    div dl
    cmp ah, 0
    jne skip_inc

    inc bl

skip_inc:
    inc si
    loop check_loop

    ; Display message
    mov ah, 09h
    lea dx, msg
    int 21h

    mov al, bl
    mov ah, 0
    mov dl, 10
    div dl

    cmp al, 0
    je  print_units_only

    add al, 30h
    mov dl, al
    int 21h

print_units_only:
    mov al, ah
    add al, 30h
    mov dl, al
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
end main