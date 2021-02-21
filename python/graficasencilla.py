#importando librerias de matplot y numpy
import matplotlib.pyplot as trazo
import numpy as libn
#pip install matplotlib
#pip install m

#Pedimos valores al usuario 
print("Introduce valor del inicio de los ejes")
inicioXY= int(input())

print("Introduce valor final de los ejes")
finalXY= int(input())

print("Introduce 3 valores para el color de la linea de tu gráfica")
print("PRIMER VALOR")
red= float(input())

print("SEGUNDO VALOR")
green=float(input())

print("TERCER VALOR")
blue=float(input())

#al metodo arange le pasamos los valores que capturamos desde el teclado
#Recordar que "libn" es el alias de la libreria "numpy"
#0.1 es para que la linea sea curveada

x = libn.arange(inicioXY,finalXY,0.1)
y=  x*libn.cos(x)

#Dibujando con plot los valores de los ejes 
#Los 3 valores que pasamos antes eran para asignar un color
#Recordar que "trazo" es el alias de la libreria "matplot"
trazo.plot(x,y,color=(red,green,blue))

#Asignaremos un "nombre" a los labels para distinguir los ejes
#grid() nos permite colocar una cuadricula en la gráfica
trazo.title('GRÁFICA')
trazo.xlabel('X')
trazo.ylabel('Y')
trazo.grid()

#Mostrando grafica con el método show
trazo.show()
