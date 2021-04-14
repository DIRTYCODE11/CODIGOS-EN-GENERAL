; Manejo de la pila
; Con este sencillo ejemplo te mostramos como usar las instruccciones 
; para manejar una pila usando el push para meter y el pop para sacar los datos
; Cosas nuevas:
; usamos el dw, push y pop.
.model small
.stack
.data
    n1 dw ? ; dw define word (16 bits), db (define byte) son 8 bits
    n2 dw ? 
.code 
main proc far
    mov ax,@data
    mov ds,ax
    
    mov ah,01h  ; funcion para solicitar un caracter al usuario.
    int 21h
    
    mov bl,al   ; lo guardamos en bl, bh ya esta en 0 debido a que no se ha usado
        
    push bx     ; push y pop solo aceptan datos de tama?o de 16 bits, entonces por eso se le pasa el registro completo
    
    mov bx,0    ; limpiamos el registro bx
    
    mov ah,01h  ; solicitamos otro digito al usuario
    int 21h
   
    mov bl,al   ;  solicitamos otro digito al usuario
    push bx     ; lo guardamos en la pila
    
    pop bx      ; ahora empezamos a sacarlos
    
    mov ah,02h  ; los imprimimos en pantalla
    mov dl,bl   ; 
    int 21h

    pop bx      ; sacamos el proximo digito y lo imprimos
    mov ah,02h
    mov dl,bl
    int 21h    
   
    mov ah,4ch  ; funcion para salir del programa
    int 21h
  .exit
main endp
end main

;---------------------------------------DirtyCode 2021-----------------------------------