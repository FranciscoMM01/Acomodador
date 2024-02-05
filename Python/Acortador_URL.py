import pyshorteners
import  streamlit as st
import qrcode

def shorten_url(url):
    s = pyshorteners.Shortener()
    shorten_url = s.tinyurl.short(url)
    return shorten_url

#Creamos app web con streamlit
st.set_page_config(page_title="Acortador de URL", page_icon="👌", layout="centered")
st.image("Logo01.jpeg",use_column_width=True)
st.title("Acortador de URL")
url = st.text_input("Ingrese la URL")
if st.button("Generar nuevo URL"):
    st.write("Nueva URL: ", shorten_url(url))
    
#* Función de generar QR
filename = "QR_Codes/QR_Acortador.png"    

def generate_QR_code(url, filename):
    qr = qrcode.QRCode(
        version = 1,
        error_correction = qrcode.constants.ERROR_CORRECT_L,
        box_size = 5,
        border = 4,
    )
    qr.add_data(url)
    qr.make(fit= True)

    img = qr.make_image(fill_color = "black", back_color = "white")
    img.save(filename)

if st.button ("Generar QR"):
    generate_QR_code(url, filename)
    with open(filename, "rb") as f:
                    image_data = f.read()
                    