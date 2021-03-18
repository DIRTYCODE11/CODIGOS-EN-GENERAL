; Implementacion de dos formas de capturar
; datos con el teclado
; Tema relacionado a manejo de cadenas

.model small    ; modelo de datos
.stack          ; segmento de pila
.data           ; segmento de datos
   ; dup lo que nos hace es repetir un numero de veces lo que le indiquemos
   ; por ejemplo al decir 100 dup (' ') le decimos 
   ; repite 100 veces el valor ' '/ O define una localidad de 100 tamaños y cada uno
   ; rellenalo de espacios vacios puede ser con otros elementos como numeros o letras, etc.
   input db 100 dup (' '),'$'   ; 
   input2 db 50 dup (' '),'$'   ; para el segundo ejemplo
.code
     main proc far
        mov ax, @data
        mov ds,ax
        mov si,0                ; aca asignamos el valor de nuestro apuntador SI en 0
                                ; nos servira para acceder a un elemento de la cadena en especifico
        ;jmp primera_forma       
        jmp segunda_forma       ; si deseas correr la primera parte comenta esto en caso contrario omite
        
        primera_forma:          ; en esta primera forma vamos a ejecutar una funcion que viene por defecto 
        mov ah,3fh              ; en la interrupcion 21h que es la funcion 3fh
        mov bx,00h              ; aca le ponemos el handle en 0
        mov cx,100              ; aca le indicamos el valor de bytes que va a contener depende de nuestro arreglo
        mov dx, offset [input]  ; con offset le indicamos sobre que direccion se va a desplazar en el data segment 
        int 21h                 
        
        mov ah,02h              ; esto es para presentacion imprime el caracter de salto de linea
        mov dl,10               ; valor en ascii
        int 21h 
        
        mov ah,09h              ; imprimimos nuestra cadena en pantalla
        mov dx,offset [input]   ; con offset tambien podemos usar lea 
        ;lea dx, input          ; tambien se pueden omitir los []
        int 21h   
        
        
        segunda_forma:          ; Esta segunda forma es un poco mas arcaica pero tenemos mas control de la misma
           mov ah,01h           ; esta usaremos en proximos videos
           int 21h              ; solicitamos un caracter al usuario
           cmp al,13            ; comparamos que el caracter no sea un enter
           je mostrar_Cadena    ; si es un enter lo que se dio imprime la cadena capturada
           mov input2[si],al    ; si no sigue con el flujo del programa y sigue almacenando en input2 el valor que ingresemos
           inc si               ; incrementamos SI para ir accedediendo a cada elemento del vector
           jmp segunda_forma    ; saltamos para repetir el procedimiento
           
           mostrar_Cadena:      ; ahora vamos a mostrar la cadena en pantalla 
               mov ah,09h       ; con la funcion para imprimir una cadena en pantalla
               lea dx, input2
               int 21h 
        
        mov ah,4ch              ; finalizamos el programa
        int 21h
        ret
.exit
main endp
end main
;-----------------------------------------DirtyCode 2021----------------------------------------------
