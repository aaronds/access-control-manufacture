include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

servo();
servoArms();
servoMount(frameless=true);
frameClip(frameless=true);
doorClip(frameless=true);
doorBolt();

//laserFrameSide();
//laserDoorSide();
