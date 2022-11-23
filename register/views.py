from django.shortcuts import render, redirect
from django.contrib.auth import login

from proyecto_final.models import db

def index(request):
    if request.user.is_authenticated:
        return redirect('/home')
    if request.method == 'POST':
            username = request.POST['username']
            password = request.POST['password']
            user = db.authenticate(type="register",username=username, password=password)
            login(request, user)
            return redirect('/home')
    else:
        return render(request, 'register.html')