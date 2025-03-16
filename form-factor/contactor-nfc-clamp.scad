railWidth=36 - 0.6;
railDepth=10;
railHeight=5;
contactorWallWidth=2;

leftVoidOffset=4.5;
leftVoidWidth=7 - 0.1;
leftVoidDepth=7;
leftVoidHeight=6;

rightVoidOffset = 2;
rightVoidWidth = 5;
rightVoidHeight = leftVoidHeight;
rightVoidDepth = 7;

railEndToLidEdge = contactorWallWidth + 17;

clampOffset = leftVoidDepth + contactorWallWidth + 15;
clampDepth = 2;
clampHeight = 10;
clampWallSize = 1 - 0.3;

lidLipHeight = 1.5;

maxVoidDepth = max(rightVoidDepth, leftVoidDepth);

difference() {
    cube([railWidth, railDepth + railEndToLidEdge, railHeight]);
    translate([0, maxVoidDepth,0]) {
        cube([railWidth, railDepth + railEndToLidEdge - maxVoidDepth, lidLipHeight]); 
    }
}
translate([leftVoidOffset,0,railHeight]) {
    cube([leftVoidWidth, leftVoidDepth, leftVoidHeight]);
}

translate([railWidth - rightVoidOffset - rightVoidWidth,0,railHeight]) {
    cube([rightVoidWidth, rightVoidDepth, rightVoidHeight]);
}


translate([0, clampOffset, railHeight]) {
    cube([railWidth, clampWallSize, clampHeight]);
    translate([0, clampWallSize + clampDepth, 0]) {
        cube([railWidth, clampWallSize, clampHeight]);
    }
}
