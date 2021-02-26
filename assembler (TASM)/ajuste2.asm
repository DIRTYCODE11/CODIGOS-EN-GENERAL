; Con este ejemplo veremos como realizar ajustes para mostrar 
; informacion en pantalla
.286                ; set de instrucciones
pila segment stack       		; segmento de pila
	     db 32 DUP('stack--')
pila ends

datos segment                                        		; segmento de datos donde declaro mis variables
	letrero1 db 10,13,'Ingresa un numero de un digito: $'
	letrero2 db 10,13,'El numero es: $'
datos ends

codigo segment 'code'
main proc FAR
	       assume ss:pila, ds:datos, cs:codigo

	       mov    ax,datos                      ; muevo al registro ax lo que tiene datos
	       mov    ds,ax                         ; muevo eso al segmento de datos

	       mov    ah,09h                      	; mostrar Ingresemos un digito
	       lea    dx, letrero1
	       int    21h
    
	       mov    ah,01h                      	;solicito un caracter por pantalla
	       int    21h
	       sub    al,30h                      	; realizamos el ajuste
    
	       mov    cl,al                       	; lo guardo en el registro cl
    
	       mov    ah,09h                        ; imprimo el segundo letrero
	       lea    dx, letrero2
	       int    21h
    
	       mov    ah,02h
	       mov    dl,cl
	       add    dl,30h                      	; realizo un ajuste para mostrar en pantalla
	       int    21h

	       mov    ah,4ch                      	;funcion que finaliza un programa
	       int    21h

	       ret
main endp
codigo ends
end main
;------------------------------------------------DirtyCode 2021----------------------------------------------------
