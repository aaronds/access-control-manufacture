include <door-servo-measurements.scad>
use <door-servo-assembly.scad>

include <door-servo-container.scad>

translate([boxSize[1] - clipWall, boxSize[0],boxSize[2]/2]) {
    rotate([90,0,-90]) {
        translate([-(strokeSize + clipSize + doorClipGap + 2 * clipWall + doorLatchPannel + boxWallThickness - boxSize[0]), 0, 0]) {
            servo();
            servoArms();
            servoMount(frameless=true);
            frameClip(frameless=true);
            doorClip(frameless=true);
            doorBolt();
            laserDoorSide(frameless=true);
            doorHingeSpacers();
        }
    }
}
