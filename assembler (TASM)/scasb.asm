.model small
.stack 
.data
    letrero1 db 10,13,'Ingresa una palabra $'
    letrero3 db 10,13,'Son iguales $'
    letrero2 db 10,13,'No son iguales $'   
    cadena1 db 50 dup ('$')
    cadena2 db 50 dup ('$') 
    contador db 0h
    contador2 db 0h 
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
        
        mov si,0        ; con SI controlo el acceso a los elementos de la cadena
            llenar_cadena1:  
                mov ah,01h  ; solicito un caracter al usuario
                int 21h     
                cmp al,13   ; comparo si es igual a la tecla enter
                je  muestra_letrero2  ; si si voy a una etiqueta que se llame contar vocales
                mov cadena1[si],al  ; guardo en el elemento de mi cadena el caracter que guarde
                inc si  
                inc contador            ; incremento el contador en 1
             jmp llenar_cadena1 
        
        ; solictamos otra cadena
        muestra_letrero2:
            mov ah,09h
            lea dx,letrero1
            int 21h
        ; y almacenamos el resultado en cad2
        mov si,0        ; con SI controlo el acceso a los elementos de la cadena
            llenar_cadena2:  
                mov ah,01h  ; solicito un caracter al usuario
                int 21h     
                cmp al,13   ; comparo si es igual a la tecla enter
                je  ajusta_cadenas  ; si si voy a una etiqueta que se llame contar vocales
                mov cadena2[si],al  ; guardo en el elemento de mi cadena el caracter que guarde
                inc si
                inc contador2              ; incremento el contador en 1
             jmp llenar_cadena2 
        
        ajusta_cadenas:
        mov al,contador
        mov ah,contador2
        cmp al,ah
        je continuar_proceso
        jne no_iguales
        
        continuar_proceso: 
        
        mov ch,0h
        mov cl,contador
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
