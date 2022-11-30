import datetime as dt

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
    return timeEnd - dt.datetime.now()