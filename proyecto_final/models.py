from django.db import models
from django.contrib.auth.models import User
import pymysql
from .cfgDB import password, user


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

    def authenticate(self, type, username, password):
        if type == "register":
            query='INSERT INTO usuario(nombre, contrasenia) VALUES ("{}","{}")'.format(username, password)
            try:
                self.cursor.execute(query)
                self.connection.commit()
                user = User.objects.create_user(username=username, password=password)
                
                return user
            except Exception as e:
                print("Error al crear el usuario")
        else:
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