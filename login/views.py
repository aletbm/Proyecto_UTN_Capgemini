from django.shortcuts import render, redirect
from django.contrib.auth import login

from proyecto_final.models import db

# Create your views here.
def index(request):
    if request.user.is_authenticated:
        return render(request, 'index.html')
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        user = db.login(username=username, password=password)
        if user is not None:
            print("usuario autenticado")
            login(request, user)
            return redirect('/')
        else:
            print("usuario no autenticado")
            return render(request, 'login.html',  {"error":1})
    else:
        return render(request, 'login.html')
