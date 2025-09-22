include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

servoMount = true;

if (servoMount) {
    translate([strokeSize, 0, servoWidth / 2 + strokeSize]) {
        rotate([0, 180, 0]) {
            translate([0,0,-servoWidth/2]) servo();
        }
    }
    servoArmsRight();
} else {
    servo();
    servoArms();
    servoMount(frameless=true);
}

frameClip(frameless=true);
doorClip(frameless=true,servoMount=servoMount);
doorBolt(servoMount=true);
laserDoorSide(frameless=true, servoMount=servoMount);
doorHingeSpacers();

//laserFrameSide();
