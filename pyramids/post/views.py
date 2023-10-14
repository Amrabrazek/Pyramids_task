from .serializers import PostSerializer, CreatePostSerializer
from .permissions import IsAuthorOrReadOnly
from django.shortcuts import render
from rest_framework import generics
from .models import Post
from rest_framework.permissions import (
    AllowAny,
    IsAuthenticated,
)
# Create your views here.


class Post_list(generics.ListAPIView):
    permission_classes = [AllowAny]
    queryset = Post.objects.all().order_by("-created_at")
    serializer_class = PostSerializer

class PostCreate(generics.CreateAPIView):
    queryset = Post.objects.all()
    serializer_class = CreatePostSerializer
    permission_classes = [AllowAny, IsAuthenticated]
    def perform_create(self, serializer):
        serializer.save(author=self.request.user)

class PostUpdate(generics.UpdateAPIView):
    queryset = Post.objects.all()
    serializer_class = CreatePostSerializer
    permission_classes = [IsAuthenticated, IsAuthorOrReadOnly]

class PostDelete(generics.DestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [IsAuthenticated, IsAuthorOrReadOnly]