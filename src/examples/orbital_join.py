import numpy as np
import random
import math
from matplotlib import pyplot as plt
from matplotlib import animation
#
fig = plt.figure()
# fig.set_dpi(100)

ax = plt.axes(xlim=(0, 20), ylim=(0, 20))


earth = plt.Circle((1, -1), 1.5, fc='b')
earth.center = (10.0,10.0)
e_x = 10.0
e_y = 10.0

sat_list = []
sat1 = plt.Circle((1, -1), 0.1, fc='r')
sat_list.append(sat1)
sat2 = plt.Circle((1, -1), 0.1, fc='g')
sat_list.append(sat2)
sat3 = plt.Circle((1, -1), 0.1, fc='y')
sat_list.append(sat3)

# (a_x,a_y),(v_x,v_y),(x,y)
sat_stats = []
sat_stats.append([(0.0,0.0),(0.0,0.0),(0.0,0.0)])
sat_stats.append([(0.0,0.0),(0.0,0.0),(0.0,0.0)])
sat_stats.append([(0.0,0.0),(0.0,0.0),(0.0,0.0)])

Const = 10.0
t = 0.001

def get_r(coord):
    x,y = coord
    r = math.sqrt((x-e_x)**2 + (y-e_y)**2)
    return r

def get_a(r,coord):
    x,y = coord
    mag = Const/r**2
    d_x = e_x - x
    d_y = e_y - y
    a_x = d_x/r * mag
    a_y = d_y/r * mag
    return (a_x,a_y)

def get_v(v,a):
    v_x,v_y = v
    a_x,a_y = a
    v_x += a_x*t
    v_y += a_y*t
    return (v_x,v_y)

def get_x(v,coord):
    v_x,v_y = v
    x,y = coord
    x += v_x*t
    y += v_y*t
    return (x,y)

# =========================
def init():
    ax.add_patch(earth)
    start = 6.0
    i = 0
    for s in sat_list:
        s.center = (start,10)
        ax.add_patch(s)
        r = get_r(s.center)
        a = get_a(r,s.center)
        v = get_v((0.00000006,0.0),a)
        #l = get_v(v,s.center)
        sat_stats[i][0] = a #(-1 * (Const/abs(e_y - start)**2),0.0)       # initial acceleration
        sat_stats[i][1] = v #(0.0, -1 * math.sqrt(Const/(e_y - start))) # initial velocity
        sat_stats[i][2] = (start, 10)
        start += 0.4
        i += 1
    return earth, sat_list[0], sat_list[1], sat_list[2]

def animate(i):
    # must happen tick
    i = 0
    for s in sat_list:
        # get calculate the update
        s_v = sat_stats[i][1]
        r = get_r(s.center)
        a = get_a(r,s.center)
        v = get_v(s_v,a)
        l = get_x(v,s.center)
        s.center = l
        # propogate the update
        sat_stats[i][0] = a
        sat_stats[i][1] = v
        sat_stats[i][1] = l
        i += 1
    return earth, sat_list[0], sat_list[1], sat_list[2]

anim = animation.FuncAnimation(fig, animate,init_func=init,frames=1000,interval=20,blit=True)

plt.show()

# def getCoord():
#     x = random.uniform(0.0,20.0)
#     y = random.uniform(0.0,20.0)
#     return (x,y)

# ######
# #
# # Generate random units here
# #
# patch_list = []
# patch1 = plt.Circle((1, -1), 0.1, fc='y')
# patch_list.append(patch1)
# patch2 = plt.Circle((1, -1), 0.1, fc='r')
# patch_list.append(patch2)
# patch3 = plt.Circle((1, -1), 0.1, fc='g')
# patch_list.append(patch3)
# patch4 = plt.Circle((1, -1), 0.1, fc='b')
# patch_list.append(patch4)
# patch5 = plt.Circle((1, -1), 0.1, fc='y')
# patch_list.append(patch5)
# patch6 = plt.Circle((1, -1), 0.1, fc='r')
# patch_list.append(patch6)
# patch7 = plt.Circle((1, -1), 0.1, fc='g')
# patch_list.append(patch7)
# patch8 = plt.Circle((1, -1), 0.1, fc='b')
# patch_list.append(patch6)
#
# def get_centroid(p,d):
#     p_x, p_y = p.center
#     temp_list = []
#     for t in patch_list:
#         temp_x,temp_y = t.center
#         if (temp_x != p_x and temp_y != p_y):
#             mag = math.sqrt((p_x - temp_x)**2 + (p_y - temp_y)**2)
#             if mag <= d:
#                 temp_list.append(t)
#     x = 0.0
#     y = 0.0
#     for s in temp_list:
#         s_x, s_y = s.center
#         x += s_x
#         y += s_y
#     if len(temp_list) == 0:
#         return (10.0,10.0)
#     else:
#         x /= len(temp_list)
#         y /= len(temp_list)
#         return (x,y)
#
# def init():
#     for p in patch_list:
#         p.center = getCoord()
#         ax.add_patch(p)
#     return patch_list[0],patch_list[1],patch_list[2],patch_list[3],patch_list[4],patch_list[5],patch_list[6],patch_list[7]
#
# def animate(i):
#     move_speed = 0.05;
#     sense_dist = 6.5;
#     # print get_centroid()
#     for p in patch_list:
#         c_x, c_y = get_centroid(p,sense_dist)
#         x, y = p.center
#         d_x = c_x - x
#         d_y = c_y - y
#         mag = math.sqrt(d_x**2 + d_y**2)
#         m_x = (d_x / mag) * move_speed
#         m_y = (d_y / mag) * move_speed
#         x += m_x
#         y += m_y
#         p.center = (x, y)
#
#     return patch_list[0],patch_list[1],patch_list[2],patch_list[3],patch_list[4],patch_list[5],patch_list[6],patch_list[7]
#
# anim = animation.FuncAnimation(fig, animate,init_func=init,frames=250,interval=20,blit=True)
#
# anim.save('animation2.mp4', fps=30,
#           extra_args=['-vcodec', 'h264',
#                       '-pix_fmt', 'yuv420p'])
#
#
# plt.show()
