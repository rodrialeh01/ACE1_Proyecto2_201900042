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
              LOCAL         n1,n2,n3,n2n,negativo,negativo1,salir
              limpiarNumero numtextaux
              mov           ah, 0ah
              lea           dx, textaux
              int           21h
              cmp           longtextaux,1
              je            n1
              cmp           longtextaux,2
              je            n2
    ; VERIFICA QUE EL NUMERO INGRESADO SEA DE 1 DIGITO (POSITIVO)
    n1:       
              mov           al,numtextaux
              sub           al, 30h                                  ;48
              mov           var, al
              jmp           salir
    ; VERIFICA QUE EL NUMERO INGRESADO SEA DE 2 DIGITOS (POSITIVO) O 1 DIGITO (NEGATIVO)
    n2:       
              mov           unidades,0
              mov           decenas,0

              mov           al, numtextaux[0]
              sub           al, 30h
              mov           decenas, al

              mov           al, numtextaux[1]
              sub           al, 30h
              mov           unidades, al

              mov           al, decenas
              mov           bl, 10
              mul           bl
              add           al, unidades
              mov           var, al
    salir:    
endm
;limpia la variable de texto
limpiarNumero macro text
                  LOCAL repetir
                  xor   bx, bx
                  mov   cx, lengthof text
    repetir:      
                  mov   text[bx], '$'
                  inc   bx
                  loop  repetir
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
print prueba
print ln
            mov al, coefi
            printn  coefi
print prueba
print ln
            mov bl, expo
            printn expo
print prueba
print ln
            div bl
print prueba
print ln
            mov total, al
print prueba
print ln
            mov ax, 0000h
            mov al, bl
endm
; imprime la funcion
printFunc macro c5, c4, c3, c2, c1, c0
              LOCAL  COF5,COF4,COF3,COF2,COF1,COF0,PR5,PR4,PR3,PR2,PR1,PR0,salir
              print  msg
              cmp    c5 , 0
              je     COF4
              jne    COF5
    COF5:     
              cmp    c5 , 0
              je     COF4
              jne    PR5
    PR5:      
              printn c5
              print  x5
              print  mas
    COF4:     
              cmp    c4, 0
              je     COF3
              jne    PR4
    PR4:      
              printn c4
              print  x4
              print  mas
    COF3:     
              cmp    c3, 0
              je     COF2
              jne    PR3
    PR3:      
              printn c3
              print  x3
              print  mas
    COF2:     
              cmp    c2, 0
              je     COF1
              jne    PR2
    PR2:      
              printn c2
              print  x2
              print  mas
    COF1:     
              cmp    c1, 0
              je     COF0
              jne    PR1
    PR1:      
              printn c1
              print  x1
              print  mas
    COF0:     
              printn c0
    salir:    

              print  ln
              print  inicio09
              print  ln
endm
; imprime la derivada
printDerivada macro c4, c3, c2, c1, c0
                  LOCAL  COF4,COF3,COF2,COF1,COF0,PR4,PR3,PR2,PR1,PR0,salir
                  print  msgDerivada
                  print  ln
                  cmp    c4 , 0
                  je     COF3
                  jne    COF4
    COF4:         
                  cmp    c4, 0
                  je     COF3
                  jne    PR4
    PR4:          
                  printn c4
                  print  x4
                  print  mas
    COF3:         
                  cmp    c3, 0
                  je     COF2
                  jne    PR3
    PR3:          
                  printn c3
                  print  x3
                  print  mas
    COF2:         
                  cmp    c2, 0
                  je     COF1
                  jne    PR2
    PR2:          
                  printn c2
                  print  x2
                  print  mas
    COF1:         
                  cmp    c1, 0
                  je     COF0
                  jne    PR1
    PR1:          
                  printn c1
                  print  x1
                  print  mas
    COF0:         
                  printn c0
    salir:        

                  print  ln
                  print  inicio09
                  print  ln
