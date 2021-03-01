; Video 08 Curso Ensamblador
; Aprendiendo a realizar divisiones con un solo digito
; aca se vera como hacer divisiones con datos que solicita
; el usuario y datos estaticos
.286
pila segment stack  ; segmento de pila
    db 32 DUP('stack--')
pila ends

datos segment   ; segmento de datos
    letrero1 db 10,13,'Ingresa un numero de un digito: $'
    letrero2 db 10,13,'El resultado es: $'
    n1 db 8
    n2 db 4
    r db 0
datos ends

codigo segment 'code'   ; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    
    mov ah,09h  ; funcion para imprimir Ingresa un digito
    lea dx,letrero1
    int 21h
    
    mov ah,01h ; funcion para capturar un digito de teclado
    int 21h
    sub al,30h  ; realizamos el ajuste
    mov n1,al   ; lo guardamos en n1
    
    mov ah,09h  ; volvemos a solicitar un numero al usuario
    lea dx,letrero1
    int 21h
    
    mov ah,01h  ; capturamos lo que ingrese
    int 21h
    sub al,30h  ; realizamos el ajuste
    mov n2,al   ; lo guardamos en n2
    
    
    ;proceso division
    mov ax,0h   ; IMPORTANTE SIEMPRE LIMPIAR EL REGISTRO AX ANTES DE HACER LA DIVISION
    mov al,n1   ; guardamos nuestros digitos en los registros al y bl
    mov bl,n2   ; es importante seguir este orden si no nos va a dar el resultado correcto
    div bl      ; REALIZO LA DIVISION
    mov cl,al   ; guardamos el resultado en el registro cl por gusto no por alguna norma que me obligue
                ; recordemos que el resultado de la division se guarda en el registro al y el mod 
                ; en el registro AH
    
    mov ah,09h  ; funcion para imprimir el resultado es:.....
    lea dx,letrero2
    int 21h
    
    mov ah,02h  ; imprimos nuestro resultado.... que se guardo en el registro cl
    mov dl,cl   ; le realizamos el ajuste
    add dl,30h  ; 
    int 21h
    
    
    mov ah,4ch ;funcion que finaliza un programa 
    int 21h

    ret
main endp
codigo ends
end main
;------------------------------DirtyCode 2021------------------------------------------