from .models import Post, User
from rest_framework import serializers
from user.serializers import UserSerializer


# class UserSerializerForPosts(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ['id', 'firstname', 'avatar', 'username', 'techbin']

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = "__all__"

class CreatePostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['title', 'content']