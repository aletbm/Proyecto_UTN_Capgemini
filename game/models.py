from django.db import models

# Create your models here.


class Usuario(models.Model):
    idUsuario = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45)
    contrasenia = models.CharField(max_length=45)
    Countries_idCountries = models.IntegerField()
    PuntuacionMAx_idPuntuacion = models.IntegerField()
