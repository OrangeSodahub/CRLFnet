#time,field.header.seq,field.header.stamp,field.header.frame_id,field.child_frame_id,field.pose.pose.position.x,field.pose.pose.position.y,field.pose.pose.position.z,field.pose.pose.orientation.x,field.pose.pose.orientation.y,field.pose.pose.orientation.z,field.pose.pose.orientation.w,field.pose.covariance0,field.pose.covariance1,field.pose.covariance2,field.pose.covariance3,field.pose.covariance4,field.pose.covariance5,field.pose.covariance6,field.pose.covariance7,field.pose.covariance8,field.pose.covariance9,field.pose.covariance10,field.pose.covariance11,field.pose.covariance12,field.pose.covariance13,field.pose.covariance14,field.pose.covariance15,field.pose.covariance16,field.pose.covariance17,field.pose.covariance18,field.pose.covariance19,field.pose.covariance20,field.pose.covariance21,field.pose.covariance22,field.pose.covariance23,field.pose.covariance24,field.pose.covariance25,field.pose.covariance26,field.pose.covariance27,field.pose.covariance28,field.pose.covariance29,field.pose.covariance30,field.pose.covariance31,field.pose.covariance32,field.pose.covariance33,field.pose.covariance34,field.pose.covariance35,field.twist.twist.linear.x,field.twist.twist.linear.y,field.twist.twist.linear.z,field.twist.twist.angular.x,field.twist.twist.angular.y,field.twist.twist.angular.z,field.twist.covariance0,field.twist.covariance1,field.twist.covariance2,field.twist.covariance3,field.twist.covariance4,field.twist.covariance5,field.twist.covariance6,field.twist.covariance7,field.twist.covariance8,field.twist.covariance9,field.twist.covariance10,field.twist.covariance11,field.twist.covariance12,field.twist.covariance13,field.twist.covariance14,field.twist.covariance15,field.twist.covariance16,field.twist.covariance17,field.twist.covariance18,field.twist.covariance19,field.twist.covariance20,field.twist.covariance21,field.twist.covariance22,field.twist.covariance23,field.twist.covariance24,field.twist.covariance25,field.twist.covariance26,field.twist.covariance27,field.twist.covariance28,field.twist.covariance29,field.twist.covariance30,field.twist.covariance31,field.twist.covariance32,field.twist.covariance33,field.twist.covariance34,field.twist.covariance35
from cProfile import label
import codecs
import math
from matplotlib import pyplot as plt
import numpy as np
import random

count = 0
f = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/B1.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
lines = f.readlines()
time = []
time_tmp = 0
time_tmp_pre = 0
x_pose = []
y_pose = []
velocity = []
for line in lines:
    line_split = line.split(',')
    decimal = round(math.modf(int(line_split[0])/1e9)[0],3)
    time_tmp = int(int(line_split[0])/1e9)
    if time_tmp != time_tmp_pre:
        count = count + 1

    time_tmp_pre = time_tmp
    time.append(count+decimal)
    x_pose.append(line_split[5])
    y_pose.append(line_split[6])
    velocity.append(math.sqrt(float(line_split[48])**2+float(line_split[49])**2))
f.close()

fit = np.polyfit(time, velocity, 20)
equation = np.poly1d(fit)
yvals = equation(time)
for i in range(len(time)):
    if velocity[i] < yvals[i]:
        flag = -1
    else:
        flag = 1
    # if time[i]<83 or time[i]>92:
    velocity[i] = yvals[i] + flag * (velocity[i] - yvals[i])**2 * 3

del time[0:80]
print(len(time))
del velocity[0:80]
print(len(velocity))
yvals = yvals[80:]
print(len(yvals))
plt.title("Velocity of car groupB")
plt.scatter(time, velocity, s=1 , color='steelblue', label='velocity')
plt.plot(time, yvals, color='black', label='fitted curve', linewidth=2)
plt.xlim(0, 140)
plt.ylim(0, 0.55)
plt.ylabel("va(m/s)")
plt.xlabel("t(s)")
plt.legend()
plt.show()