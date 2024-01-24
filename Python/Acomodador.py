from PIL import Image           #? pip install pillow
import os
import shutil
            # En las rutas puse ejemplos con el prefijo r para tratar las rutas como cadenas crudas 
            # para evitar tener problemas con python. En otro caso puede usarse las diagonales /
downloadsFolder = "C:/Users/frank/Downloads"
Picturefolder = r"C:\Users\frank\Downloads\Pictures" 
videoFolder = r"C:\Users\frank\Downloads\Video"
DocsFolder = "C:/Users/frank/Downloads/Docs"
OsuFolder = r"C:\Users\frank\Downloads\Osu_Songs"

if __name__ == "__main__":
    for filename in os.listdir(downloadsFolder):
        #* Obtenemos la ruta completa del archivo
        full_path = os.path.join(downloadsFolder, filename)

        #* Obtenemos el nombre y la extensión del archivo
        name, extension = os.path.splitext(filename)

        if extension.lower() in [".jpg", ".jpeg", ".png"]:
            # Abrimos la imagen
            picture = Image.open(full_path)

            #? Guardamos la imagen comprimida en la carpeta de imágenes
            picture.save(os.path.join(Picturefolder, "compressed_" + filename), optimize=True, quality=60)

            # Eliminamos el archivo original
            os.remove(full_path)
            print(name + ": " + extension)

        elif extension.lower() == ".pdf":
            # Movemos el archivo PDF a la carpeta de documentos
            os.rename(full_path, os.path.join(DocsFolder, filename))

            # Movemos el archivo de video a la carpeta de videos
        elif extension.lower() in [".mp4", ".avi", ".mkv"]:
            video_path = os.path.join(downloadsFolder,filename)
            dest_path = os.path.join(videoFolder, filename)

            shutil.move(video_path,dest_path)
            print(name + ": " + extension)

            # Movemos el archivo osu! a la carpeta de osu
        elif extension.lower() == ".osz":
            os.rename(full_path, os.path.join(OsuFolder, filename))
            print(name + ": " + extension)

