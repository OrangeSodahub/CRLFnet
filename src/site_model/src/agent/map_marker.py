import cv2
import numpy as np
import os

base_image_path = '/home/zzy/CRLFnet/src/site_model/src/utils/visual/scene_base.png'
output_path = '/home/zzy/CRLFnet/src/site_model/output/Scene/map_test'

STEP = 0.1

mode = 'node'

lanes = []
nodes = []
graph = []

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


def add_lane() -> None:
    global STEP, tmp_x, tmp_y, tmp_d, lanes, graph
    idx = len(lanes)

    ts = np.arange(tmp_d[0], tmp_d[-1] + STEP, STEP)
    xs = np.interp(ts, tmp_d, tmp_x)
    ys = np.interp(ts, tmp_d, tmp_y)
    tmp_x.clear()
    tmp_y.clear()
    tmp_d.clear()

    lane = np.concatenate([[xs], [ys]]).T
    start_index = np.argmin(np.linalg.norm(nodes - lane[0], axis=1))
    end_index = np.argmin(np.linalg.norm(nodes - lane[-1], axis=1))
    if start_index == end_index:
        print("You can make a lane start from and end to the same point.")
        return
    lane_vec = np.zeros(len(nodes), dtype=int)
    lane_vec[start_index] = -1
    lane_vec[end_index] = 1
    lanes.append(lane)
    graph.append(lane_vec)
    print("Added lane #{0} from node #{1} to node #{2}.".format(idx, start_index, end_index))


def draw_image(image: cv2.Mat) -> None:
    # draw nodes
    for x, y in nodes:
        cv2.circle(image, w2p(x, y), 5, (0, 0, 255), thickness=-1)
    # draw lanes
    for lane in lanes:
        for p in lane:
            cv2.circle(image, w2p(p[0], p[1]), 3, (255, 0, 0), thickness=-1)
    for x, y in zip(tmp_x, tmp_y):
        cv2.circle(image, w2p(x, y), 3, (0, 255, 0), thickness=-1)
    # draw arrows
    for node_idx in range(len(nodes)):
        for lane_idx in range(len(lanes)):
            c = graph[lane_idx][node_idx]
            if c == 1:
                from_point = w2p(*lanes[lane_idx][-1])
                to_point = w2p(*nodes[node_idx])
                cv2.arrowedLine(image, from_point, to_point, (0, 255, 255), thickness=2)
            elif c == -1:
                from_point = w2p(*nodes[node_idx])
                to_point = w2p(*lanes[lane_idx][0])
                cv2.arrowedLine(image, from_point, to_point, (255, 255, 0), thickness=2)
    # draw text
    for node_idx in range(len(nodes)):
        cv2.putText(image, str(node_idx), w2p(*nodes[node_idx]), cv2.FONT_HERSHEY_PLAIN, 3, (127, 0, 256), 2)
    for lane_idx in range(len(lanes)):
        cv2.putText(image, str(lane_idx), w2p(*lanes[lane_idx][0]), cv2.FONT_HERSHEY_PLAIN, 2, (0, 127, 256), 2)
        cv2.putText(image, str(lane_idx), w2p(*lanes[lane_idx][-1]), cv2.FONT_HERSHEY_PLAIN, 2, (0, 127, 256), 2)


def node_mode(event, x, y) -> None:
    global nodes, mode

    if event == cv2.EVENT_LBUTTONDOWN:
        idx = len(nodes)
        nodes.append(p2w(x, y))
        print("Added node #{0} at ({1[0]}, {1[1]}).".format(idx, nodes[idx]))
    if event == cv2.EVENT_RBUTTONDOWN:
        try:
            nodes.pop()
        except IndexError:
            print("There is no node in this scene.")
    if event == cv2.EVENT_MBUTTONDOWN:
        if len(nodes) < 2:
            print("There are not enough nodes in the scene.")
        else:
            nodes = np.array(nodes)
            mode = 'lane'
            print("Switched to the lane mode. There are {} nodes in the scene".format(len(nodes)))

    image_copy = base_image.copy()
    draw_image(image_copy)
    cv2.imshow("map", image_copy)


def lane_mode(event, x, y) -> None:
    global lanes, tmp_x, tmp_y, tmp_d

    drawing_flag = len(tmp_x) != 0

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
                graph.pop()
            except IndexError:
                print("There is no lane in this scene.")
    if event == cv2.EVENT_MBUTTONDOWN:
        if drawing_flag:
            add_lane()

    image_copy = base_image.copy()
    draw_image(image_copy)
    cv2.imshow("map", image_copy)


def mouse_event(event, x, y, flags, param) -> None:
    if mode == 'node':
        node_mode(event, x, y)
    elif mode == 'lane':
        lane_mode(event, x, y)
    else:
        print('Unknown mode!')
        exit(1)


if __name__ == "__main__":

    print("""How To Use The Map Marker
1. Node Mode:
    L Button: Add a node
    R Button: Delete the last node
    M Buttom: Switch to lane mode
    * When all nodes are placed, you can switch to lane mode.
2. Lane Mode
    L Button: Create a new lane / Add a new anchor point
    R Button: Delete the last lane / Delete the last anchor point
    M Button: Finish a lane and generate lane points
    * The lanes are one-way, the first point will be the start and the last one will be the end.
    * The lanes will be connected to the nearest nodes automatically.
    * When all lanes are drawn, you can press 'ESC' to save data and exit.
** Remember to check the "base_image_path" and "output_path"!
""")

    base_image = cv2.imread(base_image_path)
    cv2.namedWindow("map")
    cv2.setMouseCallback("map", mouse_event)
    cv2.imshow("map", base_image)
    cv2.waitKey(0)

    # draw image
    try:
        os.mkdir(output_path)
    except FileExistsError:
        pass
    draw_image(base_image)
    cv2.imwrite(os.path.join(output_path, "scene_map.png"), base_image)
    # save lanes
    for i in range(len(lanes)):
        np.savetxt(os.path.join(output_path, "lane_{}.txt".format(i)), lanes[i])
    # save nodes
    data = np.array(nodes)
    np.savetxt(os.path.join(output_path, "nodes.txt"), data)
    # save graph
    data = np.array(graph, dtype=int).T
    np.savetxt(os.path.join(output_path, "graph.txt"), data, fmt='%d')
