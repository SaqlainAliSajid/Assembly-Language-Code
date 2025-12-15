.model small
.stack 100h
.data
    prompt      db 'Enter a string (lowercase a-z only): $'
    prompt_msg  db 0Dh,0Ah,'Converted string: $'
    newline     db 0Dh,0Ah,'$'
    inputArray  db 256 dup(?)

.code
main:
    mov ax, @data
    mov ds, ax
    mov es, ax

    lea dx, prompt
    mov ah, 09h
    int 21h

    lea di, inputArray
    xor cx, cx          ; ? CHANGED: start CX = 0 (instead of 256)

read_loop:
    mov ah, 01h
    int 21h
    cmp al, 13          ; Enter key
    je  convert

    mov [di], al
    inc di
    inc cx              ; count characters
    cmp cx, 255         ; ? CHANGED: stop at 255 (leave space for $)
    jne read_loop

convert:
    mov byte ptr [di], '$'   ; ? ADDED: put $ at the end

    lea dx, newline
    mov ah, 09h
    int 21h

    lea dx, prompt_msg
    mov ah, 09h
    int 21h

    lea si, inputArray

process_loop:
    cmp byte ptr [si], '$'
    je  done

    mov al, [si]
    cmp al, 'a'
    jb  skip_convert
    cmp al, 'z'
    ja  skip_convert
    and al, 11011111b        ; convert to uppercase

skip_convert:
    mov dl, al
    mov ah, 02h
    int 21h

    inc si
    jmp process_loop

done:
    lea dx, newline
    mov ah, 09h
    int 21h

    mov ah, 4Ch
    int 21h
end main