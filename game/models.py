from django.db import models
from home.models import Tema
# Create your models here.


class Usuario(models.Model):
    idUsuario = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45)
    contrasenia = models.CharField(max_length=45)
    Countries_idCountries = models.IntegerField()
    PuntuacionMAx_idPuntuacion = models.IntegerField()

class Pregunta(models.Model):
    idPregunta = models.IntegerField(primary_key=True)
    respuesta = models.SmallIntegerField()
    pregunta = models.CharField(max_length=300)
    opcion1 = models.CharField(max_length=45)
    opcion2 = models.CharField(max_length=45)
    opcion3 = models.CharField(max_length=45)
    opcion4 = models.CharField(max_length=45)
    opcion5 = models.CharField(max_length=45)
    Tema_idTema = models.ForeignKey(Tema, on_delete=models.CASCADE, to_field="idTema")
    
