print "counting orbits... ".

set curr_period to ship:orbit:PERIOD.
set loop_num to 0.
set curr_time to 0.
set orbits to 0.

until loop_num > 1 {
  if (curr_time > curr_period){
    set orbits to orbits + 1.
    set curr_time to 0.
  }
  print "orbits: " + orbits.
  print "period: " + curr_period.
  print "curr_time: " + curr_time.
  wait 1.
  set curr_time to curr_time + 1.
  set curr_period to ship:orbit:PERIOD.
}