endm
;imprime la integral
printIntegral macro c5, c4, c3, c2, c1, c0
                  LOCAL  COF5,COF4,COF3,COF2,COF1,COF0,PR5,PR4,PR3,PR2,PR1,PR0,salir
                  print  msgIntegral
                  print  ln
                  cmp    c5 , 0
                  je     COF4
                  jne    COF5
    COF5:         
                  cmp    c5 , 0
                  je     COF4
                  jne    PR5
    PR5:          
                  printn c5
                  print  x6
                  print  mas
    COF4:         
                  cmp    c4, 0
                  je     COF3
                  jne    PR4
    PR4:          
                  printn c4
                  print  x5
                  print  mas
    COF3:         
                  cmp    c3, 0
                  je     COF2
                  jne    PR3
    PR3:          
                  printn c3
                  print  x4
                  print  mas
    COF2:         
                  cmp    c2, 0
                  je     COF1
                  jne    PR2
    PR2:          
                  printn c2
                  print  x3
                  print  mas
    COF1:         
                  cmp    c1, 0
                  je     COF0
                  jne    PR1
    PR1:          
                  printn c1
                  print  x2
                  print  mas
    COF0:         
                  printn c0
                  print  x1
                  print  mas
    salir:        
    
                  print  constant
                  print  ln
                  print  inicio09
                  print  ln
endm
; verifica si existe la funcion
verificarFuncion macro c5,c4,c3,c2,c1,c0, verificador
                     LOCAL COF5,COF4,COF3,COF2,COF1,COF0,PR5,PR4,PR3,PR2,PR1,PR0,salir
                     mov   verificador, 0
                     cmp   c5 , 0
                     je    COF4
                     jne   COF5
    COF5:            
                     cmp   c5 , 0
                     je    COF4
                     jne   PR5
    PR5:             
                     mov   verificador, 1
                     jmp   salir
    COF4:            
                     cmp   c4, 0
                     je    COF3
                     jne   PR4
    PR4:             
                     mov   verificador, 1
                     jmp   salir
    COF3:            
                     cmp   c3, 0
                     je    COF2
                     jne   PR3
    PR3:             
                     mov   verificador, 1
                     jmp   salir
    COF2:            
                     cmp   c2, 0
                     je    COF1
                     jne   PR2
    PR2:             
                     mov   verificador, 1
                     jmp   salir
    COF1:            
                     cmp   c1, 0
                     je    COF0
                     jne   PR1
    PR1:             
                     mov   verificador, 1
                     jmp   salir
    COF0:            
                     cmp   c0, 0
                     je    salir
                     jne   PR0
    PR0:             
                     mov   verificador, 1
    salir:           
        
endm

xinicial macro ls,li,xini
       mov al, ls
       add al, li  
       mov tmp1, al
       printn tmp1
       ;dividir entre 2
       print   ln
       mov al,0
       mov al, tmp1
       mov bl, dos
       div bl
       mov xini, al
endm

dividir2 macro num1,num2,result,residuo               
       LOCAL ciclo,salir1,salir2,salir3             
       mov al, num1
       mov bl, num2
       sub al,bl
       mov tmp1,al
       mov contador,0
       ciclo:
              mov al, tmp1
              cmp al,0
              je salir1
              jl salir2
              inc contador
              sub al, num2
              mov tmp1, al
              jmp ciclo
       salir1:
              mov cl, contador
              add cl,1
              mov result, cl
              mov residuo, 0
              jmp salir3
       salir2:
              mov cl,contador
              mov result, cl
              add tmp1, num2
              mov dl, tmp1
              mov residuo, dl
              jmp salir3
       salir3:
endm

imprimirDecimales macro divisor,resultado, residuo, gradodec
       LOCAL ciclo,salir,salir2
       printn resultado
       print punto
       mov contador1,0
       mov tmp3,0
       mov al, residuo
       mov tmp4, al
       mov al, residuo
       cmp al,0
       je salir 
       ciclo:
              mov dl, gradodec
              mov cl, contador1
              cmp cl,dl
              je salir2
              mov al, tmp4
              mov bl, 10
              mul bl
              mov tmp3, al
              dividir2 tmp3, divisor,tmp5,tmp4
              printnum2 tmp5
              inc contador1
              jmp ciclo
       salir:
              printn 0
              jmp salir2
       salir2:
endm

printnum2 macro numeroprint 
       mov dl, numeroprint
       add dl, 30h
       mov ah, 02h
       int 21h
endm