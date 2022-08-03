# !usr/bin/env python3


from pathlib import Path
import numpy as np
from typing import List


class SceneMap:

    def __init__(self) -> None:
        self.nodes = np.empty((0, 2))
        self.lanes = []
        self.graph = np.empty((0, 0))

    def load(self, load_path: Path) -> None:
        pass

    def save(self, save_path: Path) -> None:
        pass

    def lane_points(self, lane_index: int) -> np.ndarray:
        pass

    def accessable_lanes(self, node_index: int) -> List(int):
        pass

    def nearest_node(self, position: np.ndarray) -> int:
        pass
