include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

include <door-servo-container.scad>

servoMount = true;

translate([boxSize[1] - clipWall, boxSize[0],boxSize[2]/2]) {
    rotate([90,0,-90]) {
        translate([-(strokeSize + clipSize + doorClipGap + 2 * clipWall + doorLatchPannel + boxWallThickness - boxSize[0]), 0, 0]) {

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
            doorClip(frameless=true, servoMount=servoMount);
            doorBolt(servoMount=servoMount);
            laserDoorSide(frameless=true, servoMount=servoMount);
            doorHingeSpacers();
        }
    }
}
