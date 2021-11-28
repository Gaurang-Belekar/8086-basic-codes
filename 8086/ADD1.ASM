data segment
num1 dw 0fe1ch
num2 dw 0A234h
sum dw ?
carry db 00h
data ends
code segment
assume cs:code,ds:data
start: mov ax,data
       mov ds,ax
       mov ax,num1
       mov bx,num2
       add ax,bx
       jnc skip
       inc carry
skip: mov sum,ax
       mov ah,4ch
       int 21h
       code ends
       end start
