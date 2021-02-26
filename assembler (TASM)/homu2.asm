; Hola mundo en Assembler
; Este programa es parte del curso de Assembler TASM basico 
; imprime un hola mundo en la pantalla
.286		;segmento de instrucciones
.model small	;define un modelo de datos pequeños
.stack			; segmento de pila	
.data			; segmento de datos aca van nuestras variables a usar
    letrero db 'Hola Forma 2$'	
.code			; segmento de codigo aca empezamos a programar
main proc FAR	; procedimiento principal
	     mov ax,@data	;mueve al registro ax el valor del segmento de datos
	     mov ds,ax		; mueve al datasegment lo que tiene ax
	     mov ah,09h     	;funcion para imprimir una cadena en pantalla
	    ; mov dx,offset letrero
	     lea dx, letrero	
	     int 21h
    
	     mov ah,4ch     	;funcion que finaliza un programa
	     int 21h
	     ret
         .exit			;finaliza 
main endp				; fin del procedimiento
end main				; fin del main
;----------------------------------------DirtyCode 2021---------------------------------------------------

