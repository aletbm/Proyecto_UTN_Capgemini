import cv2

#http://pysource.com/download/crash_course_ods.zip

net = cv2.dnn.readNet("dnn_model\dnn_model\yolov4-tiny.weights", "dnn_model\dnn_model\yolov4-tiny.cfg")
model= cv2.dnn_DetectionModel(net)
model.setInputParams(size=(320,320), scale=1/255)
clases=[]
with open("dnn_model\dnn_model\classes.txt") as objeto_archivo:
    for nombre_clase in objeto_archivo.readlines():
        nombre_clase=nombre_clase.strip()
        clases.append(nombre_clase)

captura_video= cv2.VideoCapture(0)

while True:
    bol, frame=captura_video.read()
    (id_clase, puntaje, caja)=model.detect(frame)
    print("Id de clase: ", id_clase)
    print("puntaje:", puntaje)
    print("Caja:", caja)

    for id_clase, puntaje, caja in zip(id_clase, puntaje, caja):
        (x,y,w,h)=caja
        nombre_de_clase= clases[id_clase]
        

        cv2.rectangle(frame, (x,y), (x+w, y+h), (0,255,0), 2 )
        cv2.putText(frame, nombre_de_clase, (x, y-10), cv2.FONT_HERSHEY_PLAIN , 1, (0,255,0), thickness=2 )


    cv2.imshow('Video',frame)


    if cv2.waitKey(1) & 0xFF == ord('q'):
        break