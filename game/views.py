from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from django.shortcuts import render
from django.views import View
from django.core.serializers.json import DjangoJSONEncoder

from .models import Usuario

import json
import time
from .video import VideoCamera, streamVideo


def event_stream(request):
    quesAndAns = {
        "2": {
            "question": "¿Cuantos mundiales ha ganado Argentina?",
            "options": ["Uno", "Dos", "Tres", "Cuatro", "Ninguna"],
            "answer": 2,
        }
    }
    initial_data = ""
    while True:
        with open("./static/game/fingerCount.txt", "rb") as file:
            text = file.read().decode("utf-8")
        data = json.dumps(
            list(
                [
                    text,
                    quesAndAns[request.session["id_question"]]["question"],
                    quesAndAns[request.session["id_question"]]["options"],
                    quesAndAns[request.session["id_question"]]["answer"],
                ]
            ),
            cls=DjangoJSONEncoder,
        )

        if not initial_data == data:
            yield "\ndata: {}\n\n".format(data)
            initial_data = data
        time.sleep(1)


# ==================== VISTAS ====================.
@gzip.gzip_page
def game(request):
    quesAndAns = {
        "2": {
            "question": "¿Cuantos mundiales ha ganado Argentina?",
            "options": ["Uno", "Dos", "Tres", "Cuatro", "Ninguna"],
            "answer": 2,
        }
    }
    if request.POST:
        if (
            int(request.POST["answer"])
            == quesAndAns[request.session["id_question"]]["answer"]
        ):
            request.session["points"] += 1
        return render(request, "game/game.html")
    else:
        request.session["id_question"] = "2"
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


def test(request):
    for p in Usuario.objects.raw('SELECT * FROM Usuario'):
        print(p.nombre)
    return render(request, "game/i.html")