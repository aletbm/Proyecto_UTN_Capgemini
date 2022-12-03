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

    def updateNombreYCountry(self,username,country):
        query = f"""
                    UPDATE usuario 
                    SET nombre = "{ username }", Countries_idCountries = { country }
                    WHERE nombre = "{ username }"
                    """
        try:
            self.cursor.execute(query)
            self.connection.commit()
            return
        except Exception as e:
            print("Error al modificar nombre y country")
            raise

    def updateContrasenia(self,username,password):
        query = f"""
                    UPDATE usuario 
                    SET contrasenia = "{ password }"
                    WHERE nombre = "{ username }"
                    """
        try:
            self.cursor.execute(query)
            self.connection.commit()
            return
        except Exception as e:
            print("Error al modificar contraseña")
            raise

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
    
    def obtenerPuntajeMax(self,tema,user):
        query  = f"""
                    SELECT puntuacionmax.puntuacion FROM usuario
                    JOIN puntuacionmax ON usuario.idUsuario = puntuacionmax.Usuario_idUsuario
                    JOIN tema ON tema.idTema = puntuacionmax.Tema_idTema
                    where usuario.nombre = "{ user }" and tema.Tema = "{ tema }"
                    """
        try:
            self.cursor.execute(query)
            puntaje = self.cursor.fetchone()
            if puntaje == None:
                return (-1,)
            else:
                return puntaje
        except Exception as e:
                print("Error al obtener puntaje máximo")
                raise

db = TP()