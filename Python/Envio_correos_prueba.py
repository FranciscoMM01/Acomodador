import yagmail

from configMail import email, contraseña 

yag = yagmail.SMTP(user=email, password=contraseña)

destinatarios = ['franciscomm.dev@gmail.com']
asunto = 'Prueva de envio de correo'
mensaje= 'Mensaje de prueba dentro del correo'
html = '<h1>Hola soy un titulo</h1>'
archivo = '.\Logo01.jpeg'
yag.send(destinatarios, asunto, [mensaje,html], attachments=[archivo] )
