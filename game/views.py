from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from django.shortcuts import render, redirect
from django.views import View
from django.core.serializers.json import DjangoJSONEncoder
from home.models import Pregunta
from random import randint, seed
import datetime as dt
import json
from json.decoder import JSONDecodeError
from os.path import exists
import time
from .video import VideoCamera, streamVideo
from .utils import readCountInTxt, timer
from proyecto_final.models import db
from uuid import uuid4

seed(42)


def event_stream(request):
    while True:
        submit = False

        fingerCount, manoCerrada = readCountInTxt("./static/game/fingerCount.txt")

        if manoCerrada is False:
            request.session["nowSubmit"] = True
        elif manoCerrada is True and request.session["nowSubmit"] is True:
            submit = True
        else:
            request.session["nowSubmit"] = False
            submit = False

        data = json.dumps(
            [
                fingerCount,
                request.session["question"],
                request.session["options"],
                submit,
                str(timer(request.session["timeStart"], 3, 1)),
            ],
            cls=DjangoJSONEncoder,
        )
        yield "\ndata: {}\n\n".format(data)
        time.sleep(0.5)


# ==================== VISTAS ====================
def getPreguntas(request):
    preguntas = []
    for p in Pregunta.objects.raw(
        f"SELECT * FROM pregunta JOIN tema ON tema.idTema = pregunta.Tema_idTema WHERE Tema='{request.session['tema']}';"
    ):
        preguntas.append(
            {
                "pregunta": p.pregunta,
                "respuesta": p.respuesta,
                "opcion1": p.opcion1,
                "opcion2": p.opcion2,
                "opcion3": p.opcion3,
                "opcion4": p.opcion4,
                "opcion5": p.opcion5,
            }
        )
    request.session["preguntas"] = preguntas.copy()
    return


def loadPregunta(request):
    preguntas = request.session["preguntas"]

    i = randint(0, len(preguntas) - 1)

    listaOpciones = [
        preguntas[i]["opcion1"],
        preguntas[i]["opcion2"],
        preguntas[i]["opcion3"],
        preguntas[i]["opcion4"],
        preguntas[i]["opcion5"],
    ]
    request.session["options"] = []
    for x in listaOpciones:
        if x != "nan":
            request.session["options"].append(x)

    request.session["answer"] = preguntas[i]["respuesta"]
    request.session["question"] = preguntas[i]["pregunta"]
    preguntas.pop(i)
    return


@gzip.gzip_page
def game(request):
    if not request.user.is_authenticated:
        return redirect("/login")
    
    if request.POST:
        if int(request.POST["answer"]) != 0:
            request.session["contestadas"].append(
                {
                    "pregunta": request.session["question"],
                    "respuesta": request.session["options"][request.session["answer"] - 1],
                    "mirespuesta": request.session["options"][int(request.POST["answer"]) - 1],
                }
            )

        if int(request.POST["answer"]) == request.session["answer"]:
            request.session["points"] += 1

        if len(request.session["preguntas"]) > 0:
            loadPregunta(request)
        else:
            return redirect("/game/resultado")

        if "endGame" in request.POST:
            return redirect("/game/resultado/")

    return render(request, "game/game.html")


def loadQuestions(request, tema):
    request.session["points"] = 0
    request.session["nowSubmit"] = False
    request.session["tema"] = tema
    request.session["timeStart"] = str(dt.datetime.now())
    request.session["contestadas"] = []
    request.session["idGame"] = str(uuid4())
    getPreguntas(request)
    loadPregunta(request)
    return redirect("/game/")


def resultado(request):
    validarPuntuacionMax(request)
    saveHistorial(request)
    return render(
        request,
        "game/resultado.html",
        {
            "resultados": request.session["contestadas"],
            "puntuacion": request.session["points"],
        },
    )


def validarPuntuacionMax(request):
    puntaje = request.session["points"]
    tema = request.session["tema"]
    user = request.user.nombre
    puntajeMax = db.obtenerPuntajeMax(tema,user)
    if puntajeMax[0] == -1:
        db.insertarPuntajeMax(tema,user,puntaje)
    if puntajeMax[0] < puntaje:
        db.modificarPuntajeMax(tema,user,puntaje)
    return

def saveHistorial(request):
    path = f'./static/game/logs/{request.user.nombre}.json'
    data = {}
    dataOld = False
    mode = "a"
    
    if exists(path):
        mode = "w"
        with open(path, 'rb') as jsonFile:
            try:
                dataOld = json.load(jsonFile)
                for row in dataOld:
                    if row["idGame"] == request.session["idGame"]:
                        return
            except JSONDecodeError:
                pass
        
    with open(path, mode) as jsonFile:
        data["idGame"] = request.session["idGame"]
        data["date"] = str(dt.datetime.now())
        data["tema"] = request.session["tema"]
        data["cantidad"] = len(request.session["contestadas"])
        data["jugadas"] = request.session["contestadas"]
        data["puntaje"] = request.session["points"]
        if dataOld:
            dataOld.append(data)
        else:
            dataOld = [data]
        json.dump(dataOld, jsonFile, indent=4)
    return
    

def video(request):
    cam = VideoCamera()
    gen = streamVideo(cam)
    return StreamingHttpResponse(
        gen, content_type="multipart/x-mixed-replace;boundary=frame"
    )


class StreamResult(View):
    def get(self, request):
        response = StreamingHttpResponse(event_stream(request))
        response["Content-Type"] = "text/event-stream"
        return response
