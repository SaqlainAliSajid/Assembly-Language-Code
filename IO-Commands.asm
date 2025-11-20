; multi-segment executable file template.
data segment
        ; add your data here!
        pkey db "press any key...$"
ends
stack segment
        dw    128 dup(0)
ends
code segment
start:
;FIRST
        MOV AH,1          ;SET AH TO 1 FOR INPUT
        INT 21H           ;INTERUPT FOR CONSOLE SCREEN TO TAKE INPUT

        MOV AH,2          ;SET AH TO 2 FOR INPUT
        MOV DL,AL         ;COPY AL TO DL TO DISPLAY
        INT 21H           ;OUTPUT DISPLAYED

        MOV BL,AL         ;NOW MOVE AL VALUE TO SOME REGISTER TO SAVE FROM COPY & LOSSING
;SECOND
        MOV AH,1          ; SET AH TO 1 FOR INPUT
        INT 21H

        MOV AH,2
        MOV DL,AL
        INT 21H

        MOV CL,AL
;THIRD
        MOV AH,1
        INT 21H

        MOV AH,2
        MOV DL,AL
        INT 21H

        MOV BH,AL
;FOURTH
        MOV AH,1
        INT 21H

        MOV AH,2
        MOV DL,AL
        INT 21H

        MOV CH,AL
;FIFTH
        MOV AH,1
        INT 21H

        MOV AH,2
        MOV DL,AL
        INT 21H
;PRACTICE
       ; MOV AX,DX
       ;MOV AX,DL
ends
