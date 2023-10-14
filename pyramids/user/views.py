# Django imports
from django.utils.http import urlsafe_base64_decode
from django.contrib.sites.shortcuts import get_current_site  
from .tokens import account_activation_token 
from django.shortcuts import render

# DRF imports
from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.decorators import api_view, permission_classes

# JWT imports
from rest_framework_simplejwt.views import TokenObtainPairView

# app Imports
from .serializers import SignupSerializer, UserSerializer, MyTokenObtainPairSerializer
from .models import User

#helper import
from .helper import sendEmail

# Create your views here.

class HomePage(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request):
        user = User.objects.get(pk=request.user.pk)
        print(user)
        content = {
            "home": f"{get_current_site(request)}"
        }
        return Response(content)

class Register(APIView):
    def post(self, request):
        password = request.data.get('password', None)
        confirm_password = request.data.get('confirm_password', None)
        if not password == confirm_password:
            return Response({'password_mismatch': 'Password fields did not match'}, status.HTTP_400_BAD_REQUEST)
        serializer = SignupSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        data = serializer.data
        sendEmail(user)
        return Response(data, status=status.HTTP_201_CREATED)

class Logout(APIView):
    permission_classes = [IsAuthenticated]
    def post(self, request):
        print("trying to logout")
        try:
            print(request.data)
            refresh_token = request.data['refresh']
            token = RefreshToken(refresh_token)
            token.blacklist()
            return Response({"msg": "logedout"}, status=status.HTTP_205_RESET_CONTENT)
        except Exception as e:
            return Response(status=status.HTTP_400_BAD_REQUEST)

class activate(APIView):
    def get(self, request, uidb64, token):
        id = urlsafe_base64_decode(uidb64)
        id = id.decode('utf-8')
        try:
            user = User.objects.get(pk=id)
            if account_activation_token.check_token(user, token):
                user.is_active = True
                user.save()
                return Response({"msg": "Account Activated"}, status.HTTP_200_OK)
            return Response({"msg": "Account is already Activated"}, status.HTTP_200_OK)
        except(TypeError, ValueError, OverflowError, User.DoesNotExist):
            return Response({"msg": "Activation link is invalid"}, status.HTTP_400_BAD_REQUEST)

class MyTokenObtainPairView(TokenObtainPairView):
    serializer_class = MyTokenObtainPairSerializer
    def post(self, request, *args, **kwargs):
        currentUser = User.objects.filter(email=request.data.get('email', None)).first()
        if currentUser and not currentUser.is_active:
            sendEmail(currentUser)
        response = super().post(request, *args, **kwargs)
        return response
