; Programa que determina si un numero de un solo digito es primo o no
; usando loops
; 
.model small    ; La directiva .MODEL define el tipo de memoria que se utilizará
.stack          ; segmento de pila
.data           ; segmento de datos
    n db ?      
    sies db 10,13,'Es primo$'
    noes db 10,13,'No es primo$'
    input db 10,13,'Ingresa un numero $'
    i db 0
.code           ; segmento de codigo
    main proc far
    mov ax,@data
    mov ds,ax
    
    mov ah,09h      ; funcion para imprimir en pantalla una cadena
    lea dx,input    
    int 21h
    
    mov ah,01h      ; solicito al usuario que digite un numero
    int 21h 
    sub al,30h      ; realizo el ajuste
    
    mov n,al        ; lo guardo en mi variable n
    mov cx,0h       ; limpio mi contador
    mov cl,n        ; le paso como valor maximo el numero que definio el usuario (for...; i<=n;.... )
    mov si,0        ; establezco si como un contador que usare y lo posiciono en 0
    for:            ; comienzo con mi etiqueta for
      inc i         ; incremento i en 1 (for int i=1;...;i++)
      mov ax,0000h  ; para realizar la division siempre se debe limpiar el registro ax
      mov al,n      ; establecemos el numero como dividendo
      mov bl,i      ; el valor de i sera el divisor
      div bl        ; realiza la division n/i
        
      cmp ah,0      ; el modulo se guarda en el registro ah y se compara con 0 para ver si fue entera la division
      je isprime    ; si es cero incrementa el valor de SI en 1
      jne noprime   ; si no sigue iterando con el loop
      
        isprime:
            inc si 
        noprime:
      loop for

    cmp si,2        ; finalizando el loop compara si el registo SI es 2 por la analogia de un numero primo
    jz primo        ; si es cierto va a imprimir que es primo 
    jnz noprimo     ; si no imprimira que no es primo

    primo:
        mov ah,09h
        lea dx,sies
        int 21h
        jmp salir
    noprimo:
        mov ah,09h
        lea dx,noes
        int 21h            
    salir:          ; salta a la salida
        mov ah,4ch
        int 21h
main endp
end main
; --------------------------------DirtyCode 2021-----------------------------------------------
