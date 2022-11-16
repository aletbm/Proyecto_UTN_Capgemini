from django.shortcuts import render

# Create your views here.
def index(request):
    return render(request, "index.html")



def login(request):
    username=request.GET["username"]
    password=request.GET["password"]

    return render(request, "home/home.html", {"logged":True})