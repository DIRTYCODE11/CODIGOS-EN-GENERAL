;Menu usando mouse en TASM 
.model SMALL
.stack 64
.data
  coordX db ?, '$'
  coordY db ?, '$'
  pazul db  '1.Pantalla azul','$'
  pverde db 10,13,7,'2.Pantalla verde ','$'
  ehola db 10,13,7,'3.Mostrar Hola','$'
  eadios db 10,13,7,'4.Salir del programa  ','$'
  msj db 10,13,7,'Hola$'
  msj2 db 10,13,7,'Adios$'
.code
main proc far
  mov ax,@data
  mov ds,ax

  menu:
    Mov ah,02h     ;funcion para posicionar cursor en pantalla
    Mov dx,0000h   ;Cursor renglon y columna
    Mov bh,00h     ;Pagina a imprimir
    int 10h        ;Interrupcion
    
    mov ax,0600h   ;funcion para dezplazar lineas arriba (limpiar pantalla)
    mov bh,10      ; el primer digito indica color de pantalla el segundo color de letra
    mov cx,0000h   ;coordenadas de donde empieza
    mov dx,184fh   ;coordenadas de donde acaba, se le pone este si es a toda la pantalla
    int 10h
    
    mov ah,09h    ; muestra opcion 1
    lea dx,pazul
    int 21h
    
    lea dx,pverde  ; muestra opcion 2
    int 21h
    lea dx,ehola   ; muestra opcion 3
    int 21h
    lea dx,eadios  ; muestra opcion 4
    int 21h
    
  click:        ; label para dirigir el click del mouse
    mov ax, 01h ; funcion que activa el cursor del mouse
    int 33h     ; interrupcion para el manejo del mouse
    
    mov ax, 03h ; funcion para obtener que boton del mouse fue presionado 
    int 33h     ; y coordenadas

    cmp bx, 1   ; compara con 1 si es que fue presionado el btn izquierdo
    je coordenadas ; si fue presionado el btn izquierdo salta a coordenadas
    cmp bx, 2   ; si fue con click derecho salta de nuevo a la etiqueta click
    jmp click

  coordenadas:  
    mov ax, cx ; el valor de las coordenadas en X (en pixeles) se guarda en cx 
    mov bl,8   ; asignamos el valor de 8 a bl
    div bl     ; se divide entre 8 para obtener la posicion en pantalla donde ira
    mov coordX, al ; guarda el resultado de la division en coordX

    mov ax, dx  ; el valor de las coordenas en Y (en pixeles se guarda en DX
    mov bl,8    ; mueve a 8
    div bl      ; realiza la division: coordenadaY= pixeles/8 
    mov coordY, al  ;guardalo en coordY

    cmp coordx, 0   ; realiza esta comparacion para ver si estan en la coordenada 0 de x
    JA click        ; si no regresa a solicitar el click del mouse y sus coordenadas
    
    cmp coordY, 0   ; si si, ve a comparar si la el cursor esta en la coordenada 0 del eje Y
    je col_azul     ; si esta en 0 ve a cambiar la pantalla de azul
    cmp coordY, 1   ; si no sigue comparando con las siguientes coordenadas...
    je col_verde
    cmp coordY, 2
    je hello
    cmp coordY, 3
    je salir
    jmp click       

  col_azul:
    mov ax,0600h   ;funcion para dezplazar lineas arriba (limpiar pantalla)
    mov bh,9fh     ; el 9 es para color azul pantalla y la f para texto blanco
    mov cx,0000h   ; inicia en las cooordenadas de origen
    mov dx,184fh   ; finaliza en las ultimas coordenadas de la pantalla
    int 10h
    
    mov ah,01h     ; espera una tecla para salir de ahi
    int 21h
    jmp menu       ; salta para regresar al menu
   
  col_verde:
    mov ax,0600h   ; funcion para dezplazar lineas arriba (limpiar pantalla o)
    mov bh,2fh     ; el 2 es color verde y la f color blanco
    mov cx,0000h   
    mov dx,184fh
    int 10h

    mov ah,01h      ; espera una tecla para salir
    int 21h
    jmp menu
    
  hello:
    mov ax,0600h   ; funcion para dezplazar lineas arriba (limpiar pantalla)
    mov bh,10      ; mantiene la pantalla negra
    mov cx,0000h
    mov dx,184fh
    int 10h
    
    mov ah,09h
    lea dx,msj     ; muestra en pantalla hola
    int 21h
    
    mov ah,01h      ; espera una tecla para salir y volver al menu
    int 21h
    jmp menu
    
   salir:
    mov ax,0600h   ; funcion para dezplazar lineas arriba (limpiar pantalla)
    mov bh,10
    mov cx,0000h
    mov dx,184fh
    int 10h
   
    mov ah,09h
    mov dx, offset msj2 ; muestra en pantalla adios
    int 21h
    
    mov ah,01h  ; espera una tecla para salir
    int 21h
    
    mov ah,4ch  ; funcion que finaliza el programa
    int 21h

main endp
end main