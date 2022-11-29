from django.urls import path
from scoring import views

urlpatterns = [
    path("", views.index),
    path("filter",views.filter)
]