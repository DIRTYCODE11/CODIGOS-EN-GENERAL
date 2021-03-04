; Interrupcion 10h
; con ella podemos trabajar cosas relacionadas a la pantalla

.286            ; esto se puede comentar si estas corriendolo en el emu8086
pila segment stack          ; segmento de pila                                                    
    db 32 DUP('stack--')
pila ends

datos segment           ; segmento de datos
    letrero1 db 'Hola: $'
datos ends

codigo segment 'code'   ; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    
    mov ah,02h      ; funcion para posicionar el cursor en la pantalla
    mov bh,00h      ; modo de video
    mov dh,05h      ; columna donde se pondra
    mov dl,0Ah      ; fila donde se pondra
    int 10h
    
    mov ah, 09h     ; funcion que imprime una cadena en pantalla
    lea dx,letrero1
    int 21h
    
    mov ah,01h      ; funcion que permite capturar un digito en pantalla
    int 21h
    
    mov ah,02h      ; funcion para posicionar el cursor en pantalla
    mov bh,00h
    mov dh,05h
    mov dl,0Ah
    int 10h
    
    mov ah,06h      ; funcion que dezplaza lineas hacia arriba (limpiar pantalla)
    mov al,00h      ; modo de video
    mov bh,12h      ; atributo a usar: el primer digito es el color de la pantalla el segundo el del texto
    mov cx,0000h    ; filas y columnas donde empezara 
    mov dx,184fh    ; filas y columnas donde acabara la limpieza de pantalla
    int 10h
    
    mov ah,09h      ; funcion que imprime un letrero en pantalla
    lea dx,letrero1 
    int 21h
    
    salida:
        mov ah,4ch  ; funcion que finaliza un programa 
        int 21h

    ret
main endp
codigo ends
end main
;----------------------------------------DirtyCode 2021--------------------------------------------