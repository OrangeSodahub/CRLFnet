from pathlib import Path
from ..utils.evaluation import Evalagent
from ..utils.visualization import Visualvehicle

N = 10

if __name__ == '__main__':
    ROOT_DIR = Path(__file__).resolve().parents[2]
    DATA_FILE = ROOT_DIR.joinpath('src/agent/eval/')
    vis = Visualvehicle()
    evalagent = Evalagent(N, DATA_FILE, vis)
    evalagent.eval()
