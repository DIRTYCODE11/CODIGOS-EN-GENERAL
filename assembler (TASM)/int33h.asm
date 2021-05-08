; Ejemplo de Manejo de mouse
; Parte 1
; Aca vemos con la interrupcion 33H activaremos el mouse y manejaremos los aspectos
; mas basicos.
.model small
.stack
.data
     der db 10,13,'Derecho$'
     izq db 10,13,'Haz pulsado Izquierda se finalizara el programa$'
.code
    main proc far
    mov ax,@data
    mov ds,ax
    
    ; Activamos el driver del mouse
    mov ax,00h
    int 33h
    ;Lo hacemos visible (el cursor)
    mov ax,01h
    int 33h
    ;aca posicionamos el cursor en pantalla
    mov ah,02h
    mov bh,00
    mov dl,79d
    mov dh,0h
    int 10h
    ; imprimimos el caracter X
    mov ah,02h
    mov dl,'X'
    int 21h
    
    ; Aca empieza el manejo a profundida del mouse
    ; consultamos con esta funcion que nos devuelve 
    ; el valor de las coordenadas y el clic que se uso 
    ; 1 es clic izquierdo 2 es derecho
    consultar:
    mov ax,03h
    int 33h
    ; comparamos si se hizo clic derecho, por defecto esta viene activada
    cmp bx,2
    je derecho
    ; si no compara ahora si se tiene presionado el clic izquierdo
    cmp bx,1
    je izquierda
    ; en esta etiqueta imprimira si se presiona el derecho
    derecho: 
        mov ah,09h
       lea dx,der
       int 21h
       jmp consultar
    ; aca si lo presiona dice que lo presiono y finaliza el programa
    izquierda:
       mov ah,09h
       lea dx, izq
       int 21h
       jmp salida
    salida:
    mov ah,4ch
    int 21h
.exit
main endp
end main
;-------------------------------------------DirtyCode 2021------------------------------------