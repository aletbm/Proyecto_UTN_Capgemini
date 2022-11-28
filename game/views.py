from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from django.shortcuts import render
from django.views import View
from django.core.serializers.json import DjangoJSONEncoder
from home.models import Pregunta

import json
import time
from .video import VideoCamera, streamVideo


def event_stream(request):
    initial_data = ""
    while True:
        with open("./static/game/fingerCount.txt", "r") as file:
            text = list(file.read())
        submit = 0
        fingerCount = text[0]
        manoCerrada = "".join(text[1:]) == "True"

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
                manoCerrada,
                request.session["question"],
                request.session["options"],
                request.session["answer"],
                submit,
            ],
            cls=DjangoJSONEncoder,
        )

        if not initial_data == data:
            yield "\ndata: {}\n\n".format(data)
            initial_data = data
        time.sleep(1)


# ==================== VISTAS ====================.
@gzip.gzip_page
def game(request):
    preguntas = []
    for p in Pregunta.objects.raw("SELECT * FROM `Pregunta`"):
        preguntas.append(p)
    request.session["answer"] = preguntas[0].respuesta
    request.session["question"] = preguntas[0].pregunta
    request.session["options"] = [
        preguntas[0].opcion1,
        preguntas[0].opcion2,
        preguntas[0].opcion3,
        preguntas[0].opcion4,
        preguntas[0].opcion5,
    ]

    if request.POST:
        if int(request.POST["answer"]) == request.session["answer"]:
            request.session["points"] += 1
        print(request.session["points"])
        return render(request, "game/game.html")
    else:
        request.session["points"] = 0
        return render(request, "game/game.html")


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
