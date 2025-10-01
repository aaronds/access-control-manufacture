include <door-servo-measurements.scad>
use <door-servo-assembly.scad>
frameless=true;
originOffsetToEdge = frameless ? strokeSize + clipSize + doorClipGap + 2 * clipWall + doorLatchPannel + boxWallThickness : strokeSize + clipSize + doorClipGap + 2 * clipWall;
acsPannelOffsetToEdge=originOffsetToEdge + servoMountPlateLength / 2 + servoMountPlateOffset + 6 * boltM + acsButtonM / 2;
perspexCutOut(acsPannelOffsetToEdge);                

