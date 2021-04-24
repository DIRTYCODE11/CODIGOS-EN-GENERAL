; Programa que involucra Macros y procedimientos 
; Una macro es un metodo que tiene parametros en un lenguaje de alto nivel
;   Su estructura es nombreMacro MACRO parametro1, parametroN -> ENDM
;   SE RECOMIENDA PONERLOS HASTA ARRIBA DEL PROGRAMA INCLUSO ARRIBA DEL MODELO
; un procedimiento o rutina, realiza solo algo en concreto y no recibe parametros
; un procedimiento se define con la siguiente estructura: nombreProcedimiento PROC -> ret -> ENDP
;   SE RECOMIENDA PONERLOS DESPUES DE FINALIZAR NUESTRO PROCEDIMIENTO PRINCIPAL (MAIN)

print macro cadena  ; Esta macro imprime en pantalla una cadena y como parametro recibe la cadena a imprimir
    mov ah,09h
    lea dx,cadena
    int 21h
endm                ; Fin Macro

imprime_caracter macro caracter ; Macro para imprimir un unico caracter
    mov ah,02h
    mov dl,caracter
    int 21h
endm                            ; FIN macro
    
.model small
.stack
.data
    frase db 'Hola amigos$'     
.code
    main proc far
        mov ax,@data
        mov ds,ax
        
        ; Se llama a una macro por su nombre y se le pasa el parametro que necesite 
        ; Aca imprime en pantalla
        print frase
        ; Aca imprime un caracter
        imprime_caracter 35H
        ; Para llamar un procedimiento usamos la palabra reservada CALL y el nombre del procedimiento
        call leer_caracter
        
        imprime_caracter 'A'
        call clscr
        
        mov ah,4ch
        int 21h

.exit
main endp
;----------------------------------------Procedimientos--------------------------
    leer_caracter proc
        mov ah,01h
        int 21h
        ret
    endp
    
    clscr proc 
         mov ah,06h      ; funcion que dezplaza lineas hacia arriba (limpiar pantalla)
         mov al,00h      ; modo de video
         mov bh,12h      ; atributo a usar: el primer digito es el color de la pantalla el segundo el del texto
         mov cx,0000h    ; filas y columnas donde empezara 
         mov dx,184fh    ; filas y columnas donde acabara la limpieza de pantalla
         int 10h
         ret
         
     endp
end main
;------------------------------------DIRTYCODE 2021---------------------------