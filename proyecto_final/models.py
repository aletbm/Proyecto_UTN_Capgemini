from django.db import models
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

    def register(self, username, password, country):
        query='INSERT INTO usuario(nombre, contrasenia, Countries_idCountries) VALUES ("{}","{}",{})'.format(username, password, country)
        try:
            self.cursor.execute(query)
            self.connection.commit()
        except Exception as e:
            print("Error al crear el usuario")


db = TP()