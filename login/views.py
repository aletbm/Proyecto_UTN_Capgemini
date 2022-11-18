from django.shortcuts import render, redirect

# Create your views here.
def index(request):
    if request.POST:
        username=request.POST["username"]
        password=request.POST["password"]

        usernameBd="admin"
        passwordBd="1234"

        if username==usernameBd and password==passwordBd:
            return redirect("/home")
        else:
            return render(request, "login.html", {"error":1})
    else:
        return render(request, "login.html")
