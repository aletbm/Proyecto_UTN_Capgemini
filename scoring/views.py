from django.shortcuts import render
from proyecto_final.models import db

def index(request):
    db.obtenerTabla()
    return render(request, 'scoring.html')
