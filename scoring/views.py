from django.shortcuts import render
from proyecto_final.models import db

def index(request):
    tabla = db.obtenerTabla()
    return render(request, 'scoring.html', {"tabla":tabla})

def filter(request):
    type = request.GET["filter"]
    text = request.GET["text"]
    if type == "user":
        tabla = db.filterByUser(text)
    if type == "tema":
        tabla = db.filterByTema(text)
    if type == "pais":
        tabla = db.filterByCountry(text)
    return render(request, 'scoring.html', {"tabla":tabla})