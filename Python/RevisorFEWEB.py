from socket import timeout
from urllib import request
import requests
import time
from bs4 import BeautifulSoup
import yagmail
from configMail import email, contraseña #? Correo y contraseña llamados desde otro programa

# Configura los detalles del correo electrónico
email_sender = email
email_password = contraseña  #! No olvidar ocultar mi clave
email_receiver = 'Frankmm0798@gmail.com'
email_subject = 'Aviso: La página se quedó en blanco'

def send_email(message):
    yag = yagmail.SMTP(email_sender, email_password)
    yag.send(
        to=email_receiver,
        subject=email_subject,
        contents=message
    )

#* Otro tipo de error en la página que no ha funcionado todavía
#def check_page(url):
#    try:
#        response = requests.get(url)
#        if response.status_code == 200:
#            time.sleep(50)  # Esperar 5 segundos para permitir la carga completa de la página
#            soup = BeautifulSoup(response.content, 'html.parser')
#            if soup.body and not soup.body.get_text(strip=True):
#                return True  # Página en blanco
#            return False  # Página no está en blanco
#        else:
#            return False  # No se pudo cargar la página correctamente
#    except Exception as e:
#        print(f'Error al cargar la página: {e}')
#        return False
    
def check_page1(url):
    try:
        response = requests.get(url, timeout=10)  # Establecer un tiempo de espera de 10 segundos
        if response.status_code != 200:
            return True  # La página no responde correctamente (código de estado diferente de 200)
        return False  # La página responde correctamente
    except requests.RequestException as e:
        print(f'Error al cargar la página 1: {e}')
        return True  # La página no responde (problema de red o tiempo de espera)
    
def check_page2(url2): # Funcion duplicada para otra URL
    try:
        response = requests.get(url2,timeout=10)
        if response.status_code != 200:
            return True
        return False
    except requests.RequestException as e:
        print(f'Erro al cargar la pagina 2: {e}')
        return True
    
    #? URL1 https://www.iyaax.net/lajosefina/fe/V3/index.aspx
    #? URL2 https://www.iyaax.net/cooper/fe/V3/index.aspx    
    #https://www.iyaax.net/francescos/fe/V3/index.aspx
def main():
    url = 'https://www.iyaax.net/lajosefina/fe/V3/index.aspx'
    url2 = 'https://www.iyaax.net/cooper/fe/V3/index.aspx'
    while True:
        if check_page1(url): 
            if check_page2(url2): #Pagina 1 y 2 fallando
                message = f'Las páginas {url} & {url2} se quedaron en blanco.'
                send_email(message)
                print('Aviso enviado.')
            else: #Página 1 fallando
                message = f'La página {url} se quedó en blanco.'
            send_email(message)
            print('Aviso enviado.')
            

        elif check_page2(url2): #Pagina 2 fallando
            message = f'La pagina {url2} se quedó en blanco.'
            send_email(message)
            print('Aviso 2 enviado.')
        else: #Todas las páginas funcionando
            print('La página está funcionando correctamente.')

        time.sleep(60)  # Espera 1 minuto antes de recargar la página

if __name__ == '__main__':
    main()
    