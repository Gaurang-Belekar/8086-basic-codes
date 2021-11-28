DATA SEGMENT
MATRIX1 DB 1,2,3,4
MATRIX2 DB 1,2,3,4
N DW 2
ROW DB 2
COLUMN DB 2
N2 DB 4
RESULT DB 100 DUP(0)
COUNTER DW 3
ENDS
ASSUME CS:CODE,DS:DATA
CODE SEGMENT
START: MOV AX,DATA
       MOV DS,AX
       MOV ES,AX

       MOV BX,OFFSET MATRIX1
       MOV BP,OFFSET RESULT

       SUB BX,N
       DEC BX
       PUSH BX

NEW_ROW: MOV DI,OFFSET MATRIX2
         DEC DI
         POP BX
         ADD BX,N
         INC BX
         DEC BP
         MOV CX,N
         MOV COUNTER,CX

EACH_ROW: INC BP
          PUSH BX

          INC DI
          DEC COUNTER
          JE -1,NEW_ROW

COL: MOV AH.[BX]
     MOV AL,[DI]
     MUL AH

     ADD [BP],AL
     INC BX
     ADD DI,N
     DEC COLUMN
     JNZ COL
     MOV CX,N
     MOV COLUMN,CX
     POP BX
     DEC ROW
     JNZ EACH_ROW

     MOV AX, 4C00H
     INT 21H
     CODE ENDS
     END START
