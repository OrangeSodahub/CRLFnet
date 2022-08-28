# !usr/bin/env python3

from pathlib import Path
import numpy as np
from typing import Tuple, List


class SceneMap:

    def __init__(self, load_path: Path) -> None:
        self.nodes = np.empty((0, 2))
        self.lanes = []
        self.graph = np.empty((0, 0))
        self.lane_in_area = np.empty(0)
        self.load(load_path)

    def load(self, load_path: Path) -> None:
        self.graph = np.loadtxt(str(load_path.joinpath("graph.txt")))
        self.check_graph()
        self.nodes = np.loadtxt(str(load_path.joinpath("nodes.txt")))
        if len(self.nodes) != self.graph.shape[0]:
            raise IOError("The numbers of nodes in \"nodes.txt\" and \"graph.txt\" differ.")
        for i in range(self.graph.shape[1]):
            lane = np.loadtxt(str(load_path.joinpath("lane_{}.txt".format(i))))
            self.lanes.append(lane)
        self.lane_in_area = np.loadtxt(str(load_path.joinpath("lane_in_area.txt")))
        if len(self.lane_in_area) != len(self.lanes):
            raise IOError("The numbers of lanes in \"lane_in_area.txt\" and \"graph.txt\" differ.")

    def check_graph(self) -> None:
        if not np.all(np.any(self.graph >= 1, axis=1)):
            raise IOError("A node in \"graph.txt\" has no entrance.")
        if not np.all(np.any(self.graph <= -1, axis=1)):
            raise IOError("A node in \"graph.txt\" has no exit.")
        """
        if not np.all(np.sum(self.graph, axis=0) == 0):
            raise IOError("A lane in \"graph.txt\" is illegal.")
        """

    def save(self, save_path: Path) -> None:
        print("You cannot save the map temporarily since the function is unfinished.")
        pass

    def accessible_lanes(self, node_index: int, from_lane_index: int = -1) -> np.ndarray:
        ls = self.graph[node_index]
        if from_lane_index == -1:
            return np.nonzero(ls <= -1)[0]
        else:
            return np.nonzero(np.logical_and(ls <= -1, ls != -ls[from_lane_index]))[0]

    def accessible_node(self, lane_index: int) -> int:
        ns = self.graph[:, lane_index]
        return np.nonzero(ns >= 1)[0][0]

    def nearest_point(self, pos: np.ndarray) -> Tuple[int, int]:
        distances, point_indices = [], []
        for lane in self.lanes:
            ds = np.linalg.norm(lane - pos, axis=1)
            point_indices.append(np.argmin(ds))
            distances.append(np.min(ds))
        lane_idx = np.argmin(distances)
        point_idx = point_indices[lane_idx]
        return lane_idx, point_idx


class DynamicMap(SceneMap):

    def __init__(self, load_path: Path) -> None:
        super().__init__(load_path)
        self.intersect_queues = [[] for _ in range(len(self.nodes))]

    def reach_intersect(self, vehicle, node_index: int) -> None:
        q = self.intersect_queues[node_index]
        q.append(vehicle)
        if len(q) > 1:
            vehicle.stop_flag = True

    def leave_intersect(self, vehicle, node_index: int) -> None:
        q = self.intersect_queues[node_index]
        q.remove(vehicle)
        if len(q) > 0:
            q[0].stop_flag = False

    def score_lanes(self, accessible_lanes: np.ndarray, num_lane: np.ndarray, num_area: np.ndarray) -> int:
        # TODO: improve coding
        def set_weight(orient, num_area):
            nums_index = np.argsort(num_area) + 1
            return (np.where(nums_index == orient)[0][0] + 1)

        # choose the accessible lanes
        num_lane = num_lane[accessible_lanes]

        lane_orient = [self.lane_in_area[lane] for lane in accessible_lanes]
        lane_weight = [set_weight(orient, num_area) for orient in lane_orient]
        lane_score = [a * b for a, b in zip(num_lane, lane_weight)]
        return accessible_lanes[np.where(lane_score == np.min(lane_score))[0][0]]
