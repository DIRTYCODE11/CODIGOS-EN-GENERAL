#include <stdio.h>
#include <dos.h>
#include <conio.h>
#include <stdlib.h>

char texto[20]="Haz Clic$";
char clicizq[35]="Clic izquierdo dentro del boton$";
char clicder[35]="Clic derecho dentro del boton$";
char clicizqf[35]="Clic izquierdo fuera del boton$";
char clicderf[35]="Clic derecho fuera del boton$";
char sobre[20]="Sobre boton$";
char fuera[20]="Fuera boton$";
int estado=0;
char flag='t';
int coordx=0;
int coordy=0;
char fila=0;
char columna=0;


void ventana(char a,char b,char a1,char b1){
	asm{
		mov ax,0600h
		mov bh,20h
		mov ch,a
		mov cl,b
		mov dh,a1
		mov dl,b1
		int 10h
	}
}

void inicializa_mouse(){
	asm{
		mov ax,000h
		int 33h
	}
}

void mostrar_mouse(){
	asm{
		mov ax,01h
		int 33h
	}
}

void ocultar_mouse(){
	asm{
		mov ax,02h
		int 33h
	}
}

void printText(char texto[]){
	int j;
	char letra;
	j=0;
	while(texto[j]!='$'){
		letra=texto[j];
		asm{
			mov ah,02h
			mov dl,letra
			int 21h
		}
		j++;
	}
}

void posicionar_cursor(char fila,char columna){
	asm{
		mov ah,02h
		mov bh,00
		mov dh,fila
		mov dl,columna
		int 10h
	}
}

void cls(){
	asm{
		mov ax,0600h
		mov bh,1fh
		mov cx,0000h
		mov dx,184fh
		int 10h
		
	}
	
}

void limpiar(char a,char b,char a1,char b1){
	asm{
		mov ax,0600h
		mov bh,1fh
		mov cl,b
		mov ch,a
		mov dl,b1
		mov dh,a1
		int 10h
	}
}

void estado_mouse(){
	inicializa_mouse();
	mostrar_mouse();

	while(flag!='f'){
		asm{
			mov ax,03h
			int 33h
			mov estado,bx
			mov coordx,cx
			mov coordy,dx
			mov ax,coordx
			mov bl,8
			div bl
			mov columna,al
			mov ax,coordy
			mov bl,8
			div bl
			mov fila,al
		}
		limpiar(0,35,0,45);
		posicionar_cursor(0,79);
		printf("X");
		posicionar_cursor(0,35);
		printf("(%i,%i)\n",fila,columna);
		posicionar_cursor(24,79);
		if(estado==1){
			flag='t';
			if(fila>9&&fila<13){
				if(columna>24 && columna<36){
					limpiar(1,20,1,55);
					posicionar_cursor(1,21);
					printText(clicizq);
					posicionar_cursor(24,79);
				}else{
					limpiar(1,20,1,55);
					posicionar_cursor(1,21);
					printText(clicizqf);
					posicionar_cursor(24,79);
				}
			}else{
					limpiar(1,20,1,55);
					posicionar_cursor(1,21);
					printText(clicizqf);
			}
		
			if(fila==0 && columna==79){
				flag='f';
			}
		}
		if(estado==2){
			flag='t';
			if(fila>9&&fila<13){
				if(columna>24&&columna<36){
					limpiar(1,20,1,55);
					posicionar_cursor(1,21);
					printText(clicder);
					posicionar_cursor(24,79);
				}else{
					limpiar(1,20,1,55);
					posicionar_cursor(1,21);
					printText(clicderf);
					posicionar_cursor(24,79);
				}
			}else{
				limpiar(1,20,1,55);
				posicionar_cursor(1,21);
				printText(clicderf);
				posicionar_cursor(24,79);
			}

		}

		if(fila>9&&fila<13){
			if(columna>24&&columna<36){
				limpiar(2,30,2,55);
				posicionar_cursor(2,31);
				printText(sobre);
				posicionar_cursor(24,79);
			}else{
				limpiar(2,30,2,55);
				posicionar_cursor(2,31);
				printText(fuera);
				posicionar_cursor(24,79);
			}

		}else{
			limpiar(2,30,2,55);
			posicionar_cursor(2,31);
			printText(fuera);
			posicionar_cursor(24,79);
		}
		delay(75);
	}
}

int main(){
	cls();
	ventana(10,25,12,35);
	posicionar_cursor(11,26);
	printText(texto);
	estado_mouse();
	posicionar_cursor(23,0);
	system("pause");
	return 0;
}
