include <strip-wire-measurements.scad>
include <strip-wire-lib.scad>

paddingWidth = wallThickness * 2 + 2 * toolWidth;
holdWidth = paddingWidth + wireD;

$fn=100;

fullThickness = 2 * wallThickness + 5;


difference() {
    union() {
        translate([ - wallThickness - wallThickness - tThreadM, - wallThickness - toolWidth - (wireD / 2)]) {
            cube([wallThickness * 4 + 2 * tThreadM + stockLength, holdWidth,fullThickness]);
        }

        translate([tThreadM * 2 + wallThickness, -tSlotWidth / 2, -tSlotDepth]) {
            cube([tThreadM * 2, tSlotWidth, tSlotDepth]);  
        }

        translate([stockLength - (tThreadM * 2 + wallThickness) - tThreadM * 2, -tSlotWidth / 2, -tSlotDepth]) {
            cube([tThreadM * 2, tSlotWidth, tSlotDepth]);  
        }

        translate([stockLength / 2 - tThreadM, -tSlotWidth / 2, -tSlotDepth]) {
            cube([tThreadM * 2, tSlotWidth, tSlotDepth]);  
        }
    }

    translate([-wallThickness - tThreadM / 2, 0, -0.01]) {
        cylinder(r=tThreadM/2+0.5,h=fullThickness + 0.02);
    }

    translate([stockLength + wallThickness + tThreadM / 2, 0, -0.01]) {
        cylinder(r=tThreadM/2+0.5,h=fullThickness + 0.02);
    }

    translate([0, -wireD/2, fullThickness - wallThickness - 0.01]) {
        cube([stockLength, wireD, wallThickness + 0.02]);
    }
}
