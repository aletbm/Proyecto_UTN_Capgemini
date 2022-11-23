from django.urls import path
from signout import views

urlpatterns = [
    path("", views.signout),
]
