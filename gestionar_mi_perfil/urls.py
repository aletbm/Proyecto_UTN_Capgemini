from django.urls import path
from gestionar_mi_perfil import views

urlpatterns = [
    path("", views.index, name="gestionar_perfil"),
    path("cambio_nombre_y_pais", views.updateNombreYCountry),
    path("cambio_contrasenia", views.updateContrasenia),
]
