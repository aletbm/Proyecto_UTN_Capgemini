from django.shortcuts import render
from .models import Tema
import unicodedata


def index(request):
    def without_accents(s):
        return "".join(
            c
            for c in unicodedata.normalize("NFD", s)
            if unicodedata.category(c) != "Mn"
        )

    temas = []
    for p in Tema.objects.raw("SELECT * FROM tema"):
        temas.append(p.tema)
    return render(request, "home/index.html", {"temas": temas})
