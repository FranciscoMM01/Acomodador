from pytube import YouTube
import pandas as pd  #! Es necesario instalar openpyx1
from pydrive2.auth import GoogleAuth
from pydrive2.drive import GoogleDrive

#Variables de excel
file_path = 'Enlace_Videos/enlaces.xlsx' 
sheet_name = 'Sheet1'
Column_name = 'VIDEOS'


#*Credenciales de drive
directorio_credenciales = 'credential_module.json'
id_folder = '1FNE0yYI0aAuLU_JtzhVBNFg3cvOYKKV5'


#* INICIO DE SESION EN DRIVE
def login():
    GoogleAuth.DEFAULT_SETTINGS['client_config_file'] = directorio_credenciales
    gauth = GoogleAuth()    #? gauth significa Google AUTHentication
    gauth.LoadCredentialsFile(directorio_credenciales)

    if gauth.credentials is None:
        gauth.LocalWebserverAuth(port_numbers=[8092])
    elif gauth.access_token_expired:
        gauth.Refresh()
    else:
        gauth.Authorize()

    gauth.SaveCredentialsFile(directorio_credenciales)
    credentials = GoogleDrive(gauth)
    return credentials

#* Subir archivo
def subir_archivo(ruta_archivo,id_folder):
    credentials = login()
    archivo = credentials.CreateFile({'parents': [{"kind": "drive#fileLink","id": id_folder}]})
    archivo['title'] = ruta_archivo.split("/")[-1]
    archivo.SetContentFile(ruta_archivo)
    archivo.Upload()

def main():
    #Leer los links de excel
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    column_data = df[Column_name]
    videos = column_data.values
    # print(videos)          Para ver los links en terminal
    
    #* Descargar videos
    for link_videos in videos:
        yt = YouTube(link_videos)
        video = yt.streams.get_highest_resolution()
        video.download('./yt') 

    #* Subir videos
        subir_archivo(f'yt/{video.title}.mp4',id_folder)

if __name__ == '__main__':
    main()

