print "=======================".
print "testing ADCS things...".

set loop_num to 0.
sas off.

until loop_num > 1 {
  print "locking stearing prograde...".
  lock steering to prograde.
  wait 7.
  // ========
  print "locking stearing retrograde...".
  lock steering to retrograde.
  wait 7.
  // ========
  print "locking stearing Vector(1,1,1)...".
  lock steering to V(1,1,1).
  wait 7.
  // ========
  print "locking stearing Vector(-1,-1,-1)...".
  lock steering to V(-1,-1,-1).
  wait 7.
  // ========
  Brakes on.
  // ========
  print "locking stearing North + R...".
  lock steering to North + R(0,90,0). // This is normal node
  wait 7.
  // ========
  print "locking stearing North - R...".
  lock steering to North + R(0,-90,0). // This is still normal node
  wait 7.
  // ========
  print "locking stearing prograde...".
  lock steering to prograde.
  wait 7.
  // ========
  print "locking stearing retrograde...".
  lock steering to retrograde.
  wait 7.
  Brakes off.
}
