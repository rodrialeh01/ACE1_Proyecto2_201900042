include macros.asm
;inicio del programa
.model small

;segmento de pila
.stack

    ;segmento de datos
.data
    ; 0dh = \n y 0ah = \r
    ln                 db      0ah, '$'
    ;INTRO DE INICIO
    inicio             db      '================== Practica 2 / Proyecto 2 ================','$'
    inicio1            db      '= Universidad de San Carlos de Guatemala                  =','$'
    inicio2            db      '= Facultad de Ingenieria                                  =','$'
    inicio3            db      '= Escuela de Ciencias y Sistemas                          =','$'
    inicio4            db      '= Arquitectura de Computadores y Ensambladores 1          =','$'
    inicio5            db      '= Seccion: N                                              =','$'
    inicio6            db      '= Vacaciones de Diciembre 2022                            =','$'
    inicio7            db      '= Rodrigo Alejandro Hernandez de Leon                     =','$'
    inicio8            db      '= 201900042                                               =','$'
    inicio09           db      '= Presione cualquier tecla para continuar                 =','$'
    inicio010          db      '===========================================================','$'
    ;MENU DE OPCIONES
    inicio9            db      'Ingrese el numero de la opcion que desea, o presione ESC para salir','$'
    inicio10           db      '= (1) Ingresar ecuacion','$'
    inicio11           db      '= (2) Imprimir la funcion almacenada','$'
    inicio12           db      '= (3) Imprimir la derivada de la funcion almacenada','$'
    inicio13           db      '= (4) Imprimir la integral de la funcion almacenada','$'
    inicio14           db      '= (5) Graficar la funcion original, derivada o integral','$'
    inicio15           db      '= (6) Metodo de Newton','$'
    inicio16           db      '= (7) Metodo de Steffensen','$'
    inicio17           db      '= (8) Salir de la aplicacion','$'
    op5                db      'OPCION 5','$'
    op6                db      'OPCION 6','$'
    op7                db      'OPCION 7','$'
    ;MENSAJE DE ERRORES
    operror            db      'Opcion no valida, presione ENTER para continuar','$'
    msger1             db      'Numero no valido, Ingrese un numero entre 0 y 5','$'
    msger2             db      'No se ha ingresado ninguna funcion','$'
    num                db      55
    naux               db      2 dup('0'), '$'
    baux               db      10
    ;PETICION DE LOS COEFICIENTES CASO 1
    ins1               db      168,'Cual es el maximo exponente de la funcion?','$'
    exp5               db      'Ingrese el coeficiente del valor x^5','$'
    exp4               db      'Ingrese el coeficiente del valor x^4','$'
    exp3               db      'Ingrese el coeficiente del valor x^3','$'
    exp2               db      'Ingrese el coeficiente del valor x^2','$'
    exp1               db      'Ingrese el coeficiente del valor x^1','$'
    exp0               db      'Ingrese el coeficiente del valor x^0','$'
    ;BANDERA DE NEGATIVOS
    neg5               db      0
    neg4               db      0
    neg3               db      0
    neg2               db      0
    neg1               db      0
    neg0               db      0
    negnewton          db      0
    prueba             db      'Si entra','$'
    unidades           db      0
    decenas            db      0
    ;VARIABLES DE LOS COEFICIENTES DE LA FUNCION
    coef5              db      0
    coef4              db      0
    coef3              db      0
    coef2              db      0
    coef1              db      0
    coef0              db      0
    ;VARIABLES DE LOS COEFICIENTES DE LA DERIVADA
    der5               db      0
    der4               db      0
    der3               db      0
    der2               db      0
    der1               db      0
    ;VARIABLES DE LOS COEFICIENTES DE LA INTEGRAL
    int5               db      0
    int4               db      0
    int3               db      0
    int2               db      0
    int1               db      0
    int0               db      0
    ac                 db      0
    ;MENSAJES PARA MOSTRAR EL RESULTADO DE LA FUNCION
    msg                db      'f(x) = ', '$'
    msgDerivada        db      'La derivada de la funcion ingresada es: ', '$'
    msgIntegral        db      'La integral de la funcion ingresada es: ', '$'
    x6                 db      'x^6 ','$'
    x5                 db      'x^5 ','$'
    x4                 db      'x^4 ','$'
    x3                 db      'x^3 ','$'
    x2                 db      'x^2 ','$'
    x1                 db      'x ','$'
    verif              db      0
    constant           db      'C ','$'
    mas                db      '+ ','$'
    menos              db      '- ','$'
    ;MENSAJES PARA EL METODO DE NEWTON Y STEFFENSEN
    msgNewton          db      '==================METODO DE NEWTON================','$'
    msgSteffensen      db      '==================METODO DE STEFFENSEN================','$'
    msgIteraciones     db      'Ingrese el numero de iteraciones que desea realizar: ','$'
    msgCoefTolerancia  db      'Ingrese el coeficiente de tolerancia: ','$'
    msgGradoTolerancia db      'Ingrese el grado de tolerancia: ','$'
    msgLimiteSuperior  db      'Ingrese el limite superior: ','$'
    msgLimiteInferior  db      'Ingrese el limite inferior: ','$'
    ;VARIABLES PARA EL METODO DE NEWTON Y STEFFENSEN
    itn                db      0
    toln               db      0
    gradon             db      0
    limsn              db      0
    limin              db      0
    xinicialn          dd      0
    its                db      0
    tols               db      0
    grados             db      0
    limss              db      0
    limis              db      0
    xini               db      'X INICIAL: ','$'
    xinicials          dd      0
    ;ERROR DE LIMITES
    errornew           db      'ERROR: El limite inferior es mayor que el limite superior'
    strxinicial        db      30 dup(' '),'$'
                       textaux label byte
    maxtextaux         db      4
    longtextaux        db      ?
    numtextaux         db      4 dup('0'),'$'

    ;segmento de codigo
