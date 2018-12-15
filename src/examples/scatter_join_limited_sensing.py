import numpy as np
import random
import math
from matplotlib import pyplot as plt
from matplotlib import animation

fig = plt.figure()
# fig.set_dpi(100)

ax = plt.axes(xlim=(0, 20), ylim=(0, 20))

# returns a random x,y point in bounds
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

def get_centroid(p,d):
    p_x, p_y = p.center
    temp_list = []
    for t in patch_list:
        temp_x,temp_y = t.center
        if (temp_x != p_x and temp_y != p_y):
            mag = math.sqrt((p_x - temp_x)**2 + (p_y - temp_y)**2)
            if mag <= d:
                temp_list.append(t)
    x = 0.0
    y = 0.0
    for s in temp_list:
        s_x, s_y = s.center
        x += s_x
        y += s_y
    if len(temp_list) == 0:
        return (10.0,10.0)
    else:
        x /= len(temp_list)
        y /= len(temp_list)
        return (x,y)

# this initializes the points
def init():
    for p in patch_list:
        # the .center gets the location of the point
        p.center = getCoord()
        ax.add_patch(p)
    return patch_list[0],patch_list[1],patch_list[2],patch_list[3],patch_list[4],patch_list[5],patch_list[6],patch_list[7]

def animate(i):
    move_speed = 0.05;
    sense_dist = 6.5;
    # print get_centroid()
    for p in patch_list:
        c_x, c_y = get_centroid(p,sense_dist)
        # the .center gets the location of the point
        x, y = p.center
        d_x = c_x - x
        d_y = c_y - y
        # this simplu moves the point in the unit vector direction
        # towards the centeroid
        mag = math.sqrt(d_x**2 + d_y**2)
        m_x = (d_x / mag) * move_speed
        m_y = (d_y / mag) * move_speed
        x += m_x
        y += m_y
        # the .center sets the location of the point
        p.center = (x, y)

    return patch_list[0],patch_list[1],patch_list[2],patch_list[3],patch_list[4],patch_list[5],patch_list[6],patch_list[7]

anim = animation.FuncAnimation(fig, animate,init_func=init,frames=250,interval=20,blit=True)

anim.save('animation2.mp4', fps=30,
          extra_args=['-vcodec', 'h264',
                      '-pix_fmt', 'yuv420p'])


plt.show()
