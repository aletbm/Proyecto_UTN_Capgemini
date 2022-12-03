from django.shortcuts import render, redirect

from proyecto_final.models import db

from gestionar_mi_perfil.forms import UpdateCustomUserData, UpdateCustomUserPassword

from custom_user.models import Countries

def index(request):
    if not request.user.is_authenticated:
        return redirect('/login')
    country=Countries.objects.raw("SELECT * FROM countries WHERE idcountries=%s", [request.user.country])[0]
    return render(request, 'gestionar_mi_perfil.html', {"country":country.name})

def updateNombreYCountry(request):
    if not request.user.is_authenticated:
        return redirect('/login')
    
    context={}

    if request.POST:
        form = UpdateCustomUserData(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            db.updateNombreYCountry(username=request.POST['nombre'], country=request.POST['country'])
            redirect('/')
    else:
        form = UpdateCustomUserData(
            initial={
                'nombre': request.user.nombre,
                'country': request.user.country,
            }
        )
    context['form'] = form
    return render(request, 'cambio_nombre.html', context)

def updateContrasenia(request):
    if not request.user.is_authenticated:
        return redirect('/login')
    
    context = {}

    if request.POST:
        form = UpdateCustomUserPassword(request.user, data=request.POST)
        if form.is_valid():
            form.save()
            db.updateContrasenia(username=request.user.nombre, password=request.POST['new_password1'])
            redirect('/')
    else:
        form = UpdateCustomUserPassword(user=request.user)
    context['form'] = form
    return render(request, 'cambio_contrasenia.html', context)