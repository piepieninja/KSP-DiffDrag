#!/usr/bin/expect -f

# runs a some telnet goodies from a script
spawn s
expect "> "
send "1\n"
expect "Proceed."
send "switch to 0.\n"
sleep 1
send "run hello_world.ks.\n"
