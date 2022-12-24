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
;macro para realizar la division
dividir macro coefi, expo, total
    mov al, coefi
    mov bl, expo
    div bl
    mov total, al
    mov ax, 0000h
    mov al, bl
endm

printFunc macro c5, c4, c3, c2, c1, c0
    LOCAL COF5,COF4,COF3,COF2,COF1,COF0,PR5,PR4,PR3,PR2,PR1,PR0,salir
    print msg
    cmp c5 , 0
    je COF4
    jne COF5
    COF5:
        cmp c5 , 0
        je COF4
        jne PR5
    PR5:
        printn c5
        print x5
        print mas
    COF4:
        cmp c4, 0
        je COF3
        jne PR4
    PR4:
        printn c4
        print x4
        print mas
    COF3:
        cmp c3, 0
        je COF2
        jne PR3
    PR3:
        printn c3
        print x3
        print mas
    COF2:
        cmp c2, 0
        je COF1
        jne PR2
    PR2:
        printn c2
        print x2
        print mas
    COF1:
        cmp c1, 0
        je COF0
        jne PR1
    PR1:
        printn c1
        print x1
        print mas
    COF0:
        printn c0
    salir:

    print ln
endm

printDerivada macro c4, c3, c2, c1, c0
    LOCAL COF4,COF3,COF2,COF1,COF0,PR4,PR3,PR2,PR1,PR0,salir
    print msgDerivada
    print ln
    cmp c4 , 0
    je COF3
    jne COF4
    COF4:
        cmp c4, 0
        je COF3
        jne PR4
    PR4:
        printn c4
        print x4
        print mas
    COF3:
        cmp c3, 0
        je COF2
        jne PR3
    PR3:
        printn c3
        print x3
        print mas
    COF2:
        cmp c2, 0
        je COF1
        jne PR2
    PR2:
        printn c2
        print x2
        print mas
    COF1:
        cmp c1, 0
        je COF0
        jne PR1
    PR1:
        printn c1
        print x1
        print mas
    COF0:
        printn c0
    salir:

    print ln
endm

printIntegral macro c5, c4, c3, c2, c1, c0
    LOCAL COF5,COF4,COF3,COF2,COF1,COF0,PR5,PR4,PR3,PR2,PR1,PR0,salir
    print msgIntegral
    print ln
    cmp c5 , 0
    je COF4
    jne COF5
    COF5:
        cmp c5 , 0
        je COF4
        jne PR5
    PR5:
        printn c5
        print x6
        print mas
    COF4:
        cmp c4, 0
        je COF3
        jne PR4
    PR4:
        printn c4
        print x5
        print mas
    COF3:
        cmp c3, 0
        je COF2
        jne PR3
    PR3:
        printn c3
        print x4
        print mas
    COF2:
        cmp c2, 0
        je COF1
        jne PR2
    PR2:
        printn c2
        print x3
        print mas
    COF1:
        cmp c1, 0
        je COF0
        jne PR1
    PR1:
        printn c1
        print x2
        print mas
    COF0:
        printn c0
        print x1
        print mas
    salir:
    
    print constant
    print ln
endm

verificarFuncion macro c5,c4,c3,c2,c1,c0, verificador
    LOCAL COF5,COF4,COF3,COF2,COF1,COF0,PR5,PR4,PR3,PR2,PR1,PR0,salir
    mov verificador, 0
    cmp c5 , 0
    je COF4
    jne COF5
    COF5:
        cmp c5 , 0
        je COF4
        jne PR5
    PR5:
        mov verificador, 1
        jmp salir
    COF4:
        cmp c4, 0
        je COF3
        jne PR4
    PR4:
        mov verificador, 1
        jmp salir
    COF3:
        cmp c3, 0
        je COF2
        jne PR3
    PR3:
        mov verificador, 1
        jmp salir
    COF2:
        cmp c2, 0
        je COF1
        jne PR2
    PR2:
        mov verificador, 1
        jmp salir
    COF1:
        cmp c1, 0
        je COF0
        jne PR1
    PR1:
        mov verificador, 1
        jmp salir
    COF0:
        cmp c0, 0
        je salir
        jne PR0
    PR0:
        mov verificador, 1
    salir:
        
endm