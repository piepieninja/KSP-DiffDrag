print "running senario 1".

// this is the state that determines if we are in min or max drag config

set target to "".

if ship:name = "Sat A" {
  print "Set to min drag for initial config".
  set target to "Sat B". // this will always be the target sat
}
if ship:name = "Sat B" {
  print "Set to max drag for initial config".
  set target to "Sat A".
}
