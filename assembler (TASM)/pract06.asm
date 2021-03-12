
.model small   
.stack
.data 
   input db 10,13,'Ingresa un numero $'
   result db 10,13,'El resultado es: $'
   n1 db ?
   n2 db ?
.code
     main proc far
        mov ax,@data
        mov ds,ax
           
        jmp tercer_ejemplo
        
        primer_caso:
            mov ah,09h
            lea dx, input
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h
            
            mov n1,al
            
            mov ah,09h
            lea dx, input
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h
            
            mov n2,al
            
            ; proceso de suma
            
            mov al,n1
            mov bl,n2
            
            add bl,al 
            
            mov ax,0000h
            mov al,bl 
            
            AAA
            
            mov cx,ax 
            add cx,3030h
            
            mov ah,09h
            lea dx,result
            int 21h
            
            mov ah,02h
            mov dl,ch
            int 21h
            
            mov ah,02h
            mov dl,cl
            int 21h
            
            mov ah,01h
            int 21h         
            
       segundo_caso:
            mov ah,09h
            lea dx, input
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h
            
            mov n1,al
            
            mov ah,09h
            lea dx, input
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h
            
            mov n2,al
            
            ; proceso de multiplicacion
            
            mov al,n1
            mov cl,n2
            
            mul cl
            
            mov cl,al
            
            mov ax,0000h
            mov al,cl 
            
            AAM
            
            mov cx,ax 
            add cx,3030h
            
            mov ah,09h
            lea dx,result
            int 21h
            
            mov ah,02h
            mov dl,ch
            int 21h
            
            mov ah,02h
            mov dl,cl
            int 21h
            
            mov ah,01h
            int 21h 
            
         tercer_ejemplo:
            mov ah,09h
            lea dx, input
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h
            
            mov bl,al 
           
            
            mov ah,01h
            int 21h
            sub al,30h
            mov cl,al
            
            ; ingresa segundo numero
            mov ah,09h
            lea dx, input
            int 21h
            
            mov ah,01h
            int 21h
            sub al,30h 
            add bl,al 
            
            mov ah,01h
            int 21h
            sub al,30h
            
            add cl,al
            
            mov ah,09h
            lea dx,result 
            int 21h
            
            
            mov ax,cx
            
            aam
            
            mov cx,ax
            
            add bl,ch
            mov ax,bx
            
            aam
            mov bx,ax
            
            mov ah,02h
            mov dl,bh
            add dl,30h
            int 21h
            
            mov ah,02h
            mov dl,bl
            add dl,30h
            int 21h 
            
            mov ah,02h
            mov dl,cl
            add dl,30h
            int 21h
            
            mov ah,01h
            int 21h
            
            
               
        mov ah,4ch
        int 21h
        ret
.exit
