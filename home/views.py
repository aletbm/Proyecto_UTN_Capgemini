from django.http import StreamingHttpResponse
from django.views.decorators import gzip
from django.shortcuts import render
import cv2
import threading
import mediapipe as mp

# Create your views here.
@gzip.gzip_page
def home(request):
    return render(request, "index.html")


class VideoCamera(object):
    def __init__(self):
        self.video = cv2.VideoCapture(0, cv2.CAP_DSHOW)
        (self.grabbed, self.frame) = self.video.read()
        threading.Thread(target=self.update, args=()).start()

    def __del__(self):
        self.video.release()

    def get_frame(self):
        image = cv2.cvtColor(self.frame, cv2.COLOR_RGBA2RGB)
        THUMB_IP = 3
        THUMB_TIP = 4
        FINGERS_PIP = [6,10,14,18]
        FINGERS_TIP = [8,12,16,20]

        mp_drawing = mp.solutions.drawing_utils
        mp_hands = mp.solutions.hands
        finger_count = 0
        
        with mp_hands.Hands(static_image_mode=False, max_num_hands=2, min_detection_confidence=0.5) as hands:
            frame = self.frame
            height, width, _ = frame.shape
            frame = cv2.flip(frame, 1)
            frame_rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
            
            results = hands.process(frame_rgb)
            if results.multi_hand_landmarks is not None:
                for hand_landmarks in results.multi_hand_landmarks: #Cada mano tiene 21 landmarks
                    handIndex = results.multi_hand_landmarks.index(hand_landmarks)  #Identificador de mano
                    handLabel = results.multi_handedness[handIndex].classification[0].label     #Identificador de mano izquierda o derecha
                    handLandmarks = []

                    # Fill list with x and y positions of each landmark
                    for landmarks in hand_landmarks.landmark:
                        handLandmarks.append([landmarks.x, landmarks.y])
                        
                    # Tengamos en cuenta que el origen se encuentra en la esquina superior izquierda    
                    # Identificamos si se levanta el dedo pulgar con respecto al eje X
                    if handLabel == "Left" and handLandmarks[THUMB_IP][0] < handLandmarks[THUMB_TIP][0]:
                        finger_count += 1
                    if handLabel == "Right" and handLandmarks[THUMB_IP][0] > handLandmarks[THUMB_TIP][0]:
                        finger_count += 1
                    
                    # Identificamos dedos levantados con respecto al eje Y
                    for i in range(4):
                        if handLandmarks[FINGERS_TIP[i]][1] < handLandmarks[FINGERS_PIP[i]][1]:
                            finger_count += 1

                    mp_drawing.draw_landmarks(
                        frame, hand_landmarks, mp_hands.HAND_CONNECTIONS,
                        mp_drawing.DrawingSpec(color=(0,255,255), thickness=3, circle_radius=5),
                        mp_drawing.DrawingSpec(color=(255,0,255), thickness=4, circle_radius=5))
                    
            cv2.putText(frame, "{}".format(finger_count), (10,30), 1, 2, (0,255,255), 1, cv2.LINE_AA)
            finger_count = 0
            
        image = frame.copy()
        _, jpeg = cv2.imencode(".jpg", image)
        return jpeg.tobytes()

    def update(self):
        while True:
            (self.grabbed, self.frame) = self.video.read()


def gen(camera):
    while True:
        try:
            frame = camera.get_frame()
            yield (
                b"--frame\r\n" b"Content-Type: image/jpeg\r\n\r\n" + frame + b"\r\n\r\n"
            )
        except Exception:
            camera.__del__()


def video(request):
    cam = VideoCamera()
    return StreamingHttpResponse(
        gen(cam), content_type="multipart/x-mixed-replace;boundary=frame"
    )
