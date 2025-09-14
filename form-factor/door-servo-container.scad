use <../lib/lasercut/lasercut.scad>
include <door-servo-measurements.scad>
$fn=100;


clipFrameOffsetY = clipSize / 2 + gapToMove + 3 * boltM;

clipFrameHoles = [
    [boltM/2, boxSize[1] - (2 * clipWall) - ferrousSheet / 2, boxSize[2] / 2 - clipFrameOffsetY],
    [boltM/2, boxSize[1] - (2 * clipWall) - ferrousSheet / 2, boxSize[2] / 2 + clipFrameOffsetY]
];

hingeFrameHoles = [
    [boltM/2, boxSize[1] - cabinetHingeFrameBoltOffsetDepth, boxSize[2] / 2 - cabinetHingeFrameBoltOffsetHeight],
    [boltM/2, boxSize[1] - cabinetHingeFrameBoltOffsetDepth, boxSize[2] / 2 + cabinetHingeFrameBoltOffsetHeight]
];


echo(clipFrameHoles);

lasercutoutBox(
    thickness=boxWallThickness,
    x=boxSize[1],
    y=boxSize[0],
    z=boxSize[2],
    sides=5,
    num_fingers=6,
    circles_remove_a=[
        [],
        [],
        clipFrameHoles,
        hingeFrameHoles,
        []
    ]
);
