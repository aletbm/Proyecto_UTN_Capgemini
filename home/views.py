from django.shortcuts import render
from .models import Tema


def index(request):
    temas = []
    for p in Tema.objects.raw("SELECT * FROM tema"):
        temas.append(p.tema)
    return render(request, "home/index.html", {"temas": temas})
