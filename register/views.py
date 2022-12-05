from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate

from proyecto_final.models import db
from register.forms import RegisterForm

def index(request):
    context = {}
    
    if request.user.is_authenticated:
        return redirect('/')
    
    if request.method == 'POST':
        form = RegisterForm(request.POST)
        if form.is_valid():
            nombre = form.cleaned_data['nombre']
            contrasenia = form.cleaned_data['password1']
            country = form.cleaned_data['country']
            db.register(nombre, contrasenia, country)
            user = form.save()
            login(request, user)
            return redirect('/')
        else:
            context['form'] = form
    else:
        form = RegisterForm()
        context['form'] = form
    return render(request, 'register.html', context)