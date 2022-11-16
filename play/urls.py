from django.urls import path
from play import views

urlpatterns = [
    path('', views.index, name='index'),
]