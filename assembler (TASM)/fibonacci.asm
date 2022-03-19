.model small
.stack
.data
    contador dw 2
    arreglo db 13 dup (0)
    n3 db 0
    
.code
    main proc far 
        mov ax,@data
        mov ds,ax

        mov ah,0
        mov al,1

        mov arreglo[0],ah
        mov arreglo[1],al

        mov si,0
        mov di,1

        mov cx,13d
        ciclo:
            mov al,arreglo[si]
            mov bl,arreglo[di]
            add al,bl
            mov bx,contador
            mov arreglo[bx],al
            inc si
            inc di
            inc contador
        loop ciclo

        mov si,0
        mov cx,13d

        ciclo_imprime:
            mov ax,0
            mov al,arreglo[si]
            cmp ax,144d
            jge ajusta_3_digitos

            ajustar_2_digitos:
            aam
            mov bx,ax
            add bx,3030h

            mov ah,02h
            mov dl,bh
            int 21h

            mov ah,02h
            mov dl,bl
            int 21h

            mov ah,02h
            mov dl,' '
            int 21h
            jmp avanza

            ajusta_3_digitos:
                aam
                add al,30h 
                mov n3,al

                mov al,ah
                mov ah,0
                aam
                mov bx,ax
                add bx,3030h

                mov ah,02h
                mov dl,bh
                int 21h

                mov ah,02h
                mov dl,bl
                int 21h

                mov ah,02h
                mov dl,n3
                int 21h

                mov al,02h
                mov dl,' '
                int 21h

        avanza:
            inc si
    loop ciclo_imprime

        mov ah,4ch
        int 21h

    main endp
end main
        


