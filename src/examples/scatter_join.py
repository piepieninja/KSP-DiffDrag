import numpy as np
import random
import math
from matplotlib import pyplot as plt
from matplotlib import animation

fig = plt.figure()
# fig.set_dpi(100)

ax = plt.axes(xlim=(0, 20), ylim=(0, 20))



def getCoord():
    x = random.uniform(0.0,20.0)
    y = random.uniform(0.0,20.0)
    return (x,y)

######
#
# Generate random units here
#
patch_list = []
patch1 = plt.Circle((1, -1), 0.1, fc='y')
patch_list.append(patch1)
patch2 = plt.Circle((1, -1), 0.1, fc='r')
patch_list.append(patch2)
patch3 = plt.Circle((1, -1), 0.1, fc='g')
patch_list.append(patch3)
patch4 = plt.Circle((1, -1), 0.1, fc='b')
patch_list.append(patch4)
patch5 = plt.Circle((1, -1), 0.1, fc='y')
patch_list.append(patch5)
patch6 = plt.Circle((1, -1), 0.1, fc='r')
patch_list.append(patch6)
patch7 = plt.Circle((1, -1), 0.1, fc='g')
patch_list.append(patch7)
patch8 = plt.Circle((1, -1), 0.1, fc='b')
patch_list.append(patch6)

def get_centroid():
    x = 0.0
    y = 0.0
    for p in patch_list:
        a,b = p.center
        x += a
        y += b
    x /= 8
    y /= 8
    return (x,y)

def init():
    for p in patch_list:
        p.center = getCoord()
        ax.add_patch(p)
    return patch_list[0],patch_list[1],patch_list[2],patch_list[3],patch_list[4],patch_list[5],patch_list[6],patch_list[7]

def animate(i):
    move_speed = 0.05;
    c_x, c_y = get_centroid()
    # print get_centroid()
    for p in patch_list:
        x, y = p.center
        d_x = c_x - x
        d_y = c_y - y
        mag = math.sqrt(d_x**2 + d_y**2)
        m_x = (d_x / mag) * move_speed
        m_y = (d_y / mag) * move_speed
        x += m_x
        y += m_y
        p.center = (x, y)

    return patch_list[0],patch_list[1],patch_list[2],patch_list[3],patch_list[4],patch_list[5],patch_list[6],patch_list[7]

anim = animation.FuncAnimation(fig, animate,init_func=init,frames=360,interval=20,blit=True)

plt.show()
