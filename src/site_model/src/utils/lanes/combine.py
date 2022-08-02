import numpy as np

def main():
    lanes = []
    file = "/home/zonlin/CRLFnet/src/site_model/src/utils/lanes/"
    for i in range(6):
        lane = np.loadtxt(file+"origin/"+str(i)+".txt", dtype=np.float64)
        lanes.append(lane)
    print(lanes)
        
if __name__=="__main__":
    main()