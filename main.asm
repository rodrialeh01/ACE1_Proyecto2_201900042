include macros.asm
;inicio del programa
.model small

;segmento de pila
.stack

;segmento de datos
.data
    ; 0dh = \n y 0ah = \r
    ln                  db 0ah, '$'
    ;INTRO DE INICIO
    inicio              db '================== Practica 2 / Proyecto 2 ================','$'
    inicio1             db '= Universidad de San Carlos de Guatemala','$'
    inicio2             db '= Facultad de Ingenieria','$'
    inicio3             db '= Escuela de Ciencias y Sistemas','$' 
    inicio4             db '= Arquitectura de Computadores y Ensambladores 1','$'
    inicio5             db '= Seccion: N','$'
    inicio6             db '= Vacaciones de Diciembre 2022','$'
    inicio7             db '= Rodrigo Alejandro Hernandez de Leon','$'
    inicio8             db '= 201900042','$'
    ;MENU DE OPCIONES
    inicio9             db 'Ingrese el numero de la opcion que desea, o presione ESC para salir','$'
    inicio10            db '= (1) Ingresar ecuacion','$'
    inicio11            db '= (2) Imprimir la funcion almacenada','$'
    inicio12            db '= (3) Imprimir la derivada de la funcion almacenada','$'
    inicio13            db '= (4) Imprimir la integral de la funcion almacenada','$'
    inicio14            db '= (5) Graficar la funcion original, derivada o integral','$'
    inicio15            db '= (6) Metodo de Newton','$'
    inicio16            db '= (7) Metodo de Steffensen','$'
    inicio17            db '= (8) Salir de la aplicacion','$'
    op1                 db 'OPCION 1','$'
    op2                 db 'OPCION 2','$'
    op3                 db 'OPCION 3','$'
    op4                 db 'OPCION 4','$'
    op5                 db 'OPCION 5','$'
    op6                 db 'OPCION 6','$'
    op7                 db 'OPCION 7','$'
    operror             db 'Opcion no valida, presione ENTER para continuar','$'
    msger1              db 'Numero no valido, Ingrese un numero entre 0 y 5','$'
    num                 db 55
    naux                db 2 dup('0'), '$'
    baux                db 10
    ins1                db '¿Cual es el maximo exponente de la funcion?','$'
    exp5                db 'Ingrese el coeficiente del valor x^5','$'
    exp4                db 'Ingrese el coeficiente del valor x^4','$'
    exp3                db 'Ingrese el coeficiente del valor x^3','$'
    exp2                db 'Ingrese el coeficiente del valor x^2','$'
    exp1                db 'Ingrese el coeficiente del valor x^1','$'
    exp0                db 'Ingrese el coeficiente del valor x^0','$'
    unidades            db 0
    decenas             db 0
    coef5               db 0
    coef4               db 0
    coef3               db 0
    coef2               db 0
    coef1               db 0
    coef0               db 0 
    der5                db 0
    der4                db 0
    der3                db 0
    der2                db 0
    der1                db 0
    int5                db 0
    int4                db 0
    int3                db 0
    int2                db 0
    int1                db 0
    int0                db 0
    ac                  db 0
    msg                 db 'La funcion ingresada es: ', '$'
    msg2                db 'La derivada de la funcion ingresada es: ', '$'
    x5                  db 'x^5 ','$'  
    x4                  db 'x^4 ','$'
    x3                  db 'x^3 ','$'
    x2                  db 'x^2 ','$'
    x1                  db 'x ','$'
    mas                 db '+ ','$'
    menos               db '- ','$'

textaux label byte
    maxtextaux          db 4
    longtextaux         db ?
    numtextaux          db 4 dup('0'),'$'

;segmento de codigo
.code 
    main PROC
        INTRO:
            cls
            print inicio
            print ln
            print inicio1
            print ln
            print inicio2
            print ln
            print inicio3
            print ln
            print inicio4
            print ln
            print inicio5
            print ln
            print inicio6
            print ln
            print inicio7
            print ln
            print inicio8
            print ln
            pausa
            jmp MENU
        MENU:
            cls
            print inicio9
            print ln
            print inicio10
            print ln
            print inicio11
            print ln
            print inicio12
            print ln
            print inicio13
            print ln
            print inicio14
            print ln
            print inicio15
            print ln
            print inicio16
            print ln
            print inicio17
            print ln
            pausa
            ;comparacion de la tecla presionada con ascci o con la letra a comparar
            cmp al, 49
            ;jump equal
            je OPCION1
            ;jne jump no equal es else
            ;jz = jump zero = si es 0 para comparar si ambos son iguales
            cmp al, 50
            je OPCION2
            cmp al, 51
            je OPCION3
            cmp al, 52
            je OPCION4
            cmp al, 53
            je OPCION5
            cmp al, 54
            je OPCION6
            cmp al, 55
            je OPCION7
            cmp al, 27
            je SALIR
            cmp al, 56
            je SALIR
            print ln
            jmp OPCIONERROR
        OPCION1:
            cls
            print op1
            print ln
            mov ax, seg @data
            mov ds, ax
            ; IMPRIME LA PREGUNTA
            mov ah, 09h
            lea dx, ins1
            int 21h
            ; Captura el numero ingresado
            mov ah, 01h
            int 21h
            sub al, 30h
            mov num, al

            print ln
            ;compara si es exponente 5 se va a la opcion 5
            mov al, num
            cmp al, 5
            je OPT5
            ;compara si es exponente 4 se va a la opcion 4
            cmp al, 4
            je OPT4
            ;compara si es exponente 3 se va a la opcion 3
            cmp al, 3
            je OPT3
            ;compara si es exponente 2 se va a la opcion 2
            cmp al, 2
            je OPT2
            ;compara si es exponente 1 se va a la opcion 1
            cmp al, 1
            je OPT1
            ;compara si es exponente 0 se va a la opcion 0
            cmp al, 0
            je OPT0
            jmp OPER1
        OPT5:
            print exp5
            print ln
            ; captura numero
            getNumero coef5
            print ln
            multiplicar coef5, 5, der5

            print exp4
            print ln
            ; captura numero
            getNumero coef4
            print ln
            multiplicar coef4, 4, der4
            
            print exp3
            print ln
            ; captura numero
            getNumero coef3
            print ln
            multiplicar coef3, 3, der3
            
            print exp2
            print ln
            ; captura numero
            getNumero coef2
            print ln
            multiplicar coef2, 2, der2
            
            print exp1
            print ln
            ; captura numero
            getNumero coef1
            print ln
            multiplicar coef1, 1, der1
            
            print exp0
            print ln
            ; captura numero
            getNumero coef0
            print ln
            
            print msg
            printn coef5
            print x5
            print mas
            printn coef4
            print x4
            print mas
            printn coef3
            print x3
            print mas
            printn coef2
            print x2
            print mas
            printnum coef1
            print x1
            print mas
            printnum coef0
            print ln
            ;DERIVADA
            print msg2
            printn der5
            print x4
            print mas
            printn der4
            print x3
            print mas
            printn der3
            print x2
            print mas
            printn der2
            print x1
            print mas
            printnum der1
            print ln
            pausa
            jmp MENU
        OPT4:
            print exp4
            print ln
            ; captura numero
            getNumero coef4
            print ln
            multiplicar coef4, 4, der4
            
            print exp3
            print ln
            ; captura numero
            getNumero coef3
            multiplicar coef3, 3, der3
            print ln
            
            print exp2
            print ln
            ; captura numero
            getNumero coef2
            multiplicar coef2, 2, der2 
            print ln
            
            print exp1
            print ln
            ; captura numero
            getNumero coef1
            multiplicar coef1, 1, der1
            print ln
            
            print exp0
            print ln
            ; captura numero
            getNumero coef0
            print ln
            
            print msg
            printn coef4
            print x4
            print mas
            printn coef3
            print x3
            print mas
            printn coef2
            print x2
            print mas
            printnum coef1
            print x1
            print mas
            printnum coef0
            print ln
            pausa
            jmp MENU 
        OPT3:
            print exp3
            print ln
            ; captura numero
            getNumero coef3
            multiplicar coef3, 3, der3
            print ln
            
            print exp2
            print ln
            ; captura numero
            getNumero coef2
            multiplicar coef2, 2, der2 
            print ln
            
            print exp1
            print ln
            ; captura numero
            getNumero coef1
            multiplicar coef1, 1, der1
            print ln
            
            print exp0
            print ln
            ; captura numero
            getNumero coef0
            print ln
            
            print msg
            printn coef3
            print x3
            print mas
            printn coef2
            print x2
            print mas
            printnum coef1
            print x1
            print mas
            printnum coef0
            print ln
            pausa
            jmp MENU
        OPT2:
            print exp2
            print ln
            ; captura numero
            getNumero coef2
            multiplicar coef2, 2, der2 
            print ln
            
            print exp1
            print ln
            ; captura numero
            getNumero coef1
            multiplicar coef1, 1, der1
            print ln
            
            print exp0
            print ln
            ; captura numero
            getNumero coef0
            print ln
            
            print msg
            printn coef2
            print x2
            print mas
            printnum coef1
            print x1
            print mas
            printnum coef0
            print ln
            pausa
            jmp MENU
        OPT1:
            print exp1
            print ln
            ; captura numero
            getNumero coef1
            multiplicar coef1, 1, der1
            print ln
            
            print exp0
            print ln
            ; captura numero
            getNumero coef0
            print ln
            
            print msg
            printnum coef1
            print x1
            print mas
            printnum coef0
            print ln
            pausa
            jmp MENU
        OPT0:
            print exp0
            print ln
            ; captura numero
            getNumero coef0
            print ln
            
            print msg
            printnum coef0
            print ln
            pausa
            jmp MENU
        OPER1:
            print msger1
            print ln
            pausa
            jmp MENU
        OPCION2:
            cls
            print op2
            print ln
            pausa
            jmp MENU
        OPCION3:
            cls
            print op3
            print ln
            pausa
            jmp MENU
        OPCION4:
            cls
            print op4
            print ln
            pausa
            jmp MENU
        OPCION5:
            cls
            print op5
            print ln
            pausa
            jmp MENU
        OPCION6:
            cls
            print op6
            print ln
            pausa
            jmp MENU
        OPCION7:
            cls
            print op7
            print ln
            pausa
            jmp MENU
        OPCIONERROR:
            cls
            print operror
            print ln
            pausa
            jmp MENU
        SALIR:
            .exit
    main ENDP
end main