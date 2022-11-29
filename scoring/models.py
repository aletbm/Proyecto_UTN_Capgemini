from django.db import models

# Create your models here.

class FilaPuntuaciones(models.Model):
    nombre = models.CharField(max_length=45)
    puntuacion_max = models.IntegerField()
    fecha = models.DateField()
    tema = models.CharField(max_length=45)