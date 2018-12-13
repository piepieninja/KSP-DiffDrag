

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

set total_dist to targetBoi:distance.
set prev_step to targetBoi:distance.
set delta_d to 0.
set prev_delta_d to 0.
set delta_v to 0.
set loop_num to 0.
set swap_num to 0.

//accepted time to correct
set corr_time to 60. // one minute
// accepted threshold to trigger correction
set corr_thsh to 0.1.

until loop_num > 1 {
  // if (targetBoi:distance < total_dist/2 or delta_v > corr_thsh) and swap_num > corr_time{
  if targetBoi:distance < total_dist/2 {
    set swap_num to 0.
    if maneuvering {
      set maneuvering to false.
      Brakes off.
    } else {
      set maneuvering to true.
      Brakes on.
    }
    set total_dist to targetBoi:distance.
  }
  if targetBoi:distance < 20 {
    set loop_num to 69.
  }
  set prev_delta_d to delta_d.
  set delta_d to prev_step - targetBoi:distance.
  set delta_v to prev_delta_d - delta_d.
  wait 1. // no need to rush this
  set swap_num to swap_num + 1.
  print "   dist: " +  targetBoi:distance.
  print "dist go: " + (targetBoi:distance - total_dist/2).
  print "delta_d: " + delta_d.
  print "delta_v: " + delta_v.
}

// until targetBoi:distance < total_dist/2 {
//   wait 5.
//   print "dist to go: " + (targetBoi:distance - total_dist/2).
// }
// print "yoink".

// total_dist = target:distance.
//
// until target:distance < total_dist/2 {
//
// }
// print "half".
// KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat A")).
// print target


// print "starting...".
//
// set loop_num to 0.
// set swap to true.
//
// KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat A")).
// set target to VESSEL("Sat B").
// print "V: " + KUNIVERSE:ACTIVEVESSEL:name + ", T: " + target.
// KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat B")).
// KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat B")).
// KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat B")).
// wait 2.
// print KUNIVERSE:ACTIVEVESSEL:name.
// set target to VESSEL("Sat A").
// print "V: " + KUNIVERSE:ACTIVEVESSEL:name + ", T: " + target.
//
//
// // until loop_num > 1 {
// //   print KUNIVERSE:ACTIVEVESSEL:name.
// //
// //   print "targe: " + target.
// //
// //   if swap {
// //     // set target to "".
// //     KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat B")).
// //     // SET KUniverse:ACTIVEVESSEL TO VESSEL("Sat B").
// //     // wait 1.
// //     //print KUNIVERSE:ACTIVEVESSEL:name.
// //     // set target to "".
// //     //set target to VESSEL("Sat A").
// //     set swap to false.
// //   } else {
// //     KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat A")).
// //     // SET KUniverse:ACTIVEVESSEL TO VESSEL("Sat A").
// //     // wait 1.
// //     //set target to VESSEL("Sat B").
// //     set swap to true.
// //   }
// //   wait 1.
// // }
//
//
//
//
//
// // print "running senario 1".
// //
// // // some globals
// // //set target to "".
// // set isChasing to "".
// // set maneuvering to false.
// // set loop_num to 0.
// // set debug to true.
// // set swap to true.
// //
// // // loop through active vessels
// // set boi to "Sat A".
// //
// // if ship:name = "Sat A" {
// //   print "Set to min drag for initial config".
// //   set target to "Sat B". // this will always be the target sat
// //   lock steering to prograde.
// //   set maneuvering to false.
// //   set isChasing to "". // just for good measure
// // }
// //
// // if ship:name = "Sat B" {
// //   print "Set to max drag for initial config".
// //   set target to "Sat A".
// //   lock steering to prograde.
// //   set maneuvering to true.
// //   set isChasing to "Sat B".
// // }
// //
// // // our main indicator of swapping
// // set dist_to_half to target:distance.
// //
// // until loop_num > 1 {
// //
// //   if ship:name = "Sat A" {
// //     print "Set to min drag for initial config".
// //     set target to "Sat B". // this will always be the target sat
// //     lock steering to prograde.
// //     set maneuvering to false.
// //     set isChasing to "". // just for good measure
// //   }
// //
// //   if ship:name = "Sat B" {
// //     print "Set to max drag for initial config".
// //     set target to "Sat A".
// //     lock steering to prograde.
// //     set maneuvering to true.
// //     set isChasing to "Sat B".
// //   }
// //
// //   if maneuvering {
// //     Brakes on.
// //   } else {
// //     Brakes off.
// //   }
// //   if target:distance < dist_to_half/2 {
// //     set dist_to_half to target:distance.
// //     if maneuvering {
// //       set maneuvering to false.
// //     } else {
// //       set maneuvering to true.
// //     }
// //   }
// //   set needs_to_go to target:distance - dist_to_half/2.
// //   print "V: " + KUNIVERSE:ACTIVEVESSEL + ", to go: " + needs_to_go.
// //   if swap {
// //     set swap to false.
// //     KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat A")).
// //     set target to "Sat B".
// //   } else {
// //     set swap to true.
// //     KUNIVERSE:FORCESETACTIVEVESSEL(VESSEL("Sat B")).
// //     set target to "Sat A".
// //   }
// //   wait 1.
// // }
// //
// // print "close?".
