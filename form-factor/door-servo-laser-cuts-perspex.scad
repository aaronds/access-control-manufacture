include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

projection(true) {
    translate([0,0,clipWall - 2]) laserDoorSide(frameless=true);
}