.code
main PROC
    finit
    INTRO:       
                 cls
                 print            inicio
                 print            ln
                 print            inicio1
                 print            ln
                 print            inicio2
                 print            ln
                 print            inicio3
                 print            ln
                 print            inicio4
                 print            ln
                 print            inicio5
                 print            ln
                 print            inicio6
                 print            ln
                 print            inicio7
                 print            ln
                 print            inicio8
                 print            ln
                 print            inicio09
                 print            ln
                 print            inicio010
                 print            ln
                 pausa
                 jmp              MENU
    MENU:        
                 cls
                 print            inicio9
                 print            ln
                 print            inicio10
                 print            ln
                 print            inicio11
                 print            ln
                 print            inicio12
                 print            ln
                 print            inicio13
                 print            ln
                 print            inicio14
                 print            ln
                 print            inicio15
                 print            ln
                 print            inicio16
                 print            ln
                 print            inicio17
                 print            ln
                 pausa
    ;comparacion de la tecla presionada con ascci o con la letra a comparar
                 cmp              al, 49
    ;jump equal
                 je               OPCION1
    ;jne jump no equal es else
    ;jz = jump zero = si es 0 para comparar si ambos son iguales
                 cmp              al, 50
                 je               OPCION2
                 cmp              al, 51
                 je               OPCION3
                 cmp              al, 52
                 je               OPCION4
                 cmp              al, 53
                 je               OPCION5
                 cmp              al, 54
                 je               OPCION6
                 cmp              al, 55
                 je               OPCION7
                 cmp              al, 27
                 je               SALIR
                 cmp              al, 56
                 je               SALIR
                 print            ln
                 jmp              OPCIONERROR
    OPCION1:     
    ; LIMPIA LAS VARIABLES
                 mov              coef5, 0
                 mov              coef4, 0
                 mov              coef3, 0
                 mov              coef2, 0
                 mov              coef1, 0
                 mov              coef0, 0
                 mov              der5, 0
                 mov              der4, 0
                 mov              der3, 0
                 mov              der2, 0
                 mov              der1, 0
                 mov              int5, 0
                 mov              int4, 0
                 mov              int3, 0
                 mov              int2, 0
                 mov              int1, 0
                 mov              int0, 0
                 mov              ac, 0
                 cls
    ; IMPRIME LA PREGUNTA
                 print            ins1
                 print            ln
    ; Captura el numero ingresado
                 mov              ah, 01h
                 int              21h
                 sub              al, 30h
                 mov              num, al

                 print            ln
    ;compara si es exponente 5 se va a la opcion 5
                 mov              al, num
                 cmp              al, 5
                 je               OPT5
    ;compara si es exponente 4 se va a la opcion 4
                 cmp              al, 4
                 je               OPT4
    ;compara si es exponente 3 se va a la opcion 3
                 cmp              al, 3
                 je               OPT3
    ;compara si es exponente 2 se va a la opcion 2
                 cmp              al, 2
                 je               OPT2
    ;compara si es exponente 1 se va a la opcion 1
                 cmp              al, 1
                 je               OPT1
    ;compara si es exponente 0 se va a la opcion 0
                 cmp              al, 0
                 je               OPT0
                 jmp              OPER1
    OPT5:        
                 print            exp5
                 print            ln
    ; captura numero
                 getNumero        coef5,neg5
                 print            ln
                 multiplicar      coef5, 5, der5
                 dividir          coef5, 6, int5

                 print            exp4
                 print            ln
    ; captura numero
                 getNumero        coef4,neg4
                 print            ln
                 multiplicar      coef4, 4, der4
                 dividir          coef4, 5, int4
            
                 print            exp3
                 print            ln
    ; captura numero
                 getNumero        coef3,neg3
                 print            ln
                 multiplicar      coef3, 3, der3
                 dividir          coef3, 4, int3
            
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2,neg2
                 print            ln
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1,neg1
                 print            ln
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0,neg0
                 mov              al, coef0
                 mov              int0, al
                 print            ln
            
                 jmp              MENU
    OPT4:        
                 print            exp4
                 print            ln
    ; captura numero
                 getNumero        coef4, neg4
                 print            ln
                 multiplicar      coef4, 4, der4
                 dividir          coef4, 5, int4
            
                 print            exp3
                 print            ln
    ; captura numero
                 getNumero        coef3, neg3
                 multiplicar      coef3, 3, der3
                 dividir          coef3, 4, int3
                 print            ln
            
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2, neg2
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
                 print            ln
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1, neg1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0, neg0
                 mov              al, coef0
                 mov              int0, al
                 print            ln

                 jmp              MENU
    OPT3:        
                 print            exp3
                 print            ln
    ; captura numero
                 getNumero        coef3, neg3
                 multiplicar      coef3, 3, der3
                 dividir          coef3, 4, int3
                 print            ln
            
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2, neg2
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
                 print            ln
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1, neg1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0, neg0
                 mov              al, coef0
                 mov              int0, al
                 print            ln
            
                 jmp              MENU
    OPT2:        
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2, neg2
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
                 print            ln
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1, neg1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0, neg0
                 mov              al, coef0
                 mov              int0, al
                 print            ln
            
                 jmp              MENU
    OPT1:        
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1, neg1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0, neg0
                 mov              al, coef0
                 mov              int0, al
                 print            ln
            
                 jmp              MENU
    OPT0:        
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0, neg0
                 mov              al, coef0
                 mov              int0, al
                 print            ln
            
                 print            msg
                 printnum         coef0
                 print            ln
                 pausa
                 jmp              MENU
    OPER1:       
                 print            msger1
                 print            ln
                 pausa
                 jmp              MENU
    ;IMPRIME LA FUNCION
    OPCION2:     
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 jne              IMPFUNC
    ;IMPRIME LA DERIVADA
    OPCION3:     
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 jne              IMPDER
    ;IMPRIME LA INTEGRAL
    OPCION4:     
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 jne              IMPINT
    ;GRAFICAS DE LA FUNCION
    OPCION5:     
                 cls
                 print            op5
                 print            ln
                 pausa
                 jmp              MENU
    ;METODO DE NEWTON
    OPCION6:     
                 cls
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp             verif,0
                 je              OPCIONERROR2
                 print            msgNewton
                 print            ln
                 print            msgIteraciones
                 print            ln
                 getNumero        itn,negnewton
                 print            ln
                 print            msgLimiteSuperior
                 print            ln
                 getNumero        limsn,negnewton
                 print            ln
                 print            msgLimiteInferior
                 print            ln
                 getNumero        limin,negnewton
                 print            ln
                 print            msgCoefTolerancia
                 print            ln
                 getNumero        toln,negnewton
                 print            ln
                 print            msgGradoTolerancia
                 print            ln
                 getNumero        gradon,negnewton
                 mov al, limin
                 mov bl, limsn
                 cmp ax,bx
                 jbe ERRORNEWTON
                 print            ln
                 pausa
                 jmp              MENU
    ;METODO DE STEFFENSEN
    OPCION7:     
                 cls
                 print            op7
                 print            ln
                 pausa
                 jmp              MENU
    ;ERROR
    OPCIONERROR: 
                 cls
                 print            operror
                 print            ln
                 pausa
                 jmp              MENU
    IMPFUNC:     
                 cls
                 printFunc        coef5, coef4, coef3, coef2, coef1, coef0
                 pausa
                 jmp              MENU
    IMPDER:      
                 cls
                 printDerivada    der5, der4, der3, der2, der1
                 pausa
                 jmp              MENU
    IMPINT:      
                 cls
                 printIntegral    int5, int4, int3, int2, int1, int0
                 pausa
                 jmp              MENU
    OPCIONERROR2:
                 cls
                 print            msger2
                 print            ln
                 pausa
                 jmp              MENU
    ERRORNEWTON:
                cls
                print             errornew
                print             ln
                print             inicio09
                print             ln
                pausa
                jmp               MENU
    SALIR:       
.exit
main ENDP
end main