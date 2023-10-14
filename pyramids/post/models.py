from user.models import User
from django.db import models

class Post(models.Model):
    title = models.CharField(max_length=255, null=True, blank=True)    
    content = models.TextField(null=True)  
    author = models.ForeignKey(User, on_delete=models.CASCADE, related_name="author_posts")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
