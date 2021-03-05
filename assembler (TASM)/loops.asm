
; practica para loops 
; imprimir el alfabeto 
.286 ; si lo emulas en 8086 quita esto
pila segment stack
db 32 DUP('stack--')
pila ends

datos segment
    letra db ?   
datos ends

codigo segment 'code'
    Main proc FAR
    assume ss: pila, ds: datos, cs: codigo
    
    mov ax, datos
    mov ds, ax
    
    mov cx,0h           ; limpiamos el registro cx
    mov cl,26           ; establecemos el contador en 26 debido a que son 26 letras del alfabeto
    
    ciclo:              ; ciclo para imprimir el alfabeto                                                                            
        add letra,65d   ; le agregamos 65d a la variable de control del programa como la variable i en un for normal
        
        mov ah,02h      ; imprimimos el caracter
        mov dl,letra
        int 21h
        
        mov ah,02h      ; imprimos un caracter de espacio
        mov dl,20h      ; le sumamos 20h o 32 en decimal
        int 21h
        
        sub letra,65d   ; le quitamos el 65 para que quede el valor puro
        inc letra       ; incrementamos nuestro contador que se llama letra
        loop ciclo      ; itera    y cx disminuye en 1, se detiene hasta que cx valga 0
      
      mov ah,4ch        ; finaliza el programa
      int 21h

    ret
    main ENDP
codigo ends
end main