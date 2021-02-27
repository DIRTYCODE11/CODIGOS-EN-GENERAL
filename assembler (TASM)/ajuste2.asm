; Ajustes parte 2 
; este programa permite al usuario ingresar un numero por teclado
; y mostrarse en pantalla usando los ajustes...

.286
pila segment stack  ; segmento de pila
    db 32 DUP('stack--')
pila ends

datos segment ; segmento de datos
    letrero1 db 10,13,'Ingresa un numero de un digito: $'
    letrero2 db 10,13,'El numero es: $'
datos ends

codigo segment 'code' ;segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo ; le indica a ensamblador que es cada segmento

    mov ax,datos
    mov ds,ax

    mov ah,09h      ; mostrar Ingresemos un digito
    lea dx, letrero1
    int 21h
    
    mov ah,01h      ;solicito un caracter
    int 21h
    sub al,30h      ; realizo el ajuste
    
    mov cl,al       ; lo guardo en el registro cl, por convencion no es porque siga alguna norma
    
    mov ah,09h      ; imprimo el letrero 2
    lea dx, letrero2
    int 21h
    
    mov ah,02h      ; imprimo un caracter en pantalla
    mov dl,cl       ; lo guardo en dl lo que tiene en cl, la funcion 02h nos dice que siempre usa el registro dl 
    add dl,30h      ; para almacenar y de ahi realizamos el ajuste
    int 21h

    mov ah,4ch ;funcion que finaliza un programa 
    int 21h

    ret
main endp
codigo ends
end main
;---------------------------------------------DirtyCode 2021----------------------------------------------