from django.shortcuts import render, redirect
from django.contrib.auth import login

from proyecto_final.models import db, Countries

def index(request):
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
            username = request.POST['username']
            password = request.POST['password']
            country = request.POST['country']
            user = db.register(username=username, password=password, country=country)
            login(request, user,  backend='django.contrib.auth.backends.AllowAllUsersModelBackend')
            return redirect('/')
    else:
        countries = []
        for p in Countries.objects.raw("SELECT * FROM countries"):
            countries.append(p)
        return render(request, 'register.html', {"countries": countries})