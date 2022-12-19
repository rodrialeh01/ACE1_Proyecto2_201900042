;inicio del programa
.model small

;segmento de pila
.stack

;segmento de datos
.data
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
;segmento de codigo
.code 
    .starup
        MENU:
            mov ah, 0FH
            int 10h
            mov ah, 0
            int 10h

            mov bh, 0
            mov dh, 1
            mov d1, 10
            mov ah,2
            int 10h

            lea dx, inicio
            mov ah, 9
            int 21h
            
            lea dx , inicio1
            mov ah, 9
            int 21h

            lea dx , inicio2
            mov ah, 9
            int 21h

            lea dx , inicio3
            mov ah, 9
            int 21h

            lea dx , inicio4
            mov ah, 9
            int 21h

            lea dx , inicio5
            mov ah, 9
            int 21h

            lea dx , inicio6
            mov ah, 9
            int 21h

            lea dx , inicio7
            mov ah, 9
            int 21h

            lea dx , inicio8
            mov ah, 9
            int 21h
            
            .exit
END