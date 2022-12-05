from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from django.shortcuts import render, redirect
from django.views import View
from django.core.serializers.json import DjangoJSONEncoder
from random import randint, seed
import datetime as dt
import json
import time
from .video import VideoCamera, streamVideo
from .utils import readCountInTxt, timer, saveHistorial
from proyecto_final.models import db
from uuid import uuid4

seed(42)


def getPreguntas(request):
    preguntas = []
    for p in db.getPreguntas(request.session["tema"]):
        preguntas.append(
            {
                "pregunta": p[2],
                "respuesta": p[1],
                "opcion1": p[3],
                "opcion2": p[4],
                "opcion3": p[5],
                "opcion4": p[6],
                "opcion5": p[7],
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
@gzip.gzip_page
def game(request):
    
    if not request.user.is_authenticated:
        return redirect("/login")
    
    if request.POST:
        print(request.POST["answer"])
        if int(request.POST["answer"]) != 0 and (int(request.POST["answer"]) - 1) < len(request.session["options"]):
            request.session["contestadas"].append(
                {
                    "pregunta": request.session["question"],
                    "respuesta": request.session["options"][request.session["answer"] - 1],
                    "mirespuesta": request.session["options"][int(request.POST["answer"]) - 1],
                }
            )

        if int(request.POST["answer"]) == request.session["answer"]:
            request.session["points"] += 1

        if len(request.session["preguntas"]) > 0 and "endGame" not in request.POST:
            loadPregunta(request)
        else:
            return redirect("/game/resultado")

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