print "=============".

// Current Ships Things
print "Name:".
print ship:name.

print "Ap & Pr:".
print ship:orbit:APOAPSIS. // max alt
print ship:orbit:PERIAPSIS. // min alt

print "...".
print ship:orbit:POSITION.

print "---".
print ship:orbit:ECCENTRICITY.
print ship:orbit:INCLINATION.

set loop_num to 0.
set prev_periapsis to ship:orbit:PERIAPSIS.
set prev_apoapsis to ship:orbit:APOAPSIS.

until loop_num > 1 {
  wait 1. //Allows everything to update
  set periapsis_drop to prev_periapsis - ship:orbit:PERIAPSIS.
  set apoapsis_drop to prev_apoapsis - ship:orbit:APOAPSIS.
  print "periapsis drop rate: " + periapsis_drop + " per second".
  print "apoapsis drop rate: " + apoapsis_drop + " per second".
}
