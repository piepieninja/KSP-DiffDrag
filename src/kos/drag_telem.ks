set loop_num to 0.
set debug to 1.
set prev_time to time:seconds.
set v_g0 to 99999.

set drag to vecdrawargs(v(-5,0,0),v(0,0,0),red,"Drag",1,True).

wait 0.001.

set CdS to 24.025.

until loop_num > 1{
  // set the variables
  set pressure to Kerbin:Atm:altitudepressure(ship:altitude) * constant:AtmToKPa * 1000.
  set v_o to ship:velocity:orbit.
  set v_a to ship:airspeed.
  set v_g1 to ship:groundspeed.
  set q to ship:q * constant:AtmToKPa *1000.
  //set p to q * 1.2230948554874.
  set m to ship:mass * 1000.
  set a to ship:sensors:acc.

  if debug = 1 {
  // print the variables
    print "============================================".
    //print "asdf".
    //print "m: " + m.
    print "pressure: " + pressure.
    print "q: " + q.
    print "v_o: " + v_o.
    print "v_a: " + v_a.
    // print "a: " + a.
    // print "a[y]: " + a:Y.
    print "v_g1: " + v_g1.
  }
  set d to (2 * (q)) / (v_a ^ 2).
  // https://en.wikipedia.org/wiki/Dynamic_pressure
  print "density: " + d.

  wait 0.01.
  set v_g0 to ship:groundspeed.
  set calc_a to (v_g0 - v_g1) / 0.01.

  print "calculated a: " + calc_a.
  // print "expcted a: " + a.

  // all correct above

  set f to m * calc_a.
  print "Force: " + f.

  set fuq to 0.008*q*v_a*0.2.
  print "fuq: " + fuq.

  // set numer to (v_g1 - v_g0).
  // set denom to (time:seconds - prev_time).
  // print numer + "/" + denom.
  // set a to (numer / denom ).
  // set prev_time to time:seconds.
  // set v_g0 to ship:groundspeed.
  // if debug = 1 { print "a: " + a.}
  // wait 0.001.
  //
  // set sense_a to ship:sensors:acc.
  // print "sensed a: " + sense_a.
  //
  // set C_dS to (2 * m * a) / (q * (v_a^2)).
  // print "C_d * S: " + C_dS.
  //
  // set magic to m * sense_a:x.
  // print "Magic Force: " + magic.
  // print "============================================".

  //set drag:vec to vdot(vec,ship:srfprograde:vector)*ship:srfprograde:vector.

}
