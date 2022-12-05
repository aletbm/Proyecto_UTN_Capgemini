from django.shortcuts import render
from proyecto_final.models import db


def index(request):
    temas = []
    for p in db.getTemas():
        temas.append(p[1])
    return render(request, "home/index.html", {"temas": temas})