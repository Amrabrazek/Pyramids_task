from .models import User
from rest_framework import serializers
from django.contrib.auth.hashers import make_password
from django.contrib.auth.password_validation import validate_password
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"
        extra_kwargs = {
            'password': {'write_only': True, 'read_only': False},
            }

    def update(self, instance, validated_data):
        print(validated_data)
        for key, value in validated_data.items():
            setattr(instance, key, value)
        instance.save()
        return instance


class SignupSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'
        extra_kwargs = {'password': {'write_only': True}}

    def create(self, validated_data):
        if validate_password(validated_data['password']) == None:
            password = make_password(validated_data['password'])
            user = User.objects.create(
                firstname=validated_data['firstname'],
                lastname=validated_data['lastname'],
                username=validated_data['username'],
                email=validated_data['email'],
                password=password,
            )
            return user

class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    @classmethod
    def get_token(cls, user):
        token = super().get_token(user)
        token['username'] = user.username
        return token