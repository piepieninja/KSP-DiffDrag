import sys
import telnetlib

tn = telnetlib.Telnet('127.0.0.1',5410)
tn.write("vt100\n")

asdf = tn.read_until("> ") # this should be the
print asdf
test = tn.write("1" + "\n")
# line = tn.read_until("\n")  # Read one line
# print(line)
# print asdf
print test
tn.write("switch to 0.\n")
tn.write("list files.\n")
for x in range(0,2):
    tn.write("fun hello_world.ks" + "\n")
    #tn.read_all()
s
