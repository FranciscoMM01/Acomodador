import requests
import streamlit as st
import os #Para traer la variable de Entorno

api_key = os.environ.get('OPENAI_API_KEY')     #! No compartir este Key

def openAI_Request(prompt):

    headers = {'Authorization': f'Bearer {api_key}'}
    response = requests.post(
        'https://api.openai.com/v1/images/generations', #END POINT del generador de imagenes de OpenAI
        headers=headers,
        json={
            'prompt': prompt,
            'model': 'dall-e-3',
            'size': '1792x1024',
            'quality': 'standard',
            'n': 1
        }
    )
    if response.status_code != 200:
        raise Exception(response.json())
    else:
        image_url = response.json()['data'][0]['url']
        return(image_url)
    
def download_image(url,filename):
    response = requests.get(url)
    with open(filename, 'wb') as file:
        file.write(response.content)

#* Se configura la pagina
st.set_page_config(page_title='Generador de Imagenes', page_icon='😍', layout='centered')

# Se crea el streamlit app
st.image("Logo01.jpeg")

# Se añade una sidebar
descripcion = st.text_area('prompt')

# Se añade un boton
if st.button("Generar imagen"):
    with st.spinner("Generando imagen..."):
        url = openAI_Request(descripcion)
        filename = 'Images/image_generator.png'
        download_image(url,filename)
        st.image(filename, use_column_width=True)
        with open(filename,'rb') as f:
                        image_data = f.read()
        download = st.download_button(label='Download Image', data = image_data, filename = 'Image_generator.png')
        

