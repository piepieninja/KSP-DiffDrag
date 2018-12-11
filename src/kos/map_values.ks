// TODO: maybe try different orientations
lock steering to prograde.

// https://www.reddit.com/r/Kos/comments/49vb3q/trying_to_log_data_to_a_file_for_graphing_but_i/
set logfile to archive:create("output.csv").

print "START============>".
// print the top of the csv
print "time,altitude,pressure,orbital_velocity,airspeed_velocity,sensed_acceleration,dynamic_pressure,calculated_density".

//
set time_step to 0.1.
set stop_log_at_alt to 55000.0.
// set the values
set t to 0.0.
set pressure to Kerbin:Atm:altitudepressure(ship:altitude) * constant:AtmToKPa.
set al to ship:altitude.
set v_o to ship:velocity:orbit.
set v_a to ship:airspeed.
set q to ship:q * constant:AtmToKPa. // converted to KPa
set sense_a to ship:sensors:acc.

// Go Forever
set loop_num to 0.
until loop_num > 1 {

  // an attempt at calculating density
  // back calculated from https://en.wikipedia.org/wiki/Dynamic_pressure
  // airspeed is in m/s and q is in kPa, so an adjustment was needed to just use Pa.
  // also see: https://ksp-kos.github.io/KOS/structures/vessels/vessel.html#attribute:VESSEL:Q
  set density to (2 * (q*1000)) / (ship:airspeed ^ 2).

  //logfile:writeln("Hello World!").
  logfile:writeln( t + "," + al + "," + pressure + "," + v_o + "," + v_a + "," + sense_a + "," + q + "," + density).

  // update values
  wait time_step.
  set t to t + time_step.
  set pressure to Kerbin:Atm:altitudepressure(ship:altitude) * constant:AtmToKPa.
  set al to ship:altitude.
  set v_o to ship:velocity:orbit.
  set v_a to ship:airspeed.
  set sense_a to ship:sensors:acc.
  set q to ship:q. // dynamic pressure
  if ship:altitude < stop_log_at_alt{
    set loop_num to 69. // break the loops
  }
}

print "END============>".
