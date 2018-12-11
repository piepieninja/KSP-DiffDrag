#!/usr/bin/expect -f

# runs a some telnet goodies from a script
spawn telnet 127.0.0.1 5410
expect "> "
send "2\n"
expect "."
#expect "Proceed."
send "switch to 0.\n"
sleep 1
send "run map_values.\n"
sleep 900
# that's 15 mins of data
