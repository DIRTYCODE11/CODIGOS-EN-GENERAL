; Comparar 2 cadenas con ExtraSegment y 
; cmpsb (CompareSubString)
; repe  (Repeat equals) repite si es igual a 0 si da 1 se rompe 
; y se activa la ZF=1
; ingresamos 2 cadenas y las compara con SI y DI 
.model small
.stack 
.data
    letrero1 db 10,13,'Ingresa una palabra $'
    letrero3 db 10,13,'Son iguales $'
    letrero2 db 10,13,'No son iguales $'   
    cadena1 db 50 dup (' '),'$'
    cadena2 db 50 dup (' '),'$'  
.code
    main proc far
        mov ax,@data
        mov ds,ax
        mov es,ax
        ;cmpsb
        ; pedimos la primer cadena
        mov ah,09h
        lea dx,letrero1
        int 21h
        ;con esta funcion capturamos cosas desde teclado
        mov ah,3fh
        mov bx,00h
        mov cx,50d
        lea dx,cadena1
        int 21h
        ; solictamos otra cadena
        mov ah,09h
        lea dx,letrero1
        int 21h
        ; y almacenamos el resultado en cad2
        mov ah,3fh
        mov bx,00h
        mov cx,50d
        lea dx,cadena2
        int 21h
        
        ; llamamos a hacer el desplzamiento en cada cadena
        lea si,cadena1
        lea di,cadena2
        
        repe cmpsb      ; repeat equals compare substring (tambien podemos usar repz (repeat if zero)
        je iguales      ; si fueron iguales todos los caracteres ira a esta etiqueta
        jne no_iguales  ; en caso contrario a esta
        
        iguales:
            mov ah,09h
            lea dx,letrero3
            int 21h
            jmp salida
        no_iguales:
            mov ah,09h
            lea dx,letrero2
            int 21h
            jmp salida
           
        
        salida:
        mov ah,4ch
        int 21h
.exit
main endp
end main
;------------------------------------DirtyCode 2021-----------------------------------------