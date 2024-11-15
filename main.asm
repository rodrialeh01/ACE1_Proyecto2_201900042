include macros.asm
;inicio del programa
.model small

;segmento de pila
.stack 100H

    ;segmento de datos
.data
    ; 0dh = \n y 0ah = \r
    ln          db      0ah, '$'
    ;INTRO DE INICIO
    inicio      db      '================== Practica 2 / Proyecto 2 ================','$'
    inicio1     db      '= Universidad de San Carlos de Guatemala                  =','$'
    inicio2     db      '= Facultad de Ingenieria                                  =','$'
    inicio3     db      '= Escuela de Ciencias y Sistemas                          =','$'
    inicio4     db      '= Arquitectura de Computadores y Ensambladores 1          =','$'
    inicio5     db      '= Seccion: N                                              =','$'
    inicio6     db      '= Vacaciones de Diciembre 2022                            =','$'
    inicio7     db      '= Rodrigo Alejandro Hernandez de Leon                     =','$'
    inicio8     db      '= 201900042                                               =','$'
    inicio09    db      '= Presione cualquier tecla para continuar                 =','$'
    inicio010   db      '===========================================================','$'
    ;MENU DE OPCIONES
    inicio9     db      'Ingrese el numero de la opcion que desea, o presione ESC para salir','$'
    inicio10    db      '= (1) Ingresar ecuacion','$'
    inicio11    db      '= (2) Imprimir la funcion almacenada','$'
    inicio12    db      '= (3) Imprimir la derivada de la funcion almacenada','$'
    inicio13    db      '= (4) Imprimir la integral de la funcion almacenada','$'
    inicio14    db      '= (5) Graficar la funcion original, derivada o integral','$'
    inicio15    db      '= (6) Metodo de Newton','$'
    inicio16    db      '= (7) Metodo de Steffensen','$'
    inicio17    db      '= (8) Salir de la aplicacion','$'
    op5         db      'OPCION 5','$'
    op6         db      'OPCION 6','$'
    op7         db      'OPCION 7','$'
    ;MENSAJE DE ERRORES
    operror     db      'Opcion no valida, presione ENTER para continuar','$'
    msger1      db      'Numero no valido, Ingrese un numero entre 0 y 5','$'
    msger2      db      'No se ha ingresado ninguna funcion','$'
    num         db      55
    naux        db      2 dup('0'), '$'
    baux        db      10
    ;PETICION DE LOS COEFICIENTES
    ins1        db      168,'Cual es el maximo exponente de la funcion?','$'
    exp5        db      'Ingrese el coeficiente del valor x^5','$'
    exp4        db      'Ingrese el coeficiente del valor x^4','$'
    exp3        db      'Ingrese el coeficiente del valor x^3','$'
    exp2        db      'Ingrese el coeficiente del valor x^2','$'
    exp1        db      'Ingrese el coeficiente del valor x^1','$'
    exp0        db      'Ingrese el coeficiente del valor x^0','$'
    prueba      db      'Si entra','$'
    punto       db      '.','$'
    unidades    db      0
    decenas     db      0
    ;VARIABLES DE LOS COEFICIENTES DE LA FUNCION
    coef5       db      0
    coef4       db      0
    coef3       db      0
    coef2       db      0
    coef1       db      0
    coef0       db      0
    ;VARIABLES DE LOS COEFICIENTES DE LA DERIVADA
    der5        db      0
    der4        db      0
    der3        db      0
    der2        db      0
    der1        db      0
    ;VARIABLES DE LOS COEFICIENTES DE LA INTEGRAL
    int5        db      0
    int4        db      0
    int3        db      0
    int2        db      0
    int1        db      0
    int0        db      0
    ac          db      0
    ;MENSAJES PARA MOSTRAR EL RESULTADO DE LA FUNCION
    msg         db      'f(x) = ', '$'
    msgDerivada db      'La derivada de la funcion ingresada es: ', '$'
    msgIntegral db      'La integral de la funcion ingresada es: ', '$'
    x6          db      'x^6 ','$'
    x5          db      'x^5 ','$'
    x4          db      'x^4 ','$'
    x3          db      'x^3 ','$'
    x2          db      'x^2 ','$'
    x1          db      'x ','$'
    verif       db      0
    constant    db      'C ','$'
    mas         db      '+ ','$'
    menos       db      '- ','$'
    numerito    db      1
    msgresult   db      'RESULTADO: ','$'
    msgresiduo  db      'RESIDUO: ','$'
    ;METODO DE NEWTON Y STEFFENSEN
    msgNewton          db      '==================METODO DE NEWTON================','$'
    msgSteffensen      db      '==================METODO DE STEFFENSEN================','$'
    msgIteraciones     db      'Ingrese el numero de iteraciones que desea realizar: ','$'
    itn                db    0
    its                db    0
    msgCoefTolerancia  db      'Ingrese el coeficiente de tolerancia: ','$'
    toln                db    0
    tols                db    0
    msgGradoTolerancia db      'Ingrese el grado de tolerancia: ','$'
    gradon             db    0
    trunc              dw    0CF3h
    grados             db    0
    msgLimiteSuperior  db      'Ingrese el limite superior: ','$'
    limsn              db    0
    limss              db    0
    msgLimiteInferior  db      'Ingrese el limite inferior: ','$'
    limin              db    0
    limis              db    0
    res                db    0
    tmp                db    0
    dectemp            dq    0.0
    contnew            db    0
    msgxn              db      'Xn = ', '$'
    msgxn1             db      'Xn+1 = ','$'
    tmp1            db    0
    xnsig           dq    0.0
    dos             dq    2.0
    n1              dw    0
    n2              dw    0
    contador        db    0
    xn              dq    0.0
    entero          dw    0
    diez            dq    10.0
    cont            db    0
    ciclotemp       dq    0.0
    contador1       db    0
    tmp2            db    0
    tmp3            db    0
    tmp4            db    0
    tmp5            db    0
    tmp6            db    0
    sumatemp        dw    0
    sumatemp2       dq    0.0
    x0n             dq    0.0
    coef_tmp        dw    0
    coef_tmp2       dq    0.0
    val5            dq    0.0
    val4            dq    0.0
    val3            dq    0.0
    val2            dq    0.0
    val1            dq    0.0
    val0            dq    0.0
    vald4            dq    0.0
    vald3            dq    0.0
    vald2            dq    0.0
    vald1            dq    0.0
    vald0            dq    0.0
    fx               dq    0.0
    fdx              dq    0.0
    mgsiteracion    db    'ITERACION #','$'
    numiteracion    db    1
    msgErrorNewton     db    'ERROR: El limite inferior es mayor que el limite superior','$'
                textaux label byte
    maxtextaux  db      4
    longtextaux db      ?
    numtextaux  db      4 dup('0'),'$'

    ;segmento de codigo
.code
main PROC
    finit
    fldcw trunc
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
                 getNumero        coef5
                 print            ln
                 multiplicar      coef5, 5, der5
                 dividir          coef5, 6, int5

                 print            exp4
                 print            ln
    ; captura numero
                 getNumero        coef4
                 print            ln
                 multiplicar      coef4, 4, der4
                 dividir          coef4, 5, int4
            
                 print            exp3
                 print            ln
    ; captura numero
                 getNumero        coef3
                 print            ln
                 multiplicar      coef3, 3, der3
                 dividir          coef3, 4, int3
            
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2
                 print            ln
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1
                 print            ln
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0
                 mov al, coef0
                 mov int0, al
                 print            ln
            
                 jmp              MENU
    OPT4:        
                 print            exp4
                 print            ln
    ; captura numero
                 getNumero        coef4
                 print            ln
                 multiplicar      coef4, 4, der4
                 dividir          coef4, 5, int4
            
                 print            exp3
                 print            ln
    ; captura numero
                 getNumero        coef3
                 multiplicar      coef3, 3, der3
                 dividir          coef3, 4, int3
                 print            ln
            
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
                 print            ln
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0
                 mov al, coef0
                 mov int0, al
                 print            ln

                 jmp              MENU
    OPT3:        
                 print            exp3
                 print            ln
    ; captura numero
                 getNumero        coef3
                 multiplicar      coef3, 3, der3
                 dividir          coef3, 4, int3
                 print            ln
            
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
                 print            ln
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0
                 mov al, coef0
                 mov int0, al
                 print            ln
            
                 jmp              MENU
    OPT2:        
                 print            exp2
                 print            ln
    ; captura numero
                 getNumero        coef2
                 multiplicar      coef2, 2, der2
                 dividir          coef2, 3, int2
                 print            ln
            
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0
                 mov al, coef0
                 mov int0, al
                 print            ln
            
                 jmp              MENU
    OPT1:        
                 print            exp1
                 print            ln
    ; captura numero
                 getNumero        coef1
                 multiplicar      coef1, 1, der1
                 dividir          coef1, 2, int1
                 print            ln
            
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0
                 mov al, coef0
                 mov int0, al
                 print            ln
            
                 jmp              MENU
    OPT0:        
                 print            exp0
                 print            ln
    ; captura numero
                 getNumero        coef0
                 mov al, coef0
                 mov int0, al
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
    OPCION2:     
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 jne              IMPFUNC
    OPCION3:     
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 jne              IMPDER
    OPCION4:     
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 jne              IMPINT
    OPCION5:     
                 cls
                 print            op5
                 print            ln
                 pausa
                 jmp              MENU
    ;METODO DE NEWTON
    OPCION6:     
                 cls
                 ;VERIFICAR SI HAY UNA FUNCION
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 ;SOLICITUD DE DATOS
                 print            msgNewton
                 print            ln
                 print            msgIteraciones
                 print            ln
                 getNumero        itn
                 print            ln
                 print            msgCoefTolerancia
                 print            ln
                 getNumero        toln
                 print            ln
                 print            msgGradoTolerancia
                 print            ln
                 getNumero        gradon
                 print            ln
                 print            msgLimiteSuperior
                 print            ln
                 getNumero        limsn
                 print            ln
                 print            msgLimiteInferior
                 print            ln
                 getNumero        limin
                 print            ln
                 ;VERIFICAR SI EL LIM SUP > LIM INF
                 mov bl, 0
                 mov cl, 0
                 mov bl, limin
                 mov cl, limsn
                 cmp bl, cl
                 jae ERRORNEWTON
                 ;X0
                 cls
                 print mgsiteracion
                 printn numiteracion
                 add bl,cl
                 mov al,bl
                 mov ah,0
                 mov sumatemp, ax

                 fild sumatemp
                 fstp sumatemp2

                 fld sumatemp2
                 fdiv dos
                 fstp x0n
                 print ln
                 print msgxn
                 printDecimal x0n,gradon
                 print ln
                 print msgxn1
                 MetodoNewton x0n, xnsig
                 printDecimal val1, gradon
                 print ln
                 pausa
                 jmp              MENU
    OPCION7:     
                 cls
                 ;VERIFICAR SI HAY UNA FUNCION
                 verificarFuncion coef5, coef4, coef3, coef2, coef1, coef0, verif
                 cmp              verif, 0
                 je               OPCIONERROR2
                 ;SOLICITUD DE DATOS
                 print            msgSteffensen
                 print            ln
                 print            msgIteraciones
                 print            ln
                 getNumero        its
                 print            ln
                 print            msgCoefTolerancia
                 print            ln
                 getNumero        tols
                 print            ln
                 print            msgGradoTolerancia
                 print            ln
                 getNumero        grados
                 print            ln
                 print            msgLimiteSuperior
                 print            ln
                 getNumero        limss
                 print            ln
                 print            msgLimiteInferior
                 print            ln
                 getNumero        limis
                 print            ln
                 ;VERIFICAR SI EL LIM SUP > LIM INF
                 mov bl, 0
                 mov cl, 0
                 mov bl, limis
                 mov cl, limss
                 cmp bl, cl
                 jae ERRORNEWTON
                 ;X0
                 cls
                 print mgsiteracion
                 printn numiteracion
                 add bl,cl
                 mov al,bl
                 mov ah,0
                 mov sumatemp, ax

                 fild sumatemp
                 fstp sumatemp2

                 fld sumatemp2
                 fdiv dos
                 fstp x0n
                 print ln
                 print msgxn
                 printDecimal x0n,gradon
                 print ln
                 print msgxn1
                 print ln
                 pausa
                 jmp              MENU
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
                print            msgErrorNewton
                print            ln
                pausa
                jmp              MENU
    SALIR:       
.exit
main ENDP
end main