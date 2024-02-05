from PIL import Image           #? pip install pillow
import os
import shutil
            # En las rutas puse ejemplos con el prefijo r para tratar las rutas como cadenas crudas 
            # para evitar tener problemas con python. En otro caso puede usarse las diagonales /
downloadsFolder = r"C:/Users/frank/Downloads"
Picturefolder = r"C:\Users\frank\Downloads\Pictures" 
videoFolder = r"C:\Users\frank\Downloads\Video"
DocsFolder = r"C:/Users/frank/Downloads/Docs"
OsuFolder = r"C:\Users\frank\Osu_Songs"
ZipFolder = r"C:\Users\frank\Documents\ZIP_RAR"
XMLFolder = r"C:\Users\frank\Documents\XML"
XLSDOCSFolder = r"C:\Users\frank\Documents\XLS_DOC"
ExeFolder = r"C:\Users\frank\Downloads"
        
if __name__ == "__main__":
    for filename in os.listdir(downloadsFolder):
        #* Obtenemos la ruta completa del archivo
        full_path = os.path.join(downloadsFolder, filename)

        #* Obtenemos el nombre y la extensión del archivo
        name, extension = os.path.splitext(filename)

        if extension.lower() in [".jpg", ".jpeg", ".png"]:
            # Abrimos la imagen
            picture = Image.open(full_path)
            if not os.path.exists(Picturefolder):
                os.makedirs(Picturefolder)
                print (f"Carpeta creada en: {Picturefolder}")
            else:
                print(f"La carpeta ya existe en: {Picturefolder}")
            #? Guardamos la imagen comprimida en la carpeta de imágenes
            picture.save(os.path.join(Picturefolder, "compressed_" + filename), optimize=True, quality=60)

            # Eliminamos el archivo original
            os.remove(full_path)
            print(name + ": " + extension)

        elif extension.lower() == ".pdf":
            # Movemos el archivo PDF a la carpeta de documentos
            if not os.path.exists(DocsFolder):
                os.makedirs(DocsFolder)
                print (f"Carpeta creada en: {DocsFolder}")
            else:
                print(f"La carpeta ya existe en: {DocsFolder}")
            os.rename(full_path, os.path.join(DocsFolder, filename))

            # Movemos el archivo de video a la carpeta de videos

        elif extension.lower() in [".mp4", ".avi", ".mkv"]:

            if not os.path.exists(videoFolder):
                os.makedirs(videoFolder)
                print (f"Carpeta creada en: {videoFolder}")
            else:
                print(f"La carpeta ya existe en: {videoFolder}")

            video_path = os.path.join(downloadsFolder,filename)
            dest_path = os.path.join(videoFolder, filename)

            shutil.move(video_path,dest_path)
            print(name + ": " + extension)

            # Movemos el archivo osu! a la carpeta de osu

        elif extension.lower() == ".osz":
            if not os.path.exists(downloadsFolder):
                os.makedirs(OsuFolder)
                print (f"Carpeta creada en: {OsuFolder}")
            else:
                print(f"La carpeta ya existe en: {OsuFolder}")

            os.rename(full_path, os.path.join(OsuFolder, filename))
            print(name + ": " + extension)

        elif extension.lower() in [".rar", ".zip", ".7z"]:
            if not os.path.exists(ZipFolder):
                os.makedirs(ZipFolder)
                print (f"Carpeta creada en: {ZipFolder}")
            else:
                print(f"La carpeta ya existe en: {ZipFolder}")
            os.rename(full_path, os.path.join(ZipFolder, filename))
            print(name +": " + extension)

        elif extension.lower() == ".xml":
            if not os.path.exists(XMLFolder):
                os.makedirs(XMLFolder)
                print (f"Carpeta creada en: {XMLFolder}")
            else:
                print(f"La carpeta ya existe en: {XMLFolder}")
            os.rename(full_path, os.path.join(XMLFolder, filename))
            print(name +": " + extension)

        elif extension.lower() in [".xls", ".docx", ".xlsx", ".xlsm"]:
            if not os.path.exists(XLSDOCSFolder):
                os.makedirs(XLSDOCSFolder)
                print (f"Carpeta creada en: {XLSDOCSFolder}")
            else:
                print(f"La carpeta ya existe en: {XLSDOCSFolder}")
            os.rename(full_path, os.path.join(XLSDOCSFolder, filename))
            print(name +": " + extension)

        elif extension.lower() in [".exe", ".msi"]:
            if not os.path.exists(ExeFolder):
                os.makedirs(ExeFolder)
                print (f"Carpeta creada en: {ExeFolder}")
            else:
                print(f"La carpeta ya existe en: {ExeFolder}")
            os.rename(full_path, os.path.join(ExeFolder, filename))
            print(name +": " + extension)
