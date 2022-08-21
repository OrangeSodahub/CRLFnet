def draw_pr_line():
    import numpy as np
    import matplotlib.pyplot as plt
    txt_dir = '/home/zonlin/CRLFnet/src/site_model/src/LidCamFusion/eval//20220820-110456/tp_fp_fn.txt'
    tp_fp_fn = np.loadtxt(txt_dir)
    precision = tp_fp_fn[0] / (tp_fp_fn[0] + tp_fp_fn[1])
    recall = tp_fp_fn[0] / (tp_fp_fn[0] + tp_fp_fn[2])

    thresholds = np.linspace(0.0, 1.0, num=41, endpoint=True)

    plt.plot(thresholds, recall)
    plt.show()