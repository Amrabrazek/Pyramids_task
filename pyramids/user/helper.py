from .tokens import account_activation_token 
from django.utils.http import urlsafe_base64_encode
from django.template.loader import render_to_string  
from django.core.mail import EmailMessage 

def sendEmail(user):
    print("sending activation email")
    mail_subject = 'account activation'  
    message = render_to_string('acc_active_email.html', {  
        'user': user,  
        'domain': '127.0.0.1:8000',  
        'uid':urlsafe_base64_encode(bytes(str(user.pk),'utf-8')),  
        'token':account_activation_token.make_token(user),  
    })  
    to_email = [user.email]
    email = EmailMessage(mail_subject, message, to=to_email)
    email.send()