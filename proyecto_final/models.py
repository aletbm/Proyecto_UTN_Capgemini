from django.db import models
import pymysql
from .cfgDB import password, user
from datetime import datetime

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

    def modificarPuntajeMax(self,tema,user,puntaje):
        query = f"""
                    UPDATE puntuacionmax 
                    JOIN usuario ON usuario.idUsuario = puntuacionmax.Usuario_idUsuario 
                    JOIN tema ON tema.idTema = puntuacionmax.Tema_idTema
                    SET puntuacionmax.puntuacion = { puntaje }, puntuacionmax.fecha = '{datetime.now()}'
                    WHERE usuario.nombre = "{ user }" and tema.Tema = "{ tema }"
                    """
        try:
            self.cursor.execute(query)
            self.connection.commit()
            return
        except Exception as e:
                print("Error al modificar puntaje máximo")
                raise

    def insertarPuntajeMax(self,tema,user,puntaje):
        query = f"SELECT idTema FROM tema where tema.Tema = '{ tema }' "
        try:
            self.cursor.execute(query)
            idTema = self.cursor.fetchone()
        except Exception as e:
                print("Error al obtener el id del tema")
                raise
        query = f"SELECT idUsuario FROM usuario where usuario.nombre = '{user}'"
        try:
            self.cursor.execute(query)
            idUser = self.cursor.fetchone()
        except Exception as e:
                print("Error al obtener el id del usuario")
                raise
        query = f"""
                INSERT INTO puntuacionmax (puntuacion,fecha, Tema_idTema, Usuario_idUsuario) 
                VALUES ({puntaje},'{datetime.now()}' ,{idTema[0]},{idUser[0]})
                """
        try:  
            self.cursor.execute(query)
            self.connection.commit()
        except Exception as e:
            print("Error al insertar puntaje")
            raise
        return
        
db = TP()