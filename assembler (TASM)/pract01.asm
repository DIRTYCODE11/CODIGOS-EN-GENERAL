; Practica 01 Comparar 3 numeros y determinar 
; Quien es menor mayor y quien esta enmedio
; Este codigo fue probado casi en su totalidad, si 
; hubiera algun incoveniente pueden hacerlo saber 
; El funcionamiento es... El usuario ingresa 3 numeros
; de un solo digito y el programa los ordena
; Solo se trabajo mayores o menores si son iguales el programa puede diferir
;NOTA: si no entiendes el uso de las funciones consulta el video de interrupciones
; y el video de Hola Mundo ahi se explica a detalle el porque esas funciones
.286            ; esto se puede comentar si estas corriendolo en el emu8086
pila segment stack          ; segmento de pila                                                    
    db 32 DUP('stack--')
pila ends

datos segment           ; segmento de datos
    letrero1 db 10,13,'mayor: $'
    letrero2 db 10,13,'menor: $'
    letrero3 db 10,13,'enmedio: $'
    letrero4 db 10,13,'Ingresa un digito: ','$'
    n1 db ?
    n2 db ?
    n3 db ?
    mayor db ?
    menor db ?
    enmedio db ?
datos ends

codigo segment 'code'   ; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    ;------------------------Parte donde se solicitan los numeros------------------------
    mov ah,09h              ; funcion que imprime en pantalla     
    lea dx,letrero4
    int 21h
    
    mov ah,01h              ; funcion que nos permite capturar un dato de teclado
    int 21h
    sub al,30h              ; realizamos el ajuste
    mov n1,al               ; se guarda en n1
    
    mov ah,09h              ; funcion que imprime en pantalla
    lea dx,letrero4
    int 21h
    
    mov ah,01h              ; funcion que permite capturar un dato de teclado
    int 21h
    sub al,30h              ; realiza el ajuste
    mov n2,al               ; lo guarda en n2
    
    mov ah,09h              ; funcion que imprime en pantalla 
    lea dx,letrero4
    int 21h
    
    mov ah,01h              ; solicitamos un caracter por teclado
    int 21h
    sub al,30h              ; realiza el ajuste
    mov n3,al               ; se guarda en n3
    
;-------------------------------------Parte de asignacion a los registros----------------------------------
    mov bl,n1
    mov bh,n2
    mov cl,n3
    
;------------------------------------Comienza la parte logica-----------------------------------------
    ; Aca se trabaja cual de los numeros es el mayor
    cmp bl,bh ;compara el numero 1 con el numero 2 
    ja mayor_n1 ; si el numero 1 es mayor ve a esta etiqueta
    jna mayor_n2 ; en caso contrario ve a esta otra etiqueta 
    
    mayor_n1:       ; etiqueta por si el n1 fue mayor
        mov mayor,bl    ; el mayor sera n1
        cmp mayor,cl    ; ahora se compara con n3
        jna mayor_n1_1  ; salta a esta etiqueta solo si n3 fue el mayor
        
        jmp salir       ; si no sale a esta etiqueta
        
        mayor_n1_1:
            mov mayor,cl    ;mayor sera n3
            jmp salir
            
    mayor_n2:               
            mov mayor,bh    ; el mayor es n2
            cmp mayor,cl    ; lo compara con n3
            jna mayor_n2_2  ; si n3 es el mayor va a esta etiqueta
            jmp salir       ; si no salta a esta etiqueta
            
            mayor_n2_2:     ; aca asigna el mayor a n3
                mov mayor,cl
                jmp salir
    salir:                  ; aca solo se verifica quien es el mayor de los 3
        cmp bl,mayor        ; el mayor es n1?
        je mayor1           ; si si ve a esta etiqueta
        cmp bh,mayor        ; el mayor es n2?
        je mayor2           ; ...
        cmp cl,mayor        ; el mayor es n3?
        je mayor3
        
        mayor1:             ; si n1 fue el mayor se ejecuta el contenido que aca hay
            cmp bh,cl       ; ahora compara para ver quien esta enmedio 
            ja enmedio_1    ; si n2 es mayor a n3 n2 sera el de enmedio
            jb enmedio_2    ; si n3 es mayor a n2 n3 sera el de enmedio
            
            enmedio_1:
                mov enmedio,bh  ; aca nadamas asigna quien sera el de enmedio y el menor
                mov menor,cl
                jmp imprime     ; para ir a la etiqueta para imprimir el resultado final
            enmedio_2:
                mov enmedio,cl
                mov menor,bh
                jmp imprime
         mayor2:                ; aca se activa si n2 fue el mayor
                cmp bl,cl       ; compara ahora n1 con n3 y ve quien es el mayor
                ja enmedio_3    ; si n1 es mayor a n3 n1 sera el de enmedio
                jb enmedio_4    ; si n3 es mayor a n1 n3 sera el de enmedio
                
                enmedio_3:
                    mov enmedio,bl  ; aca asigna nadamas los valores de enmedio y menor
                    mov menor,cl
                    jmp imprime
                enmedio_4:
                    mov enmedio,cl
                    mov menor,bl
                    jmp imprime
          mayor3:                   ; si n3 fue el mayor 
                cmp bl,bh           ; compara a bl con bh 
                ja enmedio_5        ; si n1 es mayor a n2 n1 sera el de enmedio
                jl enmedio_6        ; si n2 es mayor a n1 n2 sera el de enmedio
                
                enmedio_5:
                    mov enmedio,bl  ; aca asigna al de enmedio a n1
                    mov menor,bh    ; y el menor es n2
                    jmp imprime
                 enmedio_6:
                    mov enmedio,bh  ; aca asigna a n2 como enmedio
                    mov menor,bl    ; y n1 como menor
                    jmp imprime
;--------------------------------------Fin Parte Logica -------------------------------------
           imprime:                 ; aca empezamos el proceso de impresion
                    mov ah,09h
                    lea dx, letrero1    ; imprime mayor: 
                    int 21h
                    
                    mov ah,02h          ; imprime el numero mayor
                    mov dl,mayor
                    add dl,30h          ; realiza el ajuste
                    int 21h
                    
                    mov ah,09h          ; imprime en pantalla menor: 
                    lea dx, letrero3
                    int 21h
                    
                    mov ah,02h          ; muestra el numero de enmedio
                    mov dl,enmedio
                    add dl,30h
                    int 21h
                    
                    mov ah,09h          ; muestra en pantalla menor:
                    lea dx, letrero2
                    int 21h
                    
                    mov ah,02h          ; imprime en pantalla el menor
                    mov dl,menor
                    add dl,30h
                    int 21h    
    
    salida:
        mov ah,4ch                      ;funcion que finaliza un programa 
        int 21h

    ret
main endp
codigo ends
end main
;----------------------------------------DirtyCode 2021--------------------------------------------