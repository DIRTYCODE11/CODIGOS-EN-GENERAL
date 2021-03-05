; Practica 03 con comparativos 
; Consiste en una piramide de * usando cmp 
; y las funciones de la int 21h y 10h
.286
pila segment stack
db 32 DUP('stack--')
pila ends

datos segment
    asterisco db '*', '$'
    x db 28h
    y db 0h
    aux db 6 ;Modificar aca para establecer la cantidad de filas
    cant db 01h
datos ends

codigo segment 'code'
    Main proc FAR
    assume ss: pila, ds: datos, cs: codigo
    
    mov ax, datos
    mov ds, ax
    
        mov ah,06h      ; funcion para limpiar pantalla
        mov al,00h
        mov bh,0Eh      ; color negro para el fondo y amarillo para el texto
        mov cx,0000h    ; coordenadas donde comienza
        mov dx,184fh    ; coordenadas donde termina el limpiado de pantalla
        int 10h
        
        xor cx, cx          ;Reseteo del contador principal (tambien se puede usar mov cx,0000h
    primerC:
        mov ah, 02h        ; Aca posicionamos el cursor en una parte de la pntalla
        mov bh, 00h 
        mov dh, y      ; coordenadas de las filas
        mov dl, x      ; coordenadas de las columnas
        int 10h 
        
        mov bx, cx       ; Almaceno temporalmente el contador principal
        
        xor cx, cx       ; Reseteo del contador
        segundoC:        ; Ciclo para el pintado de los asteriscos
            mov ah, 02h  ; Aca imprimimos el * el numero de veces que se le indique
            mov dl,asterisco
            int 21h
            
            inc cl
            cmp cl, cant   ; compara si la cantidad de * es igual a la cantidad que se debe pintar
            jb segundoC    ; si es menor continuara pintando
        
        mov cx, bx         ; Recupero el contador principal
        
        dec x              ; aca actualizamos la columna donde se va a posicionar ahora el cursor
        inc y              ; aca actualizamos la fila donde se va a posicionar ahora el cursor
        
        add cant, 2        ; le aumentamos dos a la cantidad de * que debe pintar
        
        inc cl             ; incrementa en 1 el contador cl
        
        cmp cl, aux        ; Repetir n veces
        jb primerC
    
    mov ah,4ch              ; funcion que finaliza un programa
    int 21h
    
    ret
    main ENDP
codigo ends
end main
;-----------------------------------DirtyCode 2021--------------------------------------------------