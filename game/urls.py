from django.urls import path
from . import views

urlpatterns = [
    path("", views.game),
    path("loadGame/<str:tema>/", views.loadQuestions),
    path("resultado/", views.resultado),
    path("video", views.video, name="video"),
    path('streamResult', views.StreamResult.as_view(), name='streamResult')
]
