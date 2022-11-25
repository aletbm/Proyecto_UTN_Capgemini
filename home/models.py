from django.db import models

# Create your models here.

class Tema(models.Model):
    idTema = models.SmallIntegerField(primary_key=True)
    tema = models.CharField(max_length=45)