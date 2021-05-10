; Programa que presionando sobre una X 
; se finaliza usando el mouse 
; para esto es necesario saber sobre el manejo de las 
; interrupciones 10H, 21H, 33H

.model small
.stack
.data
     der db 10,13,'Derecho$'
     izq db 10,13,'Izquierda$'
     coordX db ?    ; cx
     coordY db ?    ; dx
.code
    main proc far
    mov ax,@data
    mov ds,ax
    
    ; primero posicionamos el cursor en pantalla en las coordenadas (0,79)
    mov ah,02h
    mov bh,00
    mov dl,79d
    mov dh,0h
    int 10h
    ; imprimimos el caracter de la X ahi 
    mov ah,02h
    mov dl,'X'
    int 21h
    ; Activamos el handler del mouse
    mov ax,00h
    int 33h
    ; lo hacemos visible e indicamos esta etiqueta que nos sera de utilidad
    consultar:
    mov ax,01h
    int 33h
    ; Con esta funcion obtenemos el clic con el que se hizo y las coordenadas en pixeles
    ; de donde anda el cursor
    mov ax,03h
    int 33h
    
    cmp bx,1    ; si se presiono clic izquierdo
    je izquierda ; ve a una etiqueta que se llama izquierda 
    cmp bx,2    ; si no compara ahora a ver si no es clic derecho
    jmp consultar   ; si si es vuelve a consultar porque solo se debe validar con clic izquierdo
    
     izquierda:
        ; el valor de las lineas horizontales se van del registro cx a ax para dividirlos
        mov ax,cx
        mov bl,8    ; en bl se guarda el valor dde 8 porque para hacer la conversion es necesario
        div bl      ; se conoce como mickey el valor obtenido
        mov coordX,al   ; cuardamos el valor de la division en coordX
        
        mov ax,dx       ; aplicamos el mismo proceso 
        mov bl,8
        div bl
        mov coordY,al   ; se guarda en coordY
        
        cmp coordY,0    ; Ahora comprobamos que este en ese rango en este caso en la fila 0
        je comprobar_vertical   ; si es correcto ve a comprobar que este en la vertical igual
        jmp consultar
            
        comprobar_vertical:
            cmp coordX,4FH  ; 4FH = 79D 
            je salida       ; si es verdad sal del programa
            jmp consultar
            
    salida:
    mov ax,02h
    int 33h
    
    mov ah,4ch
    int 21h
.exit
main endp
end main
;--------------------------------------------------------DirtyCode 2021------------------------------------------