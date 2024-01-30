#from pytube import YouTube
import pandas as pd 
#from pydrive.auth import GoogleAuth
#from pydrive.drive import GoogleDrive

#Variables de excel
file_path = 'Enlace_Videos/enlaces.xlsx' 
sheet_name = 'Sheet1'
Column_name = 'VIDEOS'



def main():
    #Leer los links de excel
    df = pd.read_excel(file_path, sheet_name=sheet_name)
    column_data = df[Column_name]
    videos = column_data.values
    print(videos)

if __name__ == '__main__':
    main()