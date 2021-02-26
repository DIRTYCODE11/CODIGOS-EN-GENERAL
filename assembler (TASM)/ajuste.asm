;Ajustes en Assembler (TASM) 
; codigo implementado en el video de ajustes
.286            ; set de instrucciones
pila segment stack       		;segmento de pila
	     db 32 DUP('stack--')
pila ends

datos segment                    		;segmento de datos
	letrero1 db 10,13,'Hola Amigos$' 	;10 y 13 hacen referencia al codigo ascii con 10 es salto de linea
	letrero2 db 10,13,'Adios Amigos$'	; 13 es el retorno de carro
datos ends

codigo segment 'code'                     		;segmento de codigo
main proc FAR
	       assume ss:pila, ds:datos, cs:codigo	;le indico a ensamblador que segmento es cada cosa

	       mov    ax,datos
	       mov    ds,ax

	       mov    ah,09h                      	; funcion para imprimir una cadena en la pantalla
	       lea    dx, letrero1
	       int    21h
    
	       mov    ah,09h
	       lea    dx, letrero2
	       int    21h

	       mov    ah,4ch                      	;funcion que finaliza un programa
	       int    21h

	       ret
main endp
codigo ends
end main
;-------------------------------------------------DirtyCode 2021---------------------------------------------------------------
