import cv2  # pip isntall opencv-python
import numpy as np  # pip install numpy
import imutils  # pip install imutils

cap = cv2.VideoCapture(0)
cv2.namedWindow("Frame", cv2.WINDOW_NORMAL)
roi = None
p1 = (0, 0)
state = 0


def on_mouse(event, x, y, flags, userdata):
    global p1
    if event == cv2.EVENT_LBUTTONUP:
        p1 = (x, y)


# Register the mouse callback
cv2.setMouseCallback("Frame", on_mouse)

bg = None
th = None

color_start = (204, 204, 0)
color_end = (204, 0, 204)
color_far = (255, 0, 0)

color_start_far = (204, 204, 0)
color_far_end = (204, 0, 204)
color_start_end = (0, 255, 255)

color_contorno = (0, 255, 0)
color_ymin = (0, 130, 255)
color_fingers = (0, 255, 255)

tamX = 200
tamY = 200

while True:
    ret, frame = cap.read()
    if ret == False:
        break

    # Redimensionar la imagen para que tenga un ancho de 640
    frame = imutils.resize(frame, width=640)
    frame = cv2.flip(frame, 1)
    frameAux = frame.copy()

    cv2.rectangle(
        frame,
        (p1[0] - tamX, p1[1] - tamY),
        (p1[0] + tamX, p1[1] + tamY),
        color=(255, 0, 0),
        thickness=1,
    )

    yi = p1[1] - tamY
    yf = p1[1] + tamY
    xi = p1[0] - tamX
    xf = p1[0] + tamX

    if yi < 0:
        yi = 0
    if yf > frame.shape[0]:
        yf = frame.shape[0]
    if xi < 0:
        xi = 0
    if xf > frame.shape[1]:
        xf = frame.shape[1]

    ROI = frame[yi:yf, xi:xf]

    if bg is not None:
        grayROI = cv2.cvtColor(ROI, cv2.COLOR_BGR2GRAY)
        # Determinar la imagen binaria (background vs foreground)
        dif = cv2.absdiff(grayROI, bg)
        _, th = cv2.threshold(dif, 0, 255, cv2.THRESH_BINARY + cv2.THRESH_OTSU)
        th = cv2.medianBlur(th, 3)

        cv2.imshow("th", th)

        # Encontrando los contornos de la imagen binaria
        cnts, _ = cv2.findContours(th, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
        cnts = sorted(cnts, key=cv2.contourArea, reverse=True)[:1]
        for cnt in cnts:

            # Encontrar el centro del contorno
            M = cv2.moments(cnt)
            if M["m00"] == 0:
                M["m00"] = 1
            x = int(M["m10"] / M["m00"])
            y = int(M["m01"] / M["m00"])
            cv2.circle(ROI, tuple([x, y]), 5, (0, 255, 0), -1)

            # Punto más alto del contorno
            ymin = cnt.min(axis=1)
            cv2.circle(ROI, tuple(ymin[0]), 5, color_ymin, -1)

            # Contorno encontrado a través de cv2.convexHull
            hull1 = cv2.convexHull(cnt)
            cv2.drawContours(ROI, [hull1], 0, color_contorno, 2)

            cv2.imshow("ctns", ROI)

            # Defectos convexos
            hull2 = cv2.convexHull(cnt, returnPoints=False)
            defects = cv2.convexityDefects(cnt, hull2)

            # Seguimos con la condición si es que existen defectos convexos
            if defects is not None:
                inicio = (
                    []
                )  # Contenedor en donde se almacenarán los puntos iniciales de los defectos convexos
                fin = (
                    []
                )  # Contenedor en donde se almacenarán los puntos finales de los defectos convexos
                fingers = 0  # Contador para el número de dedos levantados
                for i in range(defects.shape[0]):
                    s, e, f, d = defects[i, 0]
                    start = cnt[s][0]
                    end = cnt[e][0]
                    far = cnt[f][0]

                    # Encontrar el triángulo asociado a cada defecto convexo para determinar ángulo
                    a = np.linalg.norm(far - end)
                    b = np.linalg.norm(far - start)
                    c = np.linalg.norm(start - end)

                    angulo = np.arccos(
                        (np.power(a, 2) + np.power(b, 2) - np.power(c, 2)) / (2 * a * b)
                    )
                    angulo = np.degrees(angulo)
                    angulo = int(angulo)

                    # Se descartarán los defectos convexos encontrados de acuerdo a la distnacia
                    # entre los puntos inicial, final y más alelago, por el ángulo y d
                    if np.linalg.norm(start - end) > 20 and angulo < 90 and d > 12000:

                        # Almacenamos todos los puntos iniciales y finales que han sido
                        # obtenidos
                        inicio.append(start)
                        fin.append(end)

                        # Visualización de distintos datos obtenidos
                        cv2.circle(ROI, tuple(start), 5, color_start, 2)
                        cv2.circle(ROI, tuple(end), 5, color_end, 2)
                        cv2.circle(ROI, tuple(far), 7, color_far, -1)

                # Si no se han almacenado puntos de inicio (o fin), puede tratarse de
                # 0 dedos levantados o 1 dedo levantado
                if len(inicio) == 0:
                    minY = np.linalg.norm(ymin[0] - [x, y])
                    if minY >= 110:
                        fingers = fingers + 1
                        cv2.putText(
                            ROI,
                            "{}".format(fingers),
                            tuple(ymin[0]),
                            1,
                            1.7,
                            (color_fingers),
                            1,
                            cv2.LINE_AA,
                        )

                # Si se han almacenado puntos de inicio, se contará el número de dedos levantados
                for i in range(len(inicio)):
                    fingers = fingers + 1
                    cv2.putText(
                        ROI,
                        "{}".format(fingers),
                        tuple(inicio[i]),
                        1,
                        1.7,
                        (color_fingers),
                        1,
                        cv2.LINE_AA,
                    )
                    if i == len(inicio) - 1:
                        fingers = fingers + 1
                        cv2.putText(
                            ROI,
                            "{}".format(fingers),
                            tuple(fin[i]),
                            1,
                            1.7,
                            (color_fingers),
                            1,
                            cv2.LINE_AA,
                        )

                # Se visualiza el número de dedos levantados en el rectángulo izquierdo
                cv2.putText(
                    frame,
                    "{}".format(fingers),
                    (390, 45),
                    1,
                    4,
                    (color_fingers),
                    2,
                    cv2.LINE_AA,
                )

    cv2.imshow("Frame", frame)
    k = cv2.waitKey(1)
    if k & 0xFF == ord("i"):
        bg = cv2.cvtColor(frameAux, cv2.COLOR_BGR2GRAY)
        bg = bg[yi:yf, xi:xf]
    elif k & 0xFF == ord("q"):
        break
