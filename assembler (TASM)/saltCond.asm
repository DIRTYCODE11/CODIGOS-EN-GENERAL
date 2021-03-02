; Saltos condicionales en ensamblador
; Se trata de una peque?o ejemplo 
; El cual  toma dos numeros del segmento de datos 
; y determina si son mayor menor o iguales
.286
pila segment stack  ; segmento de pila
    db 32 DUP('stack--')
pila ends

datos segment       ; segmento de datos
    letrero1 db 10,13,'mayor $'
    letrero2 db 10,13,'menor $'
    letrero3 db 10,13,'Iguales$'
    n1 db 5 ; aca puedes cambiar los numeros para probar
    n2 db 5 ; ...
    r db 0
datos ends

codigo segment 'code' ; segmento de codigo (Aca empezamos a programar)
main proc FAR
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    
    mov bl,n1   ; guardo en los registros los numeros que tenia definidos
    mov bh,n2
    
    cmp bh,bl   ; los comparo, como es bh con bl, si bh es mayor ve a la etiqurta mayor
    ja mayor    
    jb menor    ; si bh es menor a bl ve a la etiqueta menor
    je iguales  ; si son iguales ve a la etiqueta iguales
    
    menor:
        mov ah,09h      ; imprime es menor
        lea dx,letrero2
        int 21h 
        jmp salida      ; salto incondicional a la salida
    mayor:
        mov ah,09h      ; imprime es mayor
        lea dx,letrero1 
        int 21h
        jmp salida      ; salta a la salida
    iguales:
        mov ah,09h      ; imprime son iguales
        lea dx,letrero3
        int 21h
        jmp salida
        
    
     salida:         ; etiqueta a la que brincaran nuestras opciones 
                        ; despues de haber ejecutado lo que les tocaba
        mov ah,4ch ;funcion que finaliza un programa 
        int 21h

    ret
main endp
codigo ends
end main
;----------------------------DirtyCode 2021-----------------------------------