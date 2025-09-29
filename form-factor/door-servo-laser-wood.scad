include <door-servo-measurements.scad>
use <door-servo-assembly.scad>
translate([0,0,clipWall]) laserDoorSide(frameless=true, servoMount=true,showWood=true,showPerspex=false,showSVG=false);
