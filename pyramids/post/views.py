from .models import Post
from django.shortcuts import render
from rest_framework import generics
from .serializers import PostSerializer, CreatePostSerializer
from .permissions import IsAuthorOrReadOnly
from rest_framework.permissions import (
    AllowAny,
    IsAuthenticated,
)
# Create your views here.

# ListAPIView
class Post_list(generics.ListAPIView):
    permission_classes = [AllowAny]
    queryset = Post.objects.all().order_by("-created_at")
    serializer_class = PostSerializer

# CreateAPIView
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
    # permission_classes = [AllowAny]

class PostDelete(generics.DestroyAPIView):
    queryset = Post.objects.all()
    serializer_class = PostSerializer
    permission_classes = [IsAuthenticated, IsAuthorOrReadOnly]