.286                        ; esto se puede comentar si estas corriendolo en el emu8086
pila segment stack          ; segmento de pila                                                    
    db 32 DUP('stack--')
pila ends

datos segment           ; segmento de datos
    letrero1 db 10,13,'1.Suma $'
    letrero2 db 10,13,'2.Resta $'
    letrero3 db 10,13,'3.Multiplicacion$'
    letrero4 db 10,13,'4.Division$'
    letrero5 db 10,13,'5.Cambiar a azul la pantalla$'
    letrero6 db 10,13,'6.Salir$'
    letrero7 db 10,13,'Selecciona una opcion $'
    letrero8 db 10,13,'Ingresa un numero: $'
    letrero9 db 10,13,'El resultado es: $'
    n1 db ?
    n2 db ?
    
datos ends

codigo segment 'code'   ; segmento de codigo
main proc FAR
    assume ss:pila, ds:datos, cs:codigo

    mov ax,datos
    mov ds,ax
    mostrar_menu:       ; etiqueta donde vamos a redireccionar nuestro menu
        mov ah,06h      ; funcion que limpia pantalla
        mov al,00h      ; 
        mov bh,02h      ; primer digito pone el color de la pantalla el segundo el de la letra
        mov cx,0000h    ; coordenadas donde empieza
        mov dx,184fh    ; coordenadas donde acaba
        int 10h
        
        mov ah,02h      ; funcion que posiciona el cursor en pantalla
        mov bh,00h      ; 
        mov dx,0000h    ; coordenandas donde ira el cursor
        int 10h
 
        mov ah,09h      ; imprime el letrero 1
        lea dx,letrero1
        int 21h 
    
        lea dx,letrero2 ; imprime el letrero 2
        int 21h
    
        lea dx,letrero3
        int 21h
    
        lea dx,letrero4
        int 21h
    
        lea dx,letrero5
        int 21h
        
        lea dx,letrero6
        int 21h
      
        lea dx,letrero7
        int 21h
    
        mov ah,01h      ; solicita una opcion al usuario
        int 21h
    
        cmp al,31h      ; compara las opciones que el usuario ingresa 
        je sub_opcion1  ; si presiono 1 realizara un salto intermedio a la opcion 1
        cmp al,32h      ; si presiono 2 realiza el salto intermedio a la opcion 2
        je sub_opcion2
        cmp al,33h
        je sub_opcion3
        cmp al,34h
        je sub_opcion4
        cmp al,35h
        je sub_opcion5
        cmp al,36h
        je sub_opcion6
        
    jmp mostrar_menu    ; si no actua por default y va de nuevo a presentar el menu
    
      sub_opcion1:
        jmp opcion1     ; cuando llegamos a esta opcion saltamos a la primera opcion
      sub_opcion2:
        jmp opcion2
      sub_opcion3:
        jmp opcion3
      sub_opcion4:
        jmp opcion4
      sub_opcion5:
        jmp opcion5
      sub_opcion6:
        jmp opcion6
     
    opcion1:                ; opcion 1 para hacer sumas
        mov ah,06h          ; funcion para limpiar pantalla
        mov al,00h
        mov bh,02h
        mov cx,0000h
        mov dx,184fh
        int 10h
        
        mov ah,02h          ; posiciona el cursor al principio
        mov bh,00h
        mov dx,0000h
        int 10h
        
        mov ah,09h          ; funcion para imprimir una cadena en pantalla
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n1,al
        ;---------
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n2,al
        
        ;-----suma-----
        mov bh,n1
        mov bl,n2
        
        add bh,bl
        
        mov ah,09h
        lea dx,letrero9
        int 21h
        
        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h
        
        mov ah,01h
        int 21h
        
        
    jmp mostrar_menu
    opcion2:
        mov ah,06h
        mov al,00h
        mov bh,02h
        mov cx,0000h
        mov dx,184fh
        int 10h
        
        mov ah,02h
        mov bh,00h
        mov dx,0000h
        int 10h
        
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n1,al
        ;------------------
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n2,al
        
        ;------Resta-------
        mov bh,n1
        mov bl,n2
        
        sub bh,bl
        ;-----Fin Resta-----
        mov ah,09h
        lea dx,letrero9
        int 21h
        
        mov ah,02h
        mov dl,bh
        add dl,30h
        int 21h
        
        mov ah,01h
        int 21h
        
    jmp mostrar_menu
    opcion3:
        mov ah,06h
        mov al,00h
        mov bh,02h
        mov cx,0000h
        mov dx,184fh
        int 10h
        
        mov ah,02h
        mov bh,00h
        mov dx,0000h
        int 10h
        
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n1,al
        ;------------------
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n2,al
        
        ;----Mult--------
        mov al,n1   ; aca por regla los guardamos en estos registros
        mov bl,n2   ; si no ensamblador no nos va a dar el resultado correcto
        mul bl      ; REALIZAMOS LA MULTIPLICACION
        mov cl,al    ; guardamos el resultado que se guarda en al en la variable r
        
        ;-------------------------
        mov ah,09h
        lea dx,letrero9
        int 21h
        
        mov ah,02h
        mov dl,cl
        add dl,30h
        int 21h
        
        mov ah,01h
        int 21h
        
    jmp mostrar_menu
    opcion4:
        mov ah,06h
        mov al,00h
        mov bh,02h
        mov cx,0000h
        mov dx,184fh
        int 10h
        
        mov ah,02h
        mov bh,00h
        mov dx,0000h
        int 10h
        
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n1,al
        ;------------------
        mov ah,09h
        lea dx,letrero8
        int 21h
        
        mov ah,01h
        int 21h
        
        sub al,30h
        mov n2,al
        
        ;--------Division----------------
        ;proceso division
        mov ax,0h   ; IMPORTANTE SIEMPRE LIMPIAR EL REGISTRO AX ANTES DE HACER LA DIVISION
        mov al,n1   ; guardamos nuestros digitos en los registros al y bl
        mov bl,n2   ; es importante seguir este orden si no nos va a dar el resultado correcto
        div bl      ; REALIZO LA DIVISION
        mov cl,al   ; guardamos el resultado en el registro cl por gusto no por alguna norma que me obligue
                    ; recordemos que el resultado de la division se guarda en el registro al y el mod 
                    ; en el registro AH
        ;-------------------------------------
        
        mov ah,09h
        lea dx,letrero9
        int 21h
        
        mov ah,02h
        mov dl,cl
        add dl,30h
        int 21h
        
        mov ah,01h
        int 21h
        
    jmp mostrar_menu
    opcion5:
        mov ah,06h
        mov al,00h
        mov bh,30h
        mov cx,0000h
        mov dx,184fh
        int 10h
        
        mov ah,01h
        int 21h
        
    jmp mostrar_menu
    opcion6:
        mov ah,4ch
        int 21h
    jmp mostrar_menu
    ret
main endp
codigo ends
end main
;----------------------------------------DirtyCode 2021--------------------------------------------