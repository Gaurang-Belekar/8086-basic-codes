DATA SEGMENT
 STRING DB 0AH, 02H, 0FH, 05H
 OPT DB ?
DATA ENDS

CODE SEGMENT
 ASSUME CS:CODE, DS: DATA
 START: MOV AX,DATA
        MOV DS,AX
        MOV CX, 04H
        MOV BL, 79H
        LEA SI, STRING
    UP: MOV AL,[SI]
        CMP AL,BL
        JGE NXT
        MOV BL,AL
   NXT: INC SI
        DEC CX
        JNZ UP

        MOV OPT,BL
        INT 21H
 END START
CODE ENDS
