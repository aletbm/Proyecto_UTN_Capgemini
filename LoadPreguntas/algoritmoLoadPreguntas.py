import pandas as pd
from home.models import Tema
from django.db import connections

xls = pd.read_excel(open('PreguntasProyecto_ACADEMIA_PYTHON.xlsx', 'rb'), sheet_name='Preguntas')
xlsArr = xls.to_numpy()

temas = {}

for p in Tema.objects.raw("SELECT * FROM tema"):
    temas[p.tema] = p.idtema
 
cursor = connections['default'].cursor()
for i in range(0, len(xlsArr)):
    xlsArr[i][-1] = temas[xlsArr[i][-1]]
    cursor.execute(f""" INSERT INTO pregunta
                        (respuesta,
                        pregunta,
                        opcion1,
                        opcion2,
                        opcion3,
                        opcion4,
                        opcion5,
                        Tema_idTema)
                        VALUES( {xlsArr[i][-2]},
                        '{xlsArr[i][0]}',
                        '{xlsArr[i][1]}',
                        '{xlsArr[i][2]}',
                        '{xlsArr[i][3]}',
                        '{xlsArr[i][4]}',
                        '{xlsArr[i][5]}',
                        {xlsArr[i][-1]});
                        """)