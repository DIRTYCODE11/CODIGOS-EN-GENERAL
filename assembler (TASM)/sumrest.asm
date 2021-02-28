; Video sumas y Restas con un solo digito
; Aca realizaremos una suma con datos pedidos desde el teclado
; por el usuario, pondremos en practica los ajustes
.286
pila segment stack  ;segmento de pila
    db 32 DUP('stack--')
pila ends       

datos segment ;segmento de datos
    letrero1 db 10,13,'Ingresa un numero de un digito: $'
    letrero2 db 10,13,'El resultado es: $'
    n1 db 0 ; definimos nuestras variables
    n2 db ? 
    r db 0
datos ends

codigo segment 'code' ; segmento de codigo aca empezamos a programar
main proc FAR
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    
    mov ah,09h      ; imprimo en pantalla el letrero para pedir un numero
    lea dx,letrero1
    int 21h
    
    mov ah,01h      ; solicito un caracter al usuario
    int 21h
    
    sub al,30h      ; realizo el ajuste y lo guardo en mi primer numero
    mov n1,al
    
    mov ah,09h      ; vuelvo a solicitar un digito en pantalla
    lea dx,letrero1
    int 21h
                
    mov ah,01h      ; solicito un numero por teclado
    int 21h
    
    sub al,30h      ; realizo el ajuste
    mov n2,al
    
    ;proceso de suma
    mov cl,n1       ; los guardo en esos registros por conviccion no por alguna norma en especifico
    mov ch,n2       ; cuando sumamos o restamos podemos usar cualquier registro las buenas practicas
                    ; sugieren que siempre se usen los registros al y bl pero igual es valido usar esos
    
    add ch,cl       ; ACA SE HACE LA SUMA
    mov r,ch        ; almaceno el resultado en una variable llamada r
    
    mov ah,09h      ; imprimo en pantalla el resultado es: .....
    lea dx,letrero2
    int 21h
    
    mov ah,02h      ; imprimo el caracter
    mov dl,r        ; que esta guardado en r
    add dl,30h      ; realizo el ajuste
    int 21h         ; interrupcion 21h
    
    
    
    mov ah,4ch      ;funcion que finaliza un programa 
    int 21h

    ret
main endp
codigo ends
end main
;------------------------------DirtyCode 2021------------------------------------
