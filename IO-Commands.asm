;TASK 1 : Print odd numbers from 1 to 100

    ; multi-segment executable file tenplate.
data segment
    ; add your data here!
    pkey db "press any key...$"
ends
stack segment
    dw 128 dup(0)
ends
code segment
start:
    mov CL,01
check:
    CMP CL,100
    JAE exit ; IF (CL >= 100)
    JMP print ; CL < 100
print:
    mov ah,0 ; clearing ah
    ; move cl to al and splitting it to two digits
    mov al,cl
    mov bh,10
    DIV bh
    ; saving remainder in dh
    mov dh,ah
    MOV AH,2
    ; printing quotient
    mov dl,al
    add dl,30h
    int 21h
    MOV AH,2
    ; printing remainder
    mov dl,dh
    add dl,30h
    int 21h
    ; new line
    MOV DL, 0AH
    MOV AH, 02H
    INT 21H
    ; carriage return
    MOV DL, 0DH
    MOV AH, 02H
    INT 21H

    mov ax,0
    ; Adding 2 and looping again
    ADD CL,2
    JMP check
exit:
ends
end start ; set entry point and stop the assembler.
