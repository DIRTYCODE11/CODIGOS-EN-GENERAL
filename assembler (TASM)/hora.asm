
.model small
.stack
.data
    H1 db ?
    H2 db ?
    M1 db ?
    M2 db ?
    let db 'La hora es: $'
.code
    main proc far
    mov ax,@data
    mov ds,ax       

    mov ah,2ch
    int 21h
    
    ;la hora se queda en el registro cx
    ;ch la hora los minutos en cl 
    
    mov ax,0
    mov al,ch
    aam 
    add ax,3030h
    mov H2,al
    mov H1,ah
    
    mov ax,0
    mov al,cl
    aam
    add ax,3030h
    mov M1,ah
    mov M2,al
    
    ;opcional en DX las centesimas  
    ; mostramos la hora
    
    mov ah,09h 
    lea dx,let
    int 21h
  
    mov ah,02h
    mov dl,H1
    int 21h
    
    mov ah,02h
    mov dl,H2
    int 21h
    
    mov ah,02h
    mov dl,':'
    int 21h
    
    mov ah,02h
    mov dl,M1
    int 21h
    
    mov ah,02h
    mov dl,M2
    int 21h
    
    mov ax,4c00h                     
    int 21h
    
    main endp
 end main
