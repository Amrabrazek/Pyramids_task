from django.urls import path
from .views import (
    Post_list,
    PostCreate,
    PostUpdate,
    PostDelete,
)

urlpatterns = [
    path("", Post_list.as_view(), name="postInfo"),
    path("create", PostCreate.as_view(), name="postCreate"),
    path("update/<int:pk>", PostUpdate.as_view(), name="postUpdate"),
    path("delete/<int:pk>", PostDelete.as_view(), name="postDelete"),
]
