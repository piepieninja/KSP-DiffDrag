print "trying to read from custom part... ".

set loop_num to 0.

SET d TO ship:PARTSDUBBED("Drag Detector v0.2")[0].

until loop_num > 1 {
  //set drag to d:GETFIELD("Drag Force: ").
  //print "drag: " + drag.
  //print d:modules.
  print "drag: " + d:getmodule("DragDetector"):getfield("Drag Force").
}
