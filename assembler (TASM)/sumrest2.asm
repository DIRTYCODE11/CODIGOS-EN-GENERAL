; Video Resta con un solo digito
; Aca realizaremos una resta con datos pedidos desde el teclado
; por el usuario, pondremos en practica los ajustes
.286    
pila segment stack      ; segmento de pila
    db 32 DUP('stack--')
pila ends

datos segment
    letrero1 db 10,13,'Ingresa un numero de un digito: $'
    letrero2 db 10,13,'El resultado es: $'
    n1 db ? ; defino mis variables donde guardare los numeros
    n2 db ?
    r db 0
datos ends

codigo segment 'code' ; segmento de codigo
main proc FAR   
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    
    mov ah,09h          ; imprimo que el usuario solicite un digito
    lea dx,letrero1     
    int 21h
    
    mov ah,01h          ; solicito un caracter al usuario
    int 21h
    
    sub al,30h          ; realizo el ajuste para obtener el valor puro
    mov n1,al           ; lo guardo en mi variable n1
    
    mov ah,09h          ; imprimo el letrero para pedir el otro numero    
    lea dx,letrero1
    int 21h
    
    mov ah,01h          ; solicito el numero 
    int 21h
    
    sub al,30h          ; Realizo el ajuste
    mov n2,al           ; se guarda en n2
    
    ;proceso de resta
    mov cl,n1           ; guardo en cl el numero mayor
    mov ch,n2           ; guardo en ch el numero menor 
                        ; la razon como comente en el video aun no vemos banderas ni comparaciones 
                        ; para determinar como saber quien es mayor    
    
    sub cl,ch           ; REALIZO LA RESTA
    mov r,cl            ; guardo el resultado en una variable llamada R
    
    mov ah,09h          ; imprimo en pantalla el resultado es....
    lea dx,letrero2
    int 21h
    
    mov ah,02h          ; funcion para imprimir un unico caracter en pantalla
    mov dl,r            ; le digo que sea r el digito a imprimir
    add dl,30h          ; realizo el ajuste para mostrarlo en pantalla
    int 21h
    
    mov ah,4ch         ;funcion que finaliza un programa 
    int 21h

    ret
main endp
codigo ends
end main
;----------------------------------DirtyCode 2021--------------------------------------