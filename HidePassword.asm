data segment

password db 'numl06$'
prompt1 db 'Enter New Passwords'
updated db 'Password is Updated$'
ends

stack segment
    dw 128 dup(0)
ends

code segment
start:

main proc
    mov ax,data
    mov ds,ax

    lea si,password
    mov cx,6

    mov ah,9
    lea dx,prompt1
    int 21h

    mov ah,2 ;newline
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h

input:
    mov ah,8
    int 21h

    mov [si],al

    mov ah,2
    mov dl,"*"
    int 21h

    inc si
    inc di
loop input

    mov ah,2 ;newline
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h

;update section
    mov ah,9
    lea dx,updated
    int 21h

    mov ah,2 ;newline
    mov dl,0ah
    int 21h
    mov dl,0dh
    int 21h

    mov ah,9
    lea dx,password
    int 21h

finish:
;mp terminate
terminate:
    mov ah,4ch
    int 21h

    main endp

end main

ends

end start ; set entry point and stop the assembler.
