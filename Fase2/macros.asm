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
getNumero macro var,bannegativo
                     LOCAL         option1,option2,nlen2positivo, nlen2negativo,option3,nlen3negativo,salirmacro
                     mov           bannegativo,0
                     limpiarNumero numtextaux
                     mov           ah, 0ah
                     lea           dx, textaux
                     int           21h
                     cmp           longtextaux,1
                     je            option1
                     cmp           longtextaux,2
                     je            option2
                     cmp           longtextaux,3
                     je            option3
       ; VERIFICA QUE EL NUMERO INGRESADO SEA DE 1 DIGITO (POSITIVO)
       option1:          
                     mov           al,numtextaux
                     sub           al, 30h                                                            ;48
                     mov           var, al
                     jmp           salirmacro
       ; VERIFICA QUE EL NUMERO INGRESADO SEA DE 2 DIGITOS (POSITIVO) O 1 DIGITO (NEGATIVO)
       option2:          
                     cmp           numtextaux[0],'-'
                     je            nlen2negativo
                     jmp           nlen2positivo
       nlen2positivo:
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
       nlen2negativo:
                     mov           bannegativo,1
                     mov           al,numtextaux[1]
                     sub           al, 30h                                                            ;48
                     mov           var, al
                     jmp           salirmacro
       ; VERIFICA QUE EL NUMERO INGRESADO SEA DE 2 DIGITOS (NEGATIVO)
       option3:        
                     cmp           numtextaux[0],'-'
                     je            nlen3negativo
                     jmp           salirmacro
       nlen3negativo:
                     mov           bannegativo,1
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
       salirmacro:        
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
               mov al, coefi
               mov bl, expo
               div bl
               mov total, al
               mov ax, 0000h
               mov al, bl
endm
; imprime la funcion
printFunc macro c5, c4, c3, c2, c1, c0
                 LOCAL  COF5,P5,N5,COF4,N4,P4,COF3,N3,P3,COF2,N2,P2,COF1,N1,P1,COF0,N0,P0,PR5,PR4,PR3,PR2,PR1,PR0,salir
                 print  msg
                 cmp    c5 , 0
                 je     COF4
                 jne    PR5
       PR5:      
                 cmp    neg5,1
                 je     N5
                 jne    P5
       N5:       
                 print  menos
                 printn c5
                 print  x5
                 jmp    COF4
       P5:       
                 printn c5
                 print  x5
                 jmp    COF4
       COF4:     
                 cmp    c4, 0
                 je     COF3
                 jne    PR4
       PR4:      
                 cmp    neg4,1
                 je     N4
                 jne    P4
       N4:       
                 print  menos
                 printn c4
                 print  x4
                 JMP    COF3
       P4:       
                 print  mas
                 printn c4
                 print  x4
                 JMP    COF3
       COF3:     
                 cmp    c3, 0
                 je     COF2
                 jne    PR3
       PR3:      
                 cmp    neg3,1
                 je     N3
                 jne    P3
       N3:       
                 print  menos
                 printn c3
                 print  x3
                 JMP    COF2
       P3:       
                 print  mas
                 printn c3
                 print  x3
                 JMP    COF2
       COF2:     
                 cmp    c2, 0
                 je     COF1
                 jne    PR2
       PR2:      
                 cmp    neg2,1
                 je     N2
                 jne    P2
       N2:       
                 print  menos
                 printn c2
                 print  x2
                 JMP    COF1
       P2:       
                 print  mas
                 printn c2
                 print  x2
                 JMP    COF1
       COF1:     
                 cmp    c1, 0
                 je     COF0
                 jne    PR1
       PR1:      
                 cmp    neg1,1
                 je     N1
                 jne    P1
       N1:       
                 print  menos
                 printn c1
                 print  x1
                 JMP    COF0
       P1:       
                 print  mas
                 printn c1
                 print  x1
                 JMP    COF0
       COF0:     
                 cmp    neg0,1
                 je     N0
                 jne    P0
       N0:       
                 print  menos
                 printn c0
                 JMP    salir
       P0:       
                 print  mas
                 printn c0
                 JMP    salir
       salir:    
                 print  ln
                 print  inicio09
                 print  ln
endm
; imprime la derivada
printDerivada macro c4, c3, c2, c1, c0
                     LOCAL  COF4,PR4,N4,P4,COF3,PR3,N3,P3,COF2,PR2,N2,P2,COF1,PR1,N1,P1,COF0,PR0,N0,P0,salir
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
                 cmp    neg4,1
                 je     N4
                 jne    P4
       N4:       
                 print  menos
                 printn c4
                 print  x4
                 JMP    COF3
       P4:       
                 print  mas
                 printn c4
                 print  x4
                 JMP    COF3
       COF3:     
                 cmp    c3, 0
                 je     COF2
                 jne    PR3
       PR3:      
                 cmp    neg3,1
                 je     N3
                 jne    P3
       N3:       
                 print  menos
                 printn c3
                 print  x3
                 JMP    COF2
       P3:       
                 print  mas
                 printn c3
                 print  x3
                 JMP    COF2
       COF2:     
                 cmp    c2, 0
                 je     COF1
                 jne    PR2
       PR2:      
                 cmp    neg2,1
                 je     N2
                 jne    P2
       N2:       
                 print  menos
                 printn c2
                 print  x2
                 JMP    COF1
       P2:       
                 print  mas
                 printn c2
                 print  x2
                 JMP    COF1
       COF1:     
                 cmp    c1, 0
                 je     COF0
                 jne    PR1
       PR1:      
                 cmp    neg1,1
                 je     N1
                 jne    P1
       N1:       
                 print  menos
                 printn c1
                 print  x1
                 JMP    COF0
       P1:       
                 print  mas
                 printn c1
                 print  x1
                 JMP    COF0
       COF0:     
                 cmp    neg0,1
                 je     N0
                 jne    P0
       N0:       
                 print  menos
                 printn c0
                 JMP    salir
       P0:       
                 print  mas
                 printn c0
                 JMP    salir
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