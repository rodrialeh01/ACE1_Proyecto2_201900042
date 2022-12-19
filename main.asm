include macros.asm
;inicio del programa
.model small

;segmento de pila
.stack

;segmento de datos
.data
    ln                  db 0ah, '$'
    inicio              db '================== Practica 2 / Proyecto 2 ================','$'
    inicio1             db '= Universidad de San Carlos de Guatemala','$'
    inicio2             db '= Facultad de Ingenieria','$'
    inicio3             db '= Escuela de Ciencias y Sistemas','$' 
    inicio4             db '= Arquitectura de Computadores y Ensambladores 1','$'
    inicio5             db '= Seccion: N','$'
    inicio6             db '= Vacaciones de Diciembre 2022','$'
    inicio7             db '= Rodrigo Alejandro Hernandez de Leon','$'
    inicio8             db '= 201900042','$'
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
    num                 db 55
    naux                db 2 dup(' '), '$'
    baux                db 10
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
            getch
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
            getch
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
        OPCION1:
            cls
            print op1
            print ln
            printn num
            print ln
            getch
            jmp MENU
        OPCION2:
            cls
            print op2
            print ln
            getch
            jmp MENU
        OPCION3:
            cls
            print op3
            print ln
            getch
            jmp MENU
        OPCION4:
            cls
            print op4
            print ln
            getch
            jmp MENU
        OPCION5:
            cls
            print op5
            print ln
            getch
            jmp MENU
        OPCION6:
            cls
            print op6
            print ln
            getch
            jmp MENU
        OPCION7:
            cls
            print op7
            print ln
            getch
            jmp MENU
        SALIR:
            .exit
    main ENDP
end main