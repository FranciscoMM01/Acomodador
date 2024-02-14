import tensorflow as tf              #pip install tensorflow-datasets
import tensorflow_datasets as tfds
#? Mandar a llamar los datos de la pagina
datos, metadatos = tfds.load('fashion_mnist', as_supervised = True, with_info = True)

print (metadatos)

datos_entrenamiento, datos_pruebas = datos['train'], datos['test'] 

nombres_clase = metadatos.features['label'].names #Asignar los grupos de las difenrentes clases

print(nombres_clase)

#Normalizar los datos (pasar de  0-255 a 0-1)
def normalizar(imagenes,etiquetas):
    imagenes = tf.cast(imagenes,tf.float32)
    imagenes /= 255    #Aqui pasa de de 0-255 a 0-1
    return imagenes, etiquetas

#Normalizar los datos de entrenamiento y pruebas con la función que se realizó
datos_entrenamiento = datos_entrenamiento.map(normalizar)
datos_pruebas = datos_pruebas.map(normalizar)

#agregar datos a cache (para usar la memoria en lugar del disco y que el proceso sea más rapido)
datos_entrenamiento = datos_entrenamiento.cache()
datos_pruebas = datos_pruebas.cache()

#*Mostrar una imagen de los datos de prueba, en este caso solo la primera.      Se puede comentar en producción
for imagen, etiqueta in datos_entrenamiento.take(1):
    break
imagen = imagen.numpy().reshape((28,28)) #Redimensionar

import matplotlib.pyplot as plt

#dibujar figura
plt.figure()
plt.imshow(imagen, cmap=plt.cm.binary)
plt.colorbar()
plt.grid(False)
plt.show()

#* Aqui es para mostrar varias imagenes de cada etiqueta
plt.figure(figsize=(10,10))
for i, (imagen, etiqueta) in enumerate(datos_entrenamiento.take(25)):
    imagen = imagen.numpy().reshape((28,28))
    plt.subplot(5,5,i+1)
    plt.xticks([])
    plt.yticks([])
    plt.grid(False)
    plt.imshow(imagen, cmap=plt.cm.binary)
    plt.xlabel(nombres_clase[etiqueta])
    
plt.show()
