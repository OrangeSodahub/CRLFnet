#!/usr/bin/env python3

import os
path = "/home/zonlin/CRLFnet/src/site_model/dataset/point_cloud_data/rename/"

# 获取该目录下所有文件，存入列表中
f = os.listdir(path)
print("获取",len(f),"个文件")

n = 0
i = 0
for i in f:
    # 设置旧文件名（就是路径+文件名）
    oldname = f[n]
    a = f[n][17:]
    # print("旧序号:",a[:-4])

    # 设置新文件名
    
    if len(f[n][17:]) == 8:
        newname = '00' + str(int(a[:-4])-1) + '.txt'
    if len(f[n][17:]) == 7:
        newname = '000' + str(int(a[:-4])-1) + '.txt'
    if len(f[n][17:]) == 6:
        newname = '0000' + str(int(a[:-4])-1) + '.txt'
    if len(f[n][17:]) == 5:
        newname = '00000' + str(int(a[:-4])-1) + '.txt'
    
    # print(oldname,'=====>',newname)

    # 对文件改名
    os.rename(path+oldname, path+newname)
    print(oldname, '======>', newname)

    n += 1
