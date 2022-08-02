import cv2
import numpy as np
img = cv2.imread('/home/zonlin/0.png')
a =[]
b = []
def on_EVENT_LBUTTONDOWN(event, x, y,flags, param):
    if event == cv2.EVENT_LBUTTONDOWN:
        xy = "%d,%d" % (x, y)
        a.append(x)
        b.append(y)
        print(2-y/200, 3-x/200)
        cv2.circle(img, (x, y), 1, (0, 0, 255), thickness=-1)
        cv2.imshow("image", img)
 
cv2.namedWindow("image")
cv2.setMouseCallback("image", on_EVENT_LBUTTONDOWN)
cv2.imshow("image", img)
cv2.waitKey(0)