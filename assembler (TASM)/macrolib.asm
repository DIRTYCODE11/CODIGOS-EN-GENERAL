; Programa que involucra Macros y procedimientos USANDO UNA LIBRERIA
; Una macro es un metodo que tiene parametros en un lenguaje de alto nivel
;   Su estructura es nombreMacro MACRO parametro1, parametroN -> ENDM
;   SE RECOMIENDA PONERLOS HASTA ARRIBA DEL PROGRAMA INCLUSO ARRIBA DEL MODELO
; un procedimiento o rutina, realiza solo algo en concreto y no recibe parametros
; un procedimiento se define con la siguiente estructura: nombreProcedimiento PROC -> ret -> ENDP
;   SE RECOMIENDA PONERLOS DESPUES DE FINALIZAR NUESTRO PROCEDIMIENTO PRINCIPAL (MAIN)
; PARA LA LIBRERIA USAMOS LA PALABRA INCLUDE PARA INCLUIR LAS LIBRERIAS Y EL NOMBRE DE NUESTRA LIBRERIA
; DEBEN SER FORMATO .LIB
;
.model small
INCLUDE libre.lib
.stack
.data
    frase db 'Hola amigos$'
.code
    main proc far
        mov ax,@data
        mov ds,ax
       
        ; LLAMO A MI PROCEDIMIENTO LIMPIAR PANTALLA
        call clscr
        ; LLAMO A MI MACRO PRINT 
        print frase
        
        mov ah,4ch
        int 21h

.exit
main endp
end main
;----------------------------------------DIRTY CODE ---------------------------------