; mover el contenido de una cadena a otra 
; usando movsb
.model small    
.stack
.data
    letrero1 db 'Hola$'
    letrero2 db 'Adios$'
    espacio db 10,13,'$'
.code
    main proc far
        mov ax,@data
        mov ds,ax
        mov es,ax
        
        mov ah,09h
        lea dx,letrero1
        int 21h
        
        ; aca fijamos a SI yDI  para que se desplazen
        ; y vaya moviendo caracter por caracter
        lea di,letrero1
        mov si,offset letrero2
        mov cx,3
        ; se justa el contador (CX) a el numero de caracteres que deseemos cambiar
        rep movsb
        ; aplicamos repeat mover string byte por byte
        ; ya que lo movio a la cadena letrero1
        ; lo muestra
        mov ah,09h
        mov dx,offset espacio
        int 21h
        
        lea dx, letrero1
        int 21h
        
        mov ah,4ch
        int 21h
        
.exit
main endp
end main
;-------------------------DirtyCode 2021---------------------------------
