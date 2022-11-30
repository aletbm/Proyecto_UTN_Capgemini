from django.db import models

# Create your models here.
    
class Countries(models.Model):
    idcountries = models.SmallAutoField(db_column='idCountries', primary_key=True)  # Field name made lowercase.
    name = models.CharField(unique=True, max_length=45)
    iso = models.CharField(db_column='ISO', unique=True, max_length=2)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'countries'

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


class Puntuacionmax(models.Model):
    idpuntuacion = models.AutoField(db_column='idPuntuacion', primary_key=True)  # Field name made lowercase.
    puntuacion = models.PositiveIntegerField()
    fecha = models.DateField()
    tema_idtema = models.ForeignKey('Tema', models.DO_NOTHING, db_column='Tema_idTema')  # Field name made lowercase.
    usuario_idusuario = models.ForeignKey('Usuario', models.DO_NOTHING, db_column='Usuario_idUsuario')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'puntuacionmax'


class Tema(models.Model):
    idtema = models.AutoField(db_column='idTema', primary_key=True)  # Field name made lowercase.
    tema = models.CharField(db_column='Tema', max_length=45)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tema'


class Usuario(models.Model):
    idusuario = models.AutoField(db_column='idUsuario', primary_key=True)  # Field name made lowercase.
    nombre = models.CharField(max_length=45)
    contrasenia = models.CharField(max_length=45)
    countries_idcountries = models.ForeignKey(Countries, models.DO_NOTHING, db_column='countries_idCountries', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'usuario'