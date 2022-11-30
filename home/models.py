from django.db import models

# Create your models here.
    

class Pregunta(models.Model):
    idpregunta = models.AutoField(db_column='idPregunta', primary_key=True)  # Field name made lowercase.
    respuesta = models.PositiveIntegerField()
    pregunta = models.CharField(max_length=300)
    opcion1 = models.CharField(max_length=100, blank=True, null=True)
    opcion2 = models.CharField(max_length=100, blank=True, null=True)
    opcion3 = models.CharField(max_length=100, blank=True, null=True)
    opcion4 = models.CharField(max_length=100, blank=True, null=True)
    opcion5 = models.CharField(max_length=100, blank=True, null=True)
    tema_idtema = models.ForeignKey('Tema', models.DO_NOTHING, db_column='Tema_idTema')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pregunta'


class Tema(models.Model):
    idtema = models.AutoField(db_column='idTema', primary_key=True)  # Field name made lowercase.
    tema = models.CharField(db_column='Tema', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tema'