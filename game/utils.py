import datetime as dt
import json
from json.decoder import JSONDecodeError
from os.path import exists

def readCountInTxt(path):
    with open(path, "r") as file:
        text = list(file.read())
        
    if len(text) > 0:
        bol = "".join(text[1:]) == "True"
        finger = text[0]
    else:
        bol = False
        finger = 0
        
    return finger, bol


def timer(start, m, s):
    timeEnd = dt.datetime.strptime(start, "%Y-%m-%d %H:%M:%S.%f") + dt.timedelta(minutes=m, seconds=s)
    if timeEnd < dt.datetime.now():
        return "0:00:00"
    else:
        return timeEnd - dt.datetime.now()


def saveHistorial(request):
    path = f'./static/game/logs/{request.user.nombre}.json'
    data = {}
    dataOld = False
    
    if exists(path):
        with open(path, 'rb') as jsonFile:
            try:
                dataOld = json.load(jsonFile)
                for row in dataOld:
                    if row["idGame"] == request.session["idGame"]:
                        return
            except JSONDecodeError:
                pass
        
    with open(path, "w") as jsonFile:
        data["idGame"] = request.session["idGame"]
        data["date"] = str(dt.datetime.now())
        data["tema"] = request.session["tema"]
        data["cantidad"] = len(request.session["contestadas"])
        data["jugadas"] = request.session["contestadas"]
        data["puntaje"] = request.session["points"]
        if dataOld:
            dataOld.append(data)
        else:
            dataOld = [data]
        json.dump(dataOld, jsonFile, indent=4)
    return   