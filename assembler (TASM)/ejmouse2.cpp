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

