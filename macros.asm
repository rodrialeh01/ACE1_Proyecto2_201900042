print macro txt
    ; carga en memoria las variables del semento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    lea dx, txt
    int 21h
endm

getch macro
    mov ah, 01h
    int 21h
endm

cls macro
    mov ax, 03h
    int 10h
endm