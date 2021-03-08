; practica 05
; Piramide de * de lado izquierdo
.model small        ; modelo de datos
.stack              ; segmento de pila
    .data           ; segmento de datos
    asterisco db '*','$'    
    x db 0h
    y db 0h
    cant db 01h
    altura db 0Ah
.code
    Main Proc FAR
    mov ax,@data
    mov ds,ax
    mov ch,00h
    mov cl,altura   ; aca se define el numero de pisos de la piramide
    
    primerFor:
        mov ah,02h  ; funcion para posicionar cursor en pantalla
        mov bh,00h  ; 
        mov dh,y    ; coordenadas de la fila
        mov dl,x    ; cooordenadas de la columna
        int 10h
        
        mov bx,cx   ; almaceno de forma temporal 
        
        mov ch,00h  ; limpio y asigno el valor nuevo al contador
        mov cl,cant
        
        segundoFor:     ; imprimo el * un numero de veces
            mov ah,02h
            mov dl,asterisco
            int 21h
        loop segundoFor
        
        mov cx,bx       ; regreso el contador a su valor anterior
        
        inc y           ; incremento y e incremento cantidad
        inc cant
     loop primerFor
     
     ;Triangulo 2       ; realizo el mismo procedimiento en el triangulo 2
     mov ch,00h
     mov cl,altura      ; establesco la altura
     
     dec y              ; decremento estos valores para no tener una fila repetida de *
     dec cant
     
     pri_For:
        mov ah,02h
        mov bh,00h
        mov dh,y
        mov dl,x
        int 10h
        
        mov bx,cx
        mov ch,00h
        mov cl,cant
        
        seg_For:
            mov ah,02h
            mov dl,asterisco
            int 21h
        loop seg_For
        
        mov cx,bx
        
        inc y               ; aca solo incremento y porque va hacia abajo 
        sub cant,1          ; aca la cantidad va hacia abajo ya no se incrementa
        
        loop pri_For
        
        
    .exit
    main ENDP
    end main
;-----------------------------------------------------DirtyCode 2021----------------------------------------------------------------