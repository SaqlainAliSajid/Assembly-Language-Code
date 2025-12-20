DATA SEGMENT
    msg db 'Month = $'
DATA ENDS

CODE SEGMENT

START:
    MOV AX, DATA
    MOV DS, AX

    MOV AX, 0010011011100101B

    MOV CL, 5
    SHR AX, CL
    MOV BL, AL
    AND BL, 0Fh

    LEA DX, msg
    MOV AH, 09h
    INT 21h

    MOV AL, BL
    ADD AL, 30h
    MOV DL, AL
    MOV AH, 02h
    INT 21h

    MOV AH, 4Ch
    INT 21h

END START