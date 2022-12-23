;macro para imprimir en pantalla
print macro txt
    ; carga en memoria las variables del segmento de datos
    mov ax, @data
    mov ds, ax

    ; impresion por pantalla
    mov ah, 09h
    lea dx, txt
    int 21h
endm
;macro para hacer una pausa
pausa macro
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
    ;limpia la variable de texto
    mov naux[0], '0'
    mov naux[1], '0'
    mov naux[0], al
    mov naux[1], ah
    ;48 para que al sumarlo de el ascii, solo es para mostrarlo en 2 digitos
    add naux[0], 48
    add naux[1], 48

    lea dx, naux
    mov ah, 09h
    int 21h
endm
;imprime los numeros
printnum macro num 
    mov al, num
    AAM
    mov bx,ax
    mov ah, 02h
    mov dl,bh
    add dl, 30h
    int 21h

    mov ah, 02h
    mov dl,bl
    add dl, 30h
    int 21h 
endm
;obtiene el texto del numero ingresado por el usuario
getNumero macro var
    LOCAL n1,n2,salir
    limpiarNumero numtextaux
    mov ah, 0ah
    lea dx, textaux
    int 21h
    cmp longtextaux,1
    je n1
    cmp longtextaux,2
    je n2
    n1:
        mov al,numtextaux
        sub al, 30h
        mov var, al
        jmp salir
    n2:
        mov unidades,0
        mov decenas,0

        mov al, numtextaux[0]
        sub al, 30h
        mov decenas, al

        mov al, numtextaux[1]
        sub al, 30h
        mov unidades, al

        mov al, decenas
        mov bl, 10
        mul bl
        add al, unidades
        mov var, al
    salir:
endm
;limpia la variable de texto
limpiarNumero macro text
    LOCAL repetir
    xor bx, bx
    mov cx, lengthof text
    repetir:
        mov text[bx], '$'
        inc bx
    loop repetir
endm
;macro para realizar la multiplicacion
multiplicar macro coefi, expo, total
    mov al, coefi
    mov bl, expo
    mul bl
    mov total, al
    mov ax, 0000h
    mov al, bl
endm