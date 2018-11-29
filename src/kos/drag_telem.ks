set loop_num to 0.
set debug to 1.
set prev_time to time:seconds.
set v_g0 to 99999.

set drag to vecdrawargs(v(-5,0,0),v(0,0,0),red,"Drag",1,True).

wait 0.001.

until loop_num > 1{
  // set the variables
  set pressure to Kerbin:Atm:altitudepressure(ship:altitude) * constant:AtmToKPa.
  // https://forum.kerbalspaceprogram.com/index.php?/topic/13368-air-density-on-kerbin/
  set p to 1.225 * constant:e ^ (ship:altitude / -70000).
  set v_o to ship:velocity:orbit.
  set v_a to ship:airspeed.
  set v_g1 to ship:groundspeed.
  set q to ship:q.
  //set p to q * 1.2230948554874.
  set m to ship:mass * 1000.

  if debug = 1 {
  // print the variables
    print "============================================".
    //print "asdf".
    //print "m: " + m.
    print "pressure: " + pressure.
    print "p: " + p.
    print "q: " + q.
    print "v_o: " + v_o.
    print "v_a: " + v_a.
    print "v_g1: " + v_g1.
  }
  set numer to (v_g1 - v_g0).
  set denom to (time:seconds - prev_time).
  print numer + "/" + denom.
  set a to (numer / denom ).
  set prev_time to time:seconds.
  set v_g0 to ship:groundspeed.
  if debug = 1 { print "a: " + a.}
  wait 0.001.

  set sense_a to ship:sensors:acc.
  print "sensed a: " + sense_a.

  set C_dS to (2 * m * a) / (q * (v_a^2)).
  print "C_d * S: " + C_dS.

  set magic to m * sense_a:x.
  print "Magic Force: " + magic.

  //set drag:vec to vdot(vec,ship:srfprograde:vector)*ship:srfprograde:vector.

}
