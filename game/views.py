from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from django.shortcuts import render
from django.views import View
from django.core.serializers.json import DjangoJSONEncoder

from .models import Pregunta


import json
import time
from .video import VideoCamera, streamVideo
from django.db import connection


def event_stream(request):
    initial_data = ""
    while True:
        with open("./static/game/fingerCount.txt", "r") as file:
            text = list(file.read())
        submit = 0
        fingerCount = text[0]
        manoCerrada = ''.join(text[1:]) == "True"
        
        if manoCerrada is False:
            request.session['nowSubmit'] = True
        elif manoCerrada is True and request.session['nowSubmit'] is True:
            submit = True
        else:
            request.session['nowSubmit'] = False
            submit = False
        
        data = json.dumps([
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
    
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM `tp`.`pregunta` JOIN Tema ON Tema.idTema = pregunta.Tema_idTema;")
    result = cursor.fetchall()
    
    request.session["answer"] = result[0][1]
    request.session["question"] = result[0][2]
    request.session["options"] = [result[0][3], result[0][4], result[0][5], result[0][6], result[0][7], result[0][8]]
    
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