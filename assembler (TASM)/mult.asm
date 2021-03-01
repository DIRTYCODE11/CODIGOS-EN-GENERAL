; Video 08 Curso Ensamblador
; Aprendiendo a realizar multiplicaciones con un solo digito
; aca se vera como hacer multiplicaciones con datos que solicita
; el usuario y datos estaticos
.286
pila segment stack  ; segmento de pila
    db 32 DUP('stack--')
pila ends

datos segment   ; segmento de datos
    letrero1 db 10,13,'Ingresa un numero de un digito: $'
    letrero2 db 10,13,'El resultado es: $'
    n1 db ?
    n2 db ?
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
    
    ;procedimiento de multiplicacion
    
    mov al,n1   ; aca por regla los guardamos en estos registros
    mov bl,n2   ; si no ensamblador no nos va a dar el resultado correcto
    mul bl      ; REALIZAMOS LA MULTIPLICACION
    mov r,al    ; guardamos el resultado que se guarda en al en la variable r
    
    mov ah,09h  ; Mostramos el resultado es:....
    lea dx,letrero2 
    int 21h
    
    mov ah,02h  ; imprimos en pantalla
    ;add r,30h  ; el caracter resultante que esta en r 
    mov dl,r    ; 
    add dl,30h  ; realizamos el ajuste en pantalla
    int 21h     
    
    mov ah,4ch ;funcion que finaliza un programa 
    int 21h

    ret
main endp
codigo ends
end main
;---------------------------DirtyCode 2021--------------------------------------