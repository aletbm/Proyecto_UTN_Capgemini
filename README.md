<div align="center" style="display:flex;justify-content:center; align-items:center;"><img src="static\media\sobre_el_proyecto\Capgemini-Logo.png" width="200"/><img src="static\media\sobre_el_proyecto\utn.png" width="200"/></div>

# ✋ GetMeFive

![Python](https://img.shields.io/badge/python-3670A0?style=for-the-badge&logo=python&logoColor=ffdd54)
![Django](https://img.shields.io/badge/django-%23092E20.svg?style=for-the-badge&logo=django&logoColor=white)
![OpenCV](https://img.shields.io/badge/opencv-%23white.svg?style=for-the-badge&logo=opencv&logoColor=white)
![HTML5](https://img.shields.io/badge/html5-%23E34F26.svg?style=for-the-badge&logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/css3-%231572B6.svg?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/javascript-%23323330.svg?style=for-the-badge&logo=javascript&logoColor=%23F7DF1E)
![MySQL](https://img.shields.io/badge/mysql-%2300f.svg?style=for-the-badge&logo=mysql&logoColor=white)

## 🕹 Proyecto para Academia Python - Capgemini x UTN

### ✍ Descripción:

Este proyecto fue realizado con una finalidad educativa para la Academia Python brindada por la empresa [Capgemini](https://www.capgemini.com/ar-es/) en colaboracion con la [UTN FRBA](https://www.frba.utn.edu.ar/), en el año 2022. El proyecto consiste en una pagina web que permite a los usuarios registrarse y loguearse, y poder jugar a contestar preguntas de distintos temas mediante la camara.

### 👀 Visitando la plataforma:

**Inicio**: En esta vista presentamos los juegos disponibles los cuales podran ser accedidos siempre y cuando el usuario se encuentre registrado y logueado.

**Puntuaciones**: En esta vista presentamos la tabla de puntuaciones maximas de todos los jugadores de la plataforma, con la posibilidad de filtrar la tabla de acuerdo al nombre de jugador o tematica.

**Sobre el proyecto**: En esta vista veras informacion extra sobre el proyecto asi como tambien vista previas del juego en funcionamiento

**Contacto**: Aqui podras encontrar informacion de contacto de los desarrolladores de la plataforma.

**Registro**: Aqui podras registrarte y formar parte de esta gran comunidad.

**Login**: En esta vista podras loguearte en el sistema lo que te permitira acceder a los juegos.

### 💻 Lanzar proyecto localmente:

#### 📜 Prerequisitos:

+ Este proyecto fue desarrollado sobre Python 3.9 o versiones superiores.
+ Se utilizo el framework [Django 4.1](https://www.djangoproject.com/) y la BBDD [MySQL](https://www.mysql.com/).
+ Se utilizaron las siguiente librerias:
    + [OpenCV v4.6.0.66](https://docs.opencv.org/4.x/index.html)
    + [mediapipe v0.9.0](https://google.github.io/mediapipe/getting_started/python.html)
    + [pandas v1.5.2](https://pandas.pydata.org/)
    + [pymysql v1.0.2](https://pypi.org/project/PyMySQL/)
    + [mysqlclient v2.1.1](https://pypi.org/project/mysqlclient/)

#### 🔧 Instalación
Procedemos a instalar los paquetes:

```
pip install django==4.1
pip install opencv-python==4.6.0.66
pip install mediapipe==0.9.0
pip install pandas==1.5.2
pip install pymysql==1.0.2
pip install mysqlclient==2.1.1
```
Ademas, debemos instalar el servidor para MySQL.

#### ✏️ Variables de entorno:
Antes de proceder con la ejecucion del servidor debemos configurar un archivo cfgDB.py dentro de la app-raiz 'proyecto_final' para configurar el acceso al servidor de MySQL con las siguientes credenciales:

```
password = "YOUR_PASSWORD"
user = "YOUR_USER"
port = "MYSQL's_PORT"
```

#### 🔧 Correr servidor local de Django y visualización de web localmente:

```
python manage.py makemigrations
python manage.py migrate
python manage.py test
python manage.py runserver
```
A continuación abra su navegador de preferencia e ingrese a la siguiente url http://127.0.0.1:8000/ si todo va bien debería visualizar la página principal.

### 👁️ Vista previa:
![SegmentLocal](preview1.gif "segment")