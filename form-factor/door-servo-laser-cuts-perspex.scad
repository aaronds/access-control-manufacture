include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

projection(true) {
    translate([0,0,3]) laserDoorSide(frameless=true,servoMount=true);
}
