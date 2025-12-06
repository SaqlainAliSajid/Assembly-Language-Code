.model small
.stack 100h
.data
    array db 50 dup(0)
    msg_prompt db "Enter string: $"
    newline db 0Dh, 0Ah, "$"

.code
main:
    mov ax, @data
    mov ds, ax

    ; Display prompt message
    mov ah, 09h
    lea dx, msg_prompt
    int 21h

    mov si, 0

read_loop:
    mov ah, 01h
    int 21h
    cmp al, 0Dh
    je input_done

    mov array[si], al
    inc si
    cmp si, 50
    je input_done
    jmp read_loop

input_done:
    mov array[si], '$'
    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Display the entered string
    mov ah, 09h
    lea dx, array
    int 21h

    ; Print newline
    mov ah, 09h
    lea dx, newline
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
end main