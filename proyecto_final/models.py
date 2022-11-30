from django.db import models
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager
import pymysql
from .cfgDB import password, user

class Countries(models.Model):
    idcountries = models.SmallAutoField(db_column='idCountries', primary_key=True)  # Field name made lowercase.
    name = models.CharField(unique=True, max_length=45)
    iso = models.CharField(db_column='ISO', unique=True, max_length=2)  # Field name made lowercase.


class CustomUserManager(BaseUserManager):
    use_in_migrations=True

    def create_user(self, username, password, country):
        if not username:
            raise ValueError('Users must have an username')
        user = self.model(
            username=username,
            country=country,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

class CustomuUser(AbstractBaseUser):
    idUsuario = models.IntegerField(primary_key=True)
    nombre = models.CharField(max_length=45, unique=True)
    contrasenia = models.CharField(max_length=45)
    country = models.ForeignKey('Countries', db_column='idCountries', on_delete=models.CASCADE)

    is_active = models.BooleanField(default=True)

    objects = CustomUserManager()

    USERNAME_FIELD="nombre"
    REQUIRED_FIELDS = []

    class Meta:
        managed = False
        db_table = 'usuario'

class TP():
    def __init__(self):
        self.connection = pymysql.connect(
            host='localhost',
            user=user,
            password=password,
            db='tp'
        )
        try:
            self.cursor = self.connection.cursor()
        except Exception as e:
            print("Error en la conexión")
            raise

    def register(self, username, password, country):
        query='INSERT INTO usuario(nombre, contrasenia, Countries_idCountries) VALUES ("{}","{}","{}")'.format(username, password, country)
        try:
            self.cursor.execute(query)
            self.connection.commit()
            user = CustomuUser.objects.create_user(username=username, password=password, country=country)
            
            return user
        except Exception as e:
            print("Error al crear el usuario")

    def login(self, username, password):
        query='SELECT * FROM usuario WHERE nombre="{}" and contrasenia="{}"'.format(username, password)
        try:
            self.cursor.execute(query)
            user = self.cursor.fetchone()
            user = User.objects.get(username=username)
            return user
        except Exception as e:
            print(e)
            return None


db = TP()