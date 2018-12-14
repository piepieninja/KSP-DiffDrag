

// set activeBoi to "".
// set targetBoi to "".

if ship:name = "Sat A" {
  print "Set to min drag for initial config".

  set activeBoi to VESSEL("Sat A").
  set targetBoi to VESSEL("Sat B").

  lock steering to prograde.
  set maneuvering to false.
  Brakes off.
}

if ship:name = "Sat B" {
  print "Set to max drag for initial config".

  set activeBoi to VESSEL("Sat B").
  set targetBoi to VESSEL("Sat A").

  lock steering to prograde.
  set maneuvering to true.
  Brakes on.
}

//set total_dist to targetBoi:distance.
//set prev_step to targetBoi:distance.
set total_dist to ABS(targetBoi:position:x).
set prev_step to ABS(targetBoi:position:x).
set delta_d to 0.
set prev_delta_d to 0.
set delta_v to 0.
set loop_num to 0.
set swap_num to 0.

//accepted time to correct
set corr_time to 60. // one minute
// accepted threshold to trigger correction
set corr_thsh to 0.1.
// buffer dist
set buffer_dist to 10.

set booty_loop to 0.

// until booty_loop > 1 {
until loop_num > 1 {
  if ABS(targetBoi:position:x) < total_dist/2{ // bc the dist is negative? wow. thx kos.
    set swap_num to 0.
    if maneuvering {
      set maneuvering to false.
      Brakes off.
    } else {
      set maneuvering to true.
      Brakes on.
    }
    set total_dist to ABS(targetBoi:position:x).
  }
  if ABS(targetBoi:position:x) < 5 {
    set loop_num to 69.
  }
  set prev_delta_d to delta_d.
  set delta_d to prev_step - ABS(targetBoi:position:x).
  set delta_v to prev_delta_d - delta_d.
  wait 1. // no need to rush this
  set swap_num to swap_num + 1.
  //print " my pos: " + activeBoi:position.
  //print "boi pos: " + targetBoi:position.
  print "   dist: " + ABS(targetBoi:position:x).
  print "dist go: " + (ABS(targetBoi:position:x) - total_dist/2).
  print "delta_d: " + delta_d.
  print "delta_v: " + delta_v.
}

print "Approaching closely...".
Brakes off.

//   if targetBoi:position:x > 5 {
//     print "maybe we should drag again?".
//   }
//
// }
