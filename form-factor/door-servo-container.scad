use <../lib/lasercut/lasercut.scad>
include <door-servo-measurements.scad>
$fn=100;


clipFrameOffsetY = clipSize / 2 + gapToMove + 2 * boltM;

clipFrameHoles = [
    [boltM/2, boxSize[1] - boxWallThickness - (2 * clipWall) - ferrousSheet / 2, (boxSize[2] / 2) - clipFrameOffsetY - boxWallThickness / 2 - 0.5],
    [boltM/2, boxSize[1] - boxWallThickness - (2 * clipWall) - ferrousSheet / 2, (boxSize[2] / 2) + clipFrameOffsetY - 5.5]
];


hingeProtrudes = cabinetHingeDoorInsetDepth > doorWoodThickness ? cabinetHingeDoorInsetDepth - doorWoodThickness : 0;

hingeFrameHoles = [
    [boltM/2, boxSize[1] - cabinetHingeFrameBoltOffsetDepth - (hingeProtrudes) - boxWallThickness, boxSize[2] / 3 - cabinetHingeFrameBoltOffsetHeight - 1 * boxWallThickness],
    [boltM/2, boxSize[1] - cabinetHingeFrameBoltOffsetDepth - (hingeProtrudes) - boxWallThickness, boxSize[2] / 3 + cabinetHingeFrameBoltOffsetHeight - 1 * boxWallThickness ],
    [boltM/2, boxSize[1] - cabinetHingeFrameBoltOffsetDepth - (hingeProtrudes) - boxWallThickness, 2 * boxSize[2] / 3 - cabinetHingeFrameBoltOffsetHeight - boxWallThickness ],
    [boltM/2, boxSize[1] - cabinetHingeFrameBoltOffsetDepth - (hingeProtrudes) - boxWallThickness, 2 * boxSize[2] / 3 + cabinetHingeFrameBoltOffsetHeight - boxWallThickness ]
];


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
