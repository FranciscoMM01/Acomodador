import qrcode
import streamlit as st

#? directorio de guardado
filename = "QR_codes/QR_code.png"

def generate_QR_code(url, filename):
    #Parametros de la versión del QR
    qr = qrcode.QRCode(
        version = 1,
        error_correction = qrcode.constants.ERROR_CORRECT_L,
        box_size = 10,
        border = 4,
    )
    #Añadir los datos de la URL al QR
    qr.add_data(url)
    qr.make(fit=True)

    #Aqui se genera la imagen del QR y se guarda en la ruta filename
    img = qr.make_image(fill_color = "black", back_color = "white")
    img.save(filename)


    #* Se crea un streamlit app
st.set_page_config(page_title="Generador de QR", page_icon="😎", layout="centered")
st.image("Logo01.jpeg", use_column_width=True)
st.title("Generador de código QR")
url = st.text_input("Ingrese el URL")

if st.button("Generar Codigo QR"):
    generate_QR_code(url, filename)
    st.image(filename, use_column_width=True)
    with open(filename, "rb") as f:
                    image_data = f.read()
    download = st.download_button(label="Descargar QR", data=image_data, file_name="QR_Generado.png")