from django.urls import path
from . import views

urlpatterns = [
    path("", views.home),
    path("video", views.video, name="video"),
    path('stream', views.StreamView.as_view(), name='stream')
]
