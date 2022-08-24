# !usr/bin/env python3


from pathlib import Path
import numpy as np
from typing import Tuple


class SceneMap:

    def __init__(self, load_path: Path) -> None:
        self.nodes = np.empty((0, 2))
        self.lanes = []
        self.graph = np.empty((0, 0))
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

    def accessable_lanes(self, node_index: int, from_lane_index: int = -1) -> np.ndarray:
        ls = self.graph[node_index]
        if from_lane_index == -1:
            return np.nonzero(ls <= -1)[0]
        else:
            return np.nonzero(np.logical_and(ls <= -1, ls != ls[from_lane_index]))[0]

    def accessable_node(self, lane_index: int) -> int:
        ns = self.graph[:, lane_index]
        return np.nonzero(ns == 1)[0][0]

    def nearest_point(self, pos: np.ndarray) -> Tuple[int, int]:
        distances, point_indices = [], []
        for lane in self.lanes:
            ds = np.linalg.norm(lane - pos, axis=1)
            point_indices.append(np.argmin(ds))
            distances.append(np.min(ds))
        lane_idx = np.argmin(distances)
        point_idx = point_indices[lane_idx]
        return lane_idx, point_idx
