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

    def obtenerTabla(self):
        query = """
                SELECT usuario.nombre, puntuacionmax.puntuacion, puntuacionmax.fecha, tema.Tema FROM usuario 
                JOIN puntuacionmax ON usuario.idUsuario = puntuacionmax.Usuario_idUsuario 
                JOIN tema ON tema.idTema = puntuacionmax.Tema_idTema 
                order by  puntuacionmax.puntuacion desc
                """
        try:
            self.cursor.execute(query)
            tabla = self.cursor.fetchall()
            return tabla
        except Exception as e:
                print("Error en tabla puntuación")
                raise
    
    def filterByTema(self,text):
        query = f""" 
                    SELECT usuario.nombre, puntuacionmax.puntuacion, puntuacionmax.fecha, tema.Tema FROM usuario
                    JOIN puntuacionmax ON usuario.idUsuario = puntuacionmax.Usuario_idUsuario
                    JOIN tema ON tema.idTema = puntuacionmax.Tema_idTema
                    where tema.Tema = "{ text }"
                    order by  puntuacionmax.puntuacion desc
                    """
        try:
            self.cursor.execute(query)
            tabla = self.cursor.fetchall()
            return tabla
        except Exception as e:
                print("Error al filtrar")
                raise
    
    def filterByUser(self,text):
        query  = f"""
                    SELECT usuario.nombre, puntuacionmax.puntuacion, puntuacionmax.fecha, tema.Tema FROM usuario
                    JOIN puntuacionmax ON usuario.idUsuario = puntuacionmax.Usuario_idUsuario
                    JOIN tema ON tema.idTema = puntuacionmax.Tema_idTema
                    where usuario.nombre = "{ text }" 
                    order by  puntuacionmax.puntuacion desc
                    """
        try:
            self.cursor.execute(query)
            tabla = self.cursor.fetchall()
            return tabla
        except Exception as e:
                print("Error al filtrar")
                raise
            
db = TP()