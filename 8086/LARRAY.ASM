DATA SEGMENT
 STRING DB 0AH, 11H, 01H, 04H, 0FH
 OPT DB ?
DATA ENDS

CODE SEGMENT
 ASSUME CS:CODE, DS: DATA
 START : MOV AX,DATA
         MOV DS,AX
         MOV CX, 04H
         LEA SI, STRING

     UP: MOV AL,[SI]
         CMP AL,BL
         JL NXT
         MOV BL,AL
     NXT: INC SI
          DEC CX
          JNZ UP

          MOV OPT,BL
          MOV AH, 4CH
          INT 21H
 END START
CODE ENDS
