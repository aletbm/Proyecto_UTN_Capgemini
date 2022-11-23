from django.db import models
from django.contrib.auth.models import User
import pymysql


class TP():
    def __init__(self):
        self.connection = pymysql.connect(
            host='localhost',
            user='root',
            password='1234',
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
            print(query)
            try:
                self.cursor.execute(query)
                self.connection.commit()
                user = User.objects.create_user(username=username, password=password)
                print(user)
                
                return user
            except Exception as e:
                print("Error al crear el usuario")
        else:
            query='SELECT * FROM usuario WHERE nombre="{}" and contrasenia="{}"'.format(username, password)
            print(query)
            try:
                print("antes de buscar")
                self.cursor.execute(query)
                print("ejecuto")
                user = self.cursor.fetchone()
                user = User.objects.get(username=username)
                print(user)
                
                return user
            except Exception as e:
                return None


db = TP()