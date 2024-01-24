import pyshorteners
import  streamlit as st

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
