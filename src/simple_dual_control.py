#!/usr/bin/python

import threading
import time
import sys

from subprocess import call

###############################
#                             #
#           Globals           #
#                             #
###############################

# default to KOS
IP   = "127.0.0.1"
PORT = "5410"

###############################
#                             #
#     Functions & Classes     #
#                             #
###############################

####### Functions

# begins a telnet instance for a sat_control_node
# returns the screenID of the instance if successful
# returns None if successful
def begin_telnet():
    call(["ls", "-l"],shell=True)
    # call(["telnet", IP, PORT],shell=True)
    return None

####### Classes

# The main class for controlling a Diff Drag Sat
class sat_control_node (threading.Thread):
   def __init__(self, threadID, name, cpu_num):
      threading.Thread.__init__(self)
      self.threadID = threadID
      self.name     = name
      self.cpu_num  = cpu_num
      self.screenID = None
   def run(self):
      # main

###############################
#                             #
#         Entry Point         #
#                             #
###############################

# Launch Hello World Threads
# By convention I will make the cpu_num match the KOS control node number
thread1 = sat_control_node(1, "Diff-Sat-0.9-1", 1)
thread2 = sat_control_node(2, "Diff-Sat-0.9-2", 3)

# Start new Threads
thread1.start()
thread2.start()
