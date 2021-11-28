DATA SEGMENT
A1 DB 3AH,32H,45H,E6H,45H
DATA ENDS
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START: MOV AX,DATA
       MOV DS,AX
       MOV CH,04H

LOOP2: MOV CL,04H
       LEA SI,A1

LOOP1: MOV SI, 1500
       MOV AL,[SI]
       MOV BL,[SI+1]
       CMP AL,BL
       JNC DOWN
       MOV DL,[SI+1]
       XCHG [SI],DL
       MOV [SI+1],DL

DOWN: INC SI
      DEC CL
      JNZ LOOP1
      DEC CH
      JNZ LOOP2
      MOV AH,4CH
      INT 21H

      CODE ENDS
      END START

