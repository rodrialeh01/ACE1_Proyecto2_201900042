;macro para imprimir en pantalla
print macro txt
    ; carga en memoria las variables del semento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    lea dx, txt
    int 21h
endm
;macro para obtener un dato
getch macro
    mov ah, 01h
    int 21h
endm
;macro para limpiar la pantalla
cls macro
    mov ax, 03h
    int 10h
endm
;macro para imprimir un numero
printn macro n
    mov ax, 0
    mov al, n
    div baux

    mov naux[0], al
    mov naux[1], ah
    ;48 para que al sumarlo de el ascii, solo es para mostrarlo en 2 digitos
    add naux[0], 48
    add naux[1], 48

    lea dx, naux
    mov ah, 09h
    int 21h
endm