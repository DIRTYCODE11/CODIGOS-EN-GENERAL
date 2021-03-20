; Tema: Obtener tama?o de una cadena
; Usaremos equ para hacerlo de manera estatica 
; size para hacerlo de manera dinamica
.model small    ;modelo de datos
.stack          ; segmento de pila
.data           ; segmento de datos
    cadena db 'Las vocales$'    
    num equ $-cadena        ; equ obtiene de manera estatica el tama?o de una variable en bytes
    tiene db 10,13,'Tiene un total de vocales $'
    total db ?
    cadena2 db 50 dup (' '),'$' ; esta sera para la parte dinamica
    num2 db ?
.code
    main proc far
        mov ax,@data
        mov ds,ax
        
        jmp dinamica    ; aca empieza la parte dinamica
        ;jmp estatica   ; aca es la parte estatica
        estatica:
        mov si,0        ; limpiamos SI
        mov dx,0h       ; igual el registro DX
        mov cx,num      ; fijamos el contador en el tam?o de la cadena
        
        etiqueta:       ; 
            mov al,cadena[si] ; guardo en el registro al el valor en la posicion en del arreglo
            cmp al,61h        ; a
            je vocal
            cmp al,65h        ; e
            je vocal
            cmp al,69h        ; i
            je vocal
            cmp al,6fh        ; o
            je vocal
            cmp al,75h        ; u
            je vocal
            
            regresa:
                inc si        ; va a incrementar 
         loop etiqueta        ; loop que va a iterar
         
         mov dh,0             ; aca limpiamos el registro dh
         mov total,dl         ; le asignamos a dl el valor de dl
         
         mov ah,09h             ; aca empieza a imprimir las palabras
         lea dx,cadena  
         int 21h
         
         mov ah,09h
         lea dx,tiene
         int 21h
         
         ; apartir de aca voy a imprimir el resultado ajustado que tiene 
         mov ax,0
         mov al,total
         aam            ; realizo el ajuste aaa
         add ax,3030h   ; realizo el ajuste para poderlo presentar
         mov bx,ax      ; guardo en bx lo que tiene ax
         
         mov ah,02h     ; empiezo con el proceso de impresion de caracteres 
         mov dl,bh      ; aca estan las decenas
         int 21h
         
         mov ah,02h     ; aca van la unidades
         mov dl,bl
         int 21h
         jmp salir      ; vamos a la salida 
         
         vocal:         ; 
            inc dl
            jmp regresa     
 ;--------------------------------FORMA DINAMICA -------------------------------------------
        dinamica:
           ; el proceso es similar solo cambia que aca primero solicitamos al usuario que digite
           ; su cadena
           mov si,0        ; con SI controlo el acceso a los elementos de la cadena
            llenar_cadena:  
                mov ah,01h  ; solicito un caracter al usuario
                int 21h     
                cmp al,13   ; comparo si es igual a la tecla enter
                je contar_vocales   ; si si voy a una etiqueta que se llame contar vocales
                mov cadena2[si],al  ; guardo en el elemento de mi cadena el caracter que guarde
                inc si              ; incremento el contador en 1
             jmp llenar_cadena      
             
             contar_vocales:        ; aca empieza el proceso que usamos en la parte estatica
                mov si,0
                mov dx,0h
                mov cx,size cadena2 ; con size le indicamos que queremos saber el tama?o de nuestra cadena
                ; se repite el mismo procedimeinto de aqui en adelante....
                
                 etiquetaD:
                    mov al,cadena2[si]
                    cmp al,61h
                    je vocalD
                    cmp al,65h
                    je vocalD
                    cmp al,69h
                    je vocalD
                    cmp al,6fh
                    je vocalD
                    cmp al,75h
                    je vocalD
            
                    regresaD:
                        inc si
                loop etiquetaD
         
                mov dh,0
                mov total,dl
         
                mov ah,09h
                lea dx,cadena2
                int 21h
         
                mov ah,09h
                lea dx,tiene
                int 21h
         
                mov ax,0
                mov al,total
                aam
                add ax,3030h
                mov bx,ax
         
                mov ah,02h
                mov dl,bh
                int 21h
         
                mov ah,02h
                mov dl,bl
                int 21h
                jmp salir
         
                vocalD:
                    inc dl
                jmp regresaD
             
        salir:
        mov ah,4ch
        int 21h

.exit
main ENDP
end main

;--------------------------------------------DirtyCode 2021------------------------------------