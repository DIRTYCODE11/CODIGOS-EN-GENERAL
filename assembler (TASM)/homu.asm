; Hola mundo en Assembler
; Este programa es parte del curso de Assembler TASM basico usando directivas
; imprime un hola mundo en la pantalla
.286                            ; conjunto de instrucciones a usar
pila segment stack       		;segmento de pila
	     db 32 DUP('stack--')   ;opcional
pila ends

datos segment              		;segmento de datos acá va nuestras variables
	letrero db 'Hola Mundo','$' ;db significa defineme un byte se interprete defineme una localidad en memoria
                                ; con el nombre de letrero
datos ends

codigo segment 'code'            ;segmento de codigo acá empezaremos a programar
main proc FAR
	       assume ss:pila, ds:datos, cs:codigo

	       mov    ax,datos      ; guardo en el registro ax el valor de mi seg de datos
	       mov    ds,ax         ; lo muevo a mi datasegment (segmento de datos) para poderlos usar

	       mov    ah,09h         ;funcion para imprimir una cadena en pantalla
	       ; mov dx,offset letrero   ;forma dos de imprimir una cadena en pantalla
	       lea    dx, letrero   ; le digo que me imprima letrero 
	       int    21h           ; interrupcion 21h 

	       mov    ah,4ch        ;funcion que finaliza un programa
	       int    21h       

	       ret
main endp                       ; finalizamos el procedimiento main
codigo ends                     ; finalizamos el segmento de codigo
end main                        ; finalizamos el main

;---------------------------------DirtyCode 2021---------------------------------------------------
