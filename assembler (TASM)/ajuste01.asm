; Tema: Ajustes para numeros de dos cifras
; usaremos al AAA, AAM y AAD

.model small
.stack
.data
.code  
  main proc far
  mov ax,@data
  mov ds,ax  
  
  jmp cuarto_salto ; aca se puede modificar ya que es para redirigir a los
                   ; los ejemplos
  
  primer_ajuste:
 
  ; AAA  lo que hace es dividir un numero hexadecimal en un formato decimal
  ; y se guardan en la parte alta y baja del registro AX correspondiente
  ; por ejemplo entra 0CH al aplicar el ajuste AH=1 AL=2
  mov bh,0ch
  
  mov ah,00h
  mov al,bh ; guardo en el registro AL el valor del numero se encuenta en hexadecimal
  
  aaa       ; realizo el ajuste al numero 
  
  mov cx,ax ; lo guardo en el registro cx
                                            
  mov ah,02h ; ahora imprimo la parte baja y alta de cada registro
  mov dl,ch  ; parte alta 
  add dl,30h ; ajuste de 30h
  int 21h
  
  mov ah,02h ; 
  mov dl,cl  ; parte baja 
  add dl,30h ; ajuste
  int 21h
  
  segundo_ajuste:
  ; AAD
  ; Lo que hace es tomar un registro por separado y lo baja a formato hexadecimal
  ; y se guarda en el registro AL
  
  mov bh,1  ; por ejemplo en la parte alta del registro BH=1 y BL=2
  mov bl,2  
  
  mov ax,bx ; al realizar el transpaso al registro AX estara AH=1 y AL=2
  aad       ; realizamos el ajuste antes de la division, y AL=0CH
  
  add al,1  ; le sumamos 1 por ejemplo no es obligatorio solo fue para fines practicos
  
  
  mov ah,00h ; el resultado de la suma =0DH ahora ese resultado se debe mostrar
 
             ; en pantalla ocupamos AAA para mostrarlo 
  aaa  
             ; convertira el numero hexadecimal en Formato decimal 
  mov cx,ax
             ; y lo mostramos
  mov ah,02h 
  mov dl,ch
  add dl,30h
  int 21h
  
  mov ah,02h
  mov dl,cl
  add dl,30h
  int 21h
    
  tercer_ajuste:
  ; AAM Ajuste antes de la multiplicacion 
  ; a veces es mejor usar este si no nos funciona el AAA
  mov al,5
  mov bl,3
  mul bl
  ; aca realizo una multiplicacion 
  ; pero el dato es de dos cifras entonces... 
  ; lo separa con el ajuste AAM en parte alta y baja
  aam  
  
  cuarto_salto:
  ; Practica para capturar un numero de dos digitos
    
   mov ah,01h    ; solicito el primer digito
   int 21h
   
   sub al,30h    ; realizo su ajuste
   
   mov ch,al     ; lo guardo en la parte alta del registro CX
   
   mov ah,01h    ; capturo otro digito por teclado
   int 21h
   
   sub al,30h    ; realizo el ajuste
   
   mov cl,al     ; guardo en la parte baja del registro CX
   
   mov ax,cx     ; lo muevo al registro AX para hacer el ajuste
   
   aad           ; Realizo el ajuste para dejarlo en hexadecimal y poderlo operar
   
   add al,2      ; sumo 2, esto no es obligatorio solo fue de ejemplp
   
   aam           ; ya que lo sume realizo el ajuste AAM para mostrarlo en pantalla
   mov cx,ax
                 ; y lo guardo en el registro CX para imprimirlo en pantalla
   
  mov ah,02h     ; muestro el resultado que esta en el registro CX
  mov dl,ch
  add dl,30h
  int 21h
  
  mov ah,02h
  mov dl,cl
  add dl,30h
  int 21h
.exit
main ENDP
end main 
;----------------------------DirtyCode 2021---------------------------------