data segment
num1 dw 407h
num2 dw 508h
c dw ?
d dw ?
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax
       mov ax,num1
       mov bx,num2
       mul bx
       mov c,ax
       mov d,dx
       mov ah,4ch
       int 21h
       code ends
       end start

