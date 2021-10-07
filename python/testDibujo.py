# Con el modulo PIL nos permitira la edicion de imagenes
from PIL import Image, ImageOps
# Importando el modulo para manejar rutas
from pathlib import Path

# Creando un objeto de tipo ruta
# Aca debes poner tu ruta.
rutaImagen = Path(r"C:\\Users\\Downloads\\logo.jpeg")

# Creando un objeto al que le pasaremos la ruta
nuevaimagen = Image.open(rutaImagen)

# creando un input para que el usuario seleccione uno de los 3 efectos
print('ESCRIBE G SI QUIERES ESCALA DE GRISES, E EFECTO ESPEJO O T CAMBIAR TAMAÑO ')
entrada = input()

if entrada == 'G':
    print('ESCALA DE GRISES')
    # Aplicando el metodo de grayscale
    gris_imagen = ImageOps.grayscale(nuevaimagen)
    # Guardando la imagen gris en el directorio de nuestro proyecto
    # aparecerá con el nombre imagen.jpg
    gris_imagen.save('imagengris.jpg')
    gris_imagen.show()

elif entrada == 'E':
    print('IMAGEN ESPEJO')
    # Aplicando el metodo mirror
    mirror_imagen = ImageOps.mirror(nuevaimagen)
    # Guardando la imagen espejo en el directorio de nuestro proyecto
    # aparecerá con el nombre imagenr.jpg
    mirror_imagen.save('imagenespejo.jpg')
    mirror_imagen.show()

elif entrada == 'T':
    print('CAMBIO DE TAMAÑO')
    ancho = int(input('PON EL ANCHO DE LA IMAGEN '))
    largo = int(input('PON EL LARGO DE LA IMAGEN '))
    # Aplicando el metodo mirror
    tamanio_imagen = nuevaimagen.resize((largo, ancho))
    # Guardando la imagen espejo en el directorio de nuestro proyecto
    # aparecerá con el nombre imagen.jpg
    tamanio_imagen.save('imagentransformada.jpg')
    tamanio_imagen.show()
