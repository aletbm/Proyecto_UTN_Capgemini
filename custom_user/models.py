from django.db import models
from django.contrib.auth.models import User, AbstractBaseUser, BaseUserManager, PermissionsMixin


class Countries(models.Model):
    # Field name made lowercase.
    idcountries = models.SmallAutoField(
        db_column='idCountries', primary_key=True)
    name = models.CharField(unique=True, max_length=45)
    # Field name made lowercase.
    iso = models.CharField(db_column='ISO', unique=True, max_length=2)


class CustomUserManager(BaseUserManager):
    def create_user(self, nombre, contrasenia, country=238):
        if not nombre:
            raise ValueError('Users must have an username')
        if not country:
            raise ValueError('Users must have a country')
        user = self.model(
            nombre=nombre,
            country=country,
        )
        user.set_password(contrasenia)
        user.save(using=self._db)
        return user

    def create_superuser(self, nombre, contrasenia):
        user = self.create_user(
            nombre=nombre,
            contrasenia=contrasenia,
        )
        user.is_admin = True
        user.is_superuser = True
        user.is_staff = True
        user.save(using=self._db)
        return user


class CustomUser(AbstractBaseUser, PermissionsMixin):
    nombre = models.CharField(max_length=45, unique=True)
    contrasenia = models.CharField(max_length=45)
    country = models.IntegerField() # Deberia ser una foreign key pero lo cambie porque rompia

    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)

    objects = CustomUserManager()

    USERNAME_FIELD = "nombre"
    REQUIRED_FIELDS = ["contrasenia", "country"]

    def __str__(self):
        return self.nombre
