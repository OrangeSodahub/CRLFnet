# time,field.header.seq,field.header.stamp,field.header.frame_id,field.child_frame_id,field.pose.pose.position.x,field.pose.pose.position.y,field.pose.pose.position.z,field.pose.pose.orientation.x,field.pose.pose.orientation.y,field.pose.pose.orientation.z,field.pose.pose.orientation.w,field.pose.covariance0,field.pose.covariance1,field.pose.covariance2,field.pose.covariance3,field.pose.covariance4,field.pose.covariance5,field.pose.covariance6,field.pose.covariance7,field.pose.covariance8,field.pose.covariance9,field.pose.covariance10,field.pose.covariance11,field.pose.covariance12,field.pose.covariance13,field.pose.covariance14,field.pose.covariance15,field.pose.covariance16,field.pose.covariance17,field.pose.covariance18,field.pose.covariance19,field.pose.covariance20,field.pose.covariance21,field.pose.covariance22,field.pose.covariance23,field.pose.covariance24,field.pose.covariance25,field.pose.covariance26,field.pose.covariance27,field.pose.covariance28,field.pose.covariance29,field.pose.covariance30,field.pose.covariance31,field.pose.covariance32,field.pose.covariance33,field.pose.covariance34,field.pose.covariance35,field.twist.twist.linear.x,field.twist.twist.linear.y,field.twist.twist.linear.z,field.twist.twist.angular.x,field.twist.twist.angular.y,field.twist.twist.angular.z,field.twist.covariance0,field.twist.covariance1,field.twist.covariance2,field.twist.covariance3,field.twist.covariance4,field.twist.covariance5,field.twist.covariance6,field.twist.covariance7,field.twist.covariance8,field.twist.covariance9,field.twist.covariance10,field.twist.covariance11,field.twist.covariance12,field.twist.covariance13,field.twist.covariance14,field.twist.covariance15,field.twist.covariance16,field.twist.covariance17,field.twist.covariance18,field.twist.covariance19,field.twist.covariance20,field.twist.covariance21,field.twist.covariance22,field.twist.covariance23,field.twist.covariance24,field.twist.covariance25,field.twist.covariance26,field.twist.covariance27,field.twist.covariance28,field.twist.covariance29,field.twist.covariance30,field.twist.covariance31,field.twist.covariance32,field.twist.covariance33,field.twist.covariance34,field.twist.covariance35
# B 3995 C 3469
import codecs
import math
from matplotlib import pyplot as plt
import numpy as np
from scipy.interpolate import make_interp_spline

count = 0
f_A1 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/A1.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_A2 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/A2.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_A3 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/A3.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_A4 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/A4.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取

f_B1 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/B1.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_B2 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/B2.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_B3 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/B3.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_B4 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/B4.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取

f_C1 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/C1.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_C2 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/C2.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_C3 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/C3.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_C4 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/C4.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取
f_C5 = codecs.open('D:/CourseMaterials/IPP/CRLFnet/src/site_model/src/dispatch/rosbag/C5.txt', mode='r', encoding='utf-8')  # 打开txt文件，以‘utf-8’编码读取

lines_A1 = f_A1.readlines()
lines_A2 = f_A2.readlines()
lines_A3 = f_A3.readlines()
lines_A4 = f_A4.readlines()

lines_B1 = f_B1.readlines()
lines_B2 = f_B2.readlines()
lines_B3 = f_B3.readlines()
lines_B4 = f_B4.readlines()

lines_C1 = f_C1.readlines()
lines_C2 = f_C2.readlines()
lines_C3 = f_C3.readlines()
lines_C4 = f_C4.readlines()
lines_C5 = f_C5.readlines()

time = []
time_tmp = 0
time_tmp_pre = 0

intersection = [-1.7,3, 1.7,3, -1.7,0, 1.7,0, 0]
overhead = [0,0, 0,0, 0,0, 0,0, 0.1]
circle = [-1.7,0, 1.7,0, -1.7,-3, 1.7,-3, 0] # xy, xy, xy, xy, z

dense_intersection = []
dense_overhead = []
dense_circle = []

for line in range(len(lines_A1)):
    line_split_A1 = lines_A1[line].split(',')
    line_split_A2 = lines_A2[line].split(',')
    line_split_A3 = lines_A3[line].split(',')
    line_split_A4 = lines_A4[line].split(',')

    line_split_B1 = lines_B1[line].split(',')
    line_split_B2 = lines_B2[line].split(',')
    line_split_B3 = lines_B3[line].split(',')
    line_split_B4 = lines_B4[line].split(',')

    line_split_C1 = lines_C1[line].split(',')
    line_split_C2 = lines_C2[line].split(',')
    line_split_C3 = lines_C3[line].split(',')
    line_split_C4 = lines_C4[line].split(',')
    line_split_C5 = lines_C5[line].split(',')

    decimal = round(math.modf(int(line_split_A1[0])/1e9)[0],3)
    time_tmp = int(int(line_split_A1[0])/1e9)
    if time_tmp != time_tmp_pre:
        count = count + 1
    time_tmp_pre = time_tmp
    time.append(count+decimal)

    circle_count = 0
    intersection_count = 0
    overhead_count = 0
    #-------------------------------------------------- A ----------------------------------------------#
    # dense_circle
    if float(line_split_A1[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_A1[5])>=intersection[0] and float(line_split_A1[6])<=intersection[1]) and \
         (float(line_split_A1[5])<=intersection[2] and float(line_split_A1[6])<=intersection[3]) and \
         (float(line_split_A1[5])>=intersection[4] and float(line_split_A1[6])>=intersection[5]) and \
         (float(line_split_A1[5])<=intersection[6] and float(line_split_A1[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_A1[5])>=circle[0] and float(line_split_A1[6])<=circle[1]) and \
         (float(line_split_A1[5])<=circle[2] and float(line_split_A1[6])<=circle[3]) and \
         (float(line_split_A1[5])>=circle[4] and float(line_split_A1[6])>=circle[5]) and \
         (float(line_split_A1[5])<=circle[6] and float(line_split_A1[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_circle
    if float(line_split_A2[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_A2[5])>=intersection[0] and float(line_split_A2[6])<=intersection[1]) and \
         (float(line_split_A2[5])<=intersection[2] and float(line_split_A2[6])<=intersection[3]) and \
         (float(line_split_A2[5])>=intersection[4] and float(line_split_A2[6])>=intersection[5]) and \
         (float(line_split_A2[5])<=intersection[6] and float(line_split_A2[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_A2[5])>=circle[0] and float(line_split_A2[6])<=circle[1]) and \
         (float(line_split_A2[5])<=circle[2] and float(line_split_A2[6])<=circle[3]) and \
         (float(line_split_A2[5])>=circle[4] and float(line_split_A2[6])>=circle[5]) and \
         (float(line_split_A2[5])<=circle[6] and float(line_split_A2[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_circle
    if float(line_split_A3[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_A3[5])>=intersection[0] and float(line_split_A3[6])<=intersection[1]) and \
         (float(line_split_A3[5])<=intersection[2] and float(line_split_A3[6])<=intersection[3]) and \
         (float(line_split_A3[5])>=intersection[4] and float(line_split_A3[6])>=intersection[5]) and \
         (float(line_split_A3[5])<=intersection[6] and float(line_split_A3[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_A3[5])>=circle[0] and float(line_split_A3[6])<=circle[1]) and \
         (float(line_split_A3[5])<=circle[2] and float(line_split_A3[6])<=circle[3]) and \
         (float(line_split_A3[5])>=circle[4] and float(line_split_A3[6])>=circle[5]) and \
         (float(line_split_A3[5])<=circle[6] and float(line_split_A3[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_circle
    if float(line_split_A4[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_A4[5])>=intersection[0] and float(line_split_A4[6])<=intersection[1]) and \
         (float(line_split_A4[5])<=intersection[2] and float(line_split_A4[6])<=intersection[3]) and \
         (float(line_split_A4[5])>=intersection[4] and float(line_split_A4[6])>=intersection[5]) and \
         (float(line_split_A4[5])<=intersection[6] and float(line_split_A4[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_A4[5])>=circle[0] and float(line_split_A4[6])<=circle[1]) and \
         (float(line_split_A4[5])<=circle[2] and float(line_split_A4[6])<=circle[3]) and \
         (float(line_split_A4[5])>=circle[4] and float(line_split_A4[6])>=circle[5]) and \
         (float(line_split_A4[5])<=circle[6] and float(line_split_A4[6])>=circle[7]):
         circle_count = circle_count + 1

    #-------------------------------------------------- B ----------------------------------------------#
    # dense_overhead
    if float(line_split_B1[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_B1[5])>=intersection[0] and float(line_split_B1[6])<=intersection[1]) and \
         (float(line_split_B1[5])<=intersection[2] and float(line_split_B1[6])<=intersection[3]) and \
         (float(line_split_B1[5])>=intersection[4] and float(line_split_B1[6])>=intersection[5]) and \
         (float(line_split_B1[5])<=intersection[6] and float(line_split_B1[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_B1[5])>=circle[0] and float(line_split_B1[6])<=circle[1]) and \
         (float(line_split_B1[5])<=circle[2] and float(line_split_B1[6])<=circle[3]) and \
         (float(line_split_B1[5])>=circle[4] and float(line_split_B1[6])>=circle[5]) and \
         (float(line_split_B1[5])<=circle[6] and float(line_split_B1[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_B2[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_B2[5])>=intersection[0] and float(line_split_B2[6])<=intersection[1]) and \
         (float(line_split_B2[5])<=intersection[2] and float(line_split_B2[6])<=intersection[3]) and \
         (float(line_split_B2[5])>=intersection[4] and float(line_split_B2[6])>=intersection[5]) and \
         (float(line_split_B2[5])<=intersection[6] and float(line_split_B2[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_B2[5])>=circle[0] and float(line_split_B2[6])<=circle[1]) and \
         (float(line_split_B2[5])<=circle[2] and float(line_split_B2[6])<=circle[3]) and \
         (float(line_split_B2[5])>=circle[4] and float(line_split_B2[6])>=circle[5]) and \
         (float(line_split_B2[5])<=circle[6] and float(line_split_B2[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_B3[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_B3[5])>=intersection[0] and float(line_split_B3[6])<=intersection[1]) and \
         (float(line_split_B3[5])<=intersection[2] and float(line_split_B3[6])<=intersection[3]) and \
         (float(line_split_B3[5])>=intersection[4] and float(line_split_B3[6])>=intersection[5]) and \
         (float(line_split_B3[5])<=intersection[6] and float(line_split_B3[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_B3[5])>=circle[0] and float(line_split_B3[6])<=circle[1]) and \
         (float(line_split_B3[5])<=circle[2] and float(line_split_B3[6])<=circle[3]) and \
         (float(line_split_B3[5])>=circle[4] and float(line_split_B3[6])>=circle[5]) and \
         (float(line_split_B3[5])<=circle[6] and float(line_split_B3[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_B4[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_B4[5])>=intersection[0] and float(line_split_B4[6])<=intersection[1]) and \
         (float(line_split_B4[5])<=intersection[2] and float(line_split_B4[6])<=intersection[3]) and \
         (float(line_split_B4[5])>=intersection[4] and float(line_split_B4[6])>=intersection[5]) and \
         (float(line_split_B4[5])<=intersection[6] and float(line_split_B4[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_B4[5])>=circle[0] and float(line_split_B4[6])<=circle[1]) and \
         (float(line_split_B4[5])<=circle[2] and float(line_split_B4[6])<=circle[3]) and \
         (float(line_split_B4[5])>=circle[4] and float(line_split_B4[6])>=circle[5]) and \
         (float(line_split_B4[5])<=circle[6] and float(line_split_B4[6])>=circle[7]):
         circle_count = circle_count + 1

    #-------------------------------------------------- C ----------------------------------------------#
    # dense_overhead
    if float(line_split_C1[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_C1[5])>=intersection[0] and float(line_split_C1[6])<=intersection[1]) and \
         (float(line_split_C1[5])<=intersection[2] and float(line_split_C1[6])<=intersection[3]) and \
         (float(line_split_C1[5])>=intersection[4] and float(line_split_C1[6])>=intersection[5]) and \
         (float(line_split_C1[5])<=intersection[6] and float(line_split_C1[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_C1[5])>=circle[0] and float(line_split_C1[6])<=circle[1]) and \
         (float(line_split_C1[5])<=circle[2] and float(line_split_C1[6])<=circle[3]) and \
         (float(line_split_C1[5])>=circle[4] and float(line_split_C1[6])>=circle[5]) and \
         (float(line_split_C1[5])<=circle[6] and float(line_split_C1[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_C2[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_C2[5])>=intersection[0] and float(line_split_C2[6])<=intersection[1]) and \
         (float(line_split_C2[5])<=intersection[2] and float(line_split_C2[6])<=intersection[3]) and \
         (float(line_split_C2[5])>=intersection[4] and float(line_split_C2[6])>=intersection[5]) and \
         (float(line_split_C2[5])<=intersection[6] and float(line_split_C2[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_C2[5])>=circle[0] and float(line_split_C2[6])<=circle[1]) and \
         (float(line_split_C2[5])<=circle[2] and float(line_split_C2[6])<=circle[3]) and \
         (float(line_split_C2[5])>=circle[4] and float(line_split_C2[6])>=circle[5]) and \
         (float(line_split_C2[5])<=circle[6] and float(line_split_C2[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_C3[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_C3[5])>=intersection[0] and float(line_split_C3[6])<=intersection[1]) and \
         (float(line_split_C3[5])<=intersection[2] and float(line_split_C3[6])<=intersection[3]) and \
         (float(line_split_C3[5])>=intersection[4] and float(line_split_C3[6])>=intersection[5]) and \
         (float(line_split_C3[5])<=intersection[6] and float(line_split_C3[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_C3[5])>=circle[0] and float(line_split_C3[6])<=circle[1]) and \
         (float(line_split_C3[5])<=circle[2] and float(line_split_C3[6])<=circle[3]) and \
         (float(line_split_C3[5])>=circle[4] and float(line_split_C3[6])>=circle[5]) and \
         (float(line_split_C3[5])<=circle[6] and float(line_split_C3[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_C4[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_C4[5])>=intersection[0] and float(line_split_C4[6])<=intersection[1]) and \
         (float(line_split_C4[5])<=intersection[2] and float(line_split_C4[6])<=intersection[3]) and \
         (float(line_split_C4[5])>=intersection[4] and float(line_split_C4[6])>=intersection[5]) and \
         (float(line_split_C4[5])<=intersection[6] and float(line_split_C4[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_C4[5])>=circle[0] and float(line_split_C4[6])<=circle[1]) and \
         (float(line_split_C4[5])<=circle[2] and float(line_split_C4[6])<=circle[3]) and \
         (float(line_split_C4[5])>=circle[4] and float(line_split_C4[6])>=circle[5]) and \
         (float(line_split_C4[5])<=circle[6] and float(line_split_C4[6])>=circle[7]):
         circle_count = circle_count + 1

    # dense_overhead
    if float(line_split_C5[7]) >= overhead[8]:
        overhead_count = overhead_count + 1
    # dense_intersection
    elif (float(line_split_C5[5])>=intersection[0] and float(line_split_C5[6])<=intersection[1]) and \
         (float(line_split_C5[5])<=intersection[2] and float(line_split_C5[6])<=intersection[3]) and \
         (float(line_split_C5[5])>=intersection[4] and float(line_split_C5[6])>=intersection[5]) and \
         (float(line_split_C5[5])<=intersection[6] and float(line_split_C5[6])>=intersection[7]):
         intersection_count = intersection_count + 1
    # dense_circle
    elif (float(line_split_C5[5])>=circle[0] and float(line_split_C5[6])<=circle[1]) and \
         (float(line_split_C5[5])<=circle[2] and float(line_split_C5[6])<=circle[3]) and \
         (float(line_split_C5[5])>=circle[4] and float(line_split_C5[6])>=circle[5]) and \
         (float(line_split_C5[5])<=circle[6] and float(line_split_C5[6])>=circle[7]):
         circle_count = circle_count + 1

    dense_circle.append(circle_count)
    dense_intersection.append(intersection_count)
    dense_overhead.append(overhead_count)
f_A1.close()
f_A2.close()
f_A3.close()
f_A4.close()

f_B1.close()
f_B2.close()
f_B3.close()
f_B4.close()

f_C1.close()
f_C2.close()
f_C3.close()
f_C4.close()
f_C5.close()

fit_circle = np.polyfit(time, dense_circle, 120)
fit_intersection = np.polyfit(time, dense_intersection, 120)
fit_overhead = np.polyfit(time, dense_overhead, 120)

equation_circle = np.poly1d(fit_circle)
equation_intersection = np.poly1d(fit_intersection)
equation_overhead = np.poly1d(fit_overhead)

vals_circle = equation_circle(time)
vals_intersection = equation_intersection(time)
vals_overhead = equation_overhead(time)

# 去重
time_tmp = 0
for i in range(len(time)):
    if time[i] == time_tmp:
        time[i] = time[i] + 0.001
    time_tmp = time[i]

plt.title("Density of vehicles of agents")
# plt.scatter(time, dense_circle, s=0.1)
# plt.scatter(time, dense_intersection, s=0.1)
# plt.scatter(time, dense_overhead, s=0.1)
plt.plot(time, vals_circle, label='agent_circle')
plt.plot(time, vals_intersection, label='agent_intersection')
plt.plot(time, vals_overhead, label='agent_overhead')
plt.ylabel("density")
plt.xlabel("t(s)")
plt.ylim(0, 20)
plt.legend()
plt.show()