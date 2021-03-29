; programa que permite buscar un caracter en pantalla
; usando scasb se utiliza para escanear una cadena 
;(SCASB= SCan A SuBString).
; Se compara el contenido del acumulador 
; contra el valor actual se?alado en por el segmento extra usando DI 
; Cuando se usa junto con el REPNE prefijo ( REPeat mientras no es igual )
; SCASB escanea la cadena en busca del primer elemento de cadena 
; que sea igual al valor en el acumulador en este caso el registro CX.
; Condiciones es necesario usar ES (Extra Segment)
.model small
.stack
.data
    letrero1 db 10,13,'Ingrese una cadena $'
    cadena1 db 40 dup (' '),'$'
    letrero2 db 10,13,'Ingresa un caracter para buscar $'
    caracter db ?
    contador db 0h
    letrero4 db 10,13,'Caracter no encontrado $'
    letrero3 db 10,13, 'Posicion $'
    posicion db ?
    valor db ?
.code
    main proc far
    mov ax,@data
    mov ds,ax
    mov es,ax
    
    ; imprimos en pantalla que el usuario digite un numero
    mov ah,09h
    lea dx, letrero1
    int 21h
    
    mov si,0        ; con SI controlo el acceso a los elementos de la cadena
            llenar_cadena:  
                mov ah,01h  ; solicito un caracter al usuario
                int 21h     
                cmp al,13   ; comparo si es igual a la tecla enter
                je  pedir_caracter  ; si si voy a una etiqueta que se llame contar vocales
                mov cadena1[si],al  ; guardo en el elemento de mi cadena el caracter que guarde
                inc si              ; incremento el contador en 1
             jmp llenar_cadena 
           
           ; ahora le pedimos al usuario su caracter
           pedir_caracter:
                mov ah,09h
                lea dx,letrero2
                int 21h
                
                mov ah,01h
                int 21h
                ; lo guardamos en el caracter que nos interesa
                mov caracter,al 
                ; movemos al registro contador el tama?o de la cadena1 
                mov cx,size cadena1
                mov contador,40
                ; le indicamos a DI que haga su desplazamiento sobre cadena1
                lea di, cadena1
                
                repetir:
                    repne scasb
                    je encontrado
                    jne no_encontrado
                    ; si encuentra el caracter lo a imprimir en que posicion con la etiqueta 
                    ; encontrado y si no con no encontrado
                    encontrado:
                         mov ah,09h
                         lea dx, letrero3
                         int 21h
                         ; estas operaciones se hacen debido a que necesitamos imprimir    
                         mov valor,cl
                         mov al,contador
                         sub al,valor
                         mov posicion,al
                         add posicion,30h
                         ; realizamos el ajuste y si necesitamos mostrarlo en pantalla con 
                         ; dos cifras necesitamos usar ajustes (AAM) se recomienda
                         mov ah,02h
                         mov dl,posicion
                         int 21h
                         
                         mov al,caracter
                         cmp cx,di  ; aca como habiamos dicho en la parte de arriba 
                                    ; compara el elemento actual con el del contador
                         jz salida
                         jmp repetir
                        no_encontrado:
                            mov ah,09h
                            lea dx, letrero4 
                            int 21h
                            jmp salida
    salida:                      
    mov ah,4ch
    int 21h
    
.exit
main endp
end main
;-----------------------------------DirtyCode 2021----------------------