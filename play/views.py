from django.http import StreamingHttpResponse
from django.shortcuts import render
import cv2

cap = cv2.VideoCapture(0, cv2.CAP_DSHOW)


def index(request):
    return render(request, "index.html")


def generateWebcam(request):
    while True:
        ret, frame = cap.read()
        if ret:
            cv2.imshow('frame', frame)
            (flag, encodedImage) = cv2.imencode(".jpg", frame)
            if not flag:
                continue
            yield (b'--frame\r\n' b'Content-Type: image/jpeg\r\n\r\n' + bytearray(encodedImage) + b'\r\n')


def video_feed():
    return StreamingHttpResponse(generateWebcam(), content_type='multipart/x-mixed-replace; boundary=frame')


cap.release()
