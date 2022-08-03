import cv2
import numpy as np
import os


base_image_path = '/home/zzy/CRLFnet/src/site_model/src/utils/visual/scene_base.png'
output_path = '/home/zzy/CRLFnet/src/site_model/output/Scene'

STEP = 0.1

lanes = []
nodes = []

tmp_x = []
tmp_y = []
tmp_d = []


def p2w(x: int, y: int) -> tuple:
    xw = 2 - y / 200
    yw = 3 - x / 200
    return xw, yw


def w2p(xw: float, yw: float) -> tuple:
    x = 600 - int(200 * yw)
    y = 400 - int(200 * xw)
    return x, y


def add_lane(x, y, d) -> None:
    global STEP
    
    ts = np.arange(d[0], d[-1] + STEP, STEP)
    xs = np.interp(ts, d, x)
    ys = np.interp(ts, d, y)
    lane = np.concatenate([[xs], [ys]]).T
    lanes.append(lane)
    tmp_x.clear()
    tmp_y.clear()
    tmp_d.clear()


def draw_image(image: cv2.Mat) -> None:
    for n in nodes:
        cv2.circle(image, w2p(*n), 5, (0, 0, 255), thickness=-1)
    for l in lanes:
        for p in l:
            cv2.circle(image, w2p(p[0], p[1]), 3, (255, 0, 0), thickness=-1)
    for x, y in zip(tmp_x, tmp_y):
        cv2.circle(image, w2p(x, y), 4, (0, 255, 0), thickness=-1)


def mouse_event(event, x, y, flags, param) -> None:
    global nodes, lanes, drawing_flag, tmp_x, tmp_y, tmp_d

    drawing_flag = len(tmp_x) != 0

    image_copy = base_image.copy()

    if event == cv2.EVENT_LBUTTONDOWN:
        xw, yw = p2w(x, y)
        if drawing_flag:
            wx1, wy1 = tmp_x[-1], tmp_y[-1]
            delta = np.sqrt(np.square(wx1 - xw) + np.square(wy1 - yw))
            tmp_d.append(tmp_d[-1] + delta)
        else:
            tmp_d.append(0)
        tmp_x.append(xw)
        tmp_y.append(yw)
        
    if event == cv2.EVENT_RBUTTONDOWN:
        if drawing_flag:
            try:
                tmp_x.pop()
                tmp_y.pop()
                tmp_d.pop()
            except IndexError:
                print("There is no point in this lane.")
        else:
            try:
                lanes.pop()
            except IndexError:
                print("There is no lane in this scene.")

    if event == cv2.EVENT_MBUTTONDOWN:
        if drawing_flag:
            add_lane(tmp_x, tmp_y, tmp_d)
            print("Added a new lane.")
        else:
            nodes.append(p2w(x, y))
            print("Added a new node.")
    
    draw_image(image_copy)
    cv2.imshow("map", image_copy)


if __name__ == "__main__":
    base_image = cv2.imread(base_image_path)
    cv2.namedWindow("map")
    cv2.setMouseCallback("map", mouse_event)
    cv2.imshow("map", base_image)
    cv2.waitKey(0)

    # draw image
    draw_image(base_image)
    cv2.imwrite(os.path.join(output_path, "output.png"), base_image)
    # save lanes
    for i in range(len(lanes)):
        np.savetxt(os.path.join(output_path, "{}.txt".format(i)), lanes[i])
    # save nodes
    data = np.array(nodes)
    np.savetxt(os.path.join(output_path, "nodes.txt"), data)
