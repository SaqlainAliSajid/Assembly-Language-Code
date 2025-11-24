.model small
.stack 100h
.data
.code

main proc
    mov ax,@data
    mov ds,ax

    mov cl,1          ; counter 1–10

start_loop:
    xor ax,ax         ; IMPORTANT: clear AX before using MUL
    mov al,2
    mov bl,cl
    mul bl            ; AX = 2 × CL  ? correct result always

    ; ----- divide result for digit printing -----
    mov bl,10
    div bl            ; AL = tens, AH = units

    ; ----- print tens digit only if not zero -----
    cmp al,0
    je print_units

    add al,30h
    mov dl,al
    mov ah,2
    int 21h

print_units:
    add ah,30h
    mov dl,ah
    mov ah,2
    int 21h

    ; ----- new line -----
    mov dl,0Ah
    mov ah,2
    int 21h
    mov dl,0Dh
    mov ah,2
    int 21h

    inc cl
    cmp cl,5
    jne start_loop

    mov ah,4Ch
    int 21h

main endp
end main
