include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

servoArms();
translate([0,10,0]) {
    doorBolt();
}
