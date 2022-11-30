from django.urls import path
from sobre_el_proyecto import views

urlpatterns = [
    path("", views.index),
]
