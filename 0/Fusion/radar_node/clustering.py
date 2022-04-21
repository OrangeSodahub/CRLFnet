import numpy as np
import matplotlib.pyplot as plt
from sklearn import cluster
import time

def clusters(ti_radar_array, filtering=0):
    """
    filtering: heaviness of points rejection
    """
    start = time.time()
    PCXYR = ti_radar_array[:,(1,0,3)] #throw away Z axis

    centroids, labels, _ = cluster.k_means(PCXYR[:,0:2], 10)
    
    clusters = np.array([PCXYR[labels == l] for l in np.unique(labels)])

    #calculate masses (sum of reflectiviies in each bin)
    masses = np.bincount(labels, weights=PCXYR[:,2])

    #estimated size (std. dev. of the point cloud)
    print(clusters[0][:,1])
    sizes = np.fromiter( ( np.sqrt(np.std(pc[:,1]) + np.std(pc[:,0])) for pc in clusters) , dtype=np.float)
    sizesxy =  np.array([ [np.std(pc[:,1]), np.std(pc[:,0])] for pc in clusters])
    #point count in a cluster
    clusters_point_count = np.fromiter( (len(pc) for pc in clusters), dtype=np.int) 

    #filter out single points (if there's just one point, stdev will be 0).
    no_single_detection_mask = sizes != 0 

    #basically at least 1 point per meter 
    not_too_sparse_mask = sizes < clusters_point_count

    #create combined mask and apply to the returned arrays
    combined_mask = np.logical_and(not_too_sparse_mask, no_single_detection_mask)

    #TODO: Ideally that would be a custom numpy datatype with a custom ros message.
    #Like here: https://docs.scipy.org/doc/numpy-1.13.0/reference/arrays.dtypes.html
    #For now I just dump it to string and then deserialize it

    data = {
        'no_clusters': int(np.sum(combined_mask==True)),
        'centroids': centroids[combined_mask],
        'masses': masses[combined_mask],
        'sizes': sizes[combined_mask],
        'clusters': clusters[combined_mask],
        'sizesxy': sizesxy[combined_mask]
    }

    print("Clustering inference time", time.time()-start)

    return data