include <strip-wire-measurements.scad>
include <strip-wire-lib.scad>

paddingWidth = wallThickness * 2 + 2 * toolWidth;
holdWidth = paddingWidth + wireD;

$fn=100;

difference() {
    union() {
        translate([ - wallThickness - wallThickness - tThreadM, - wallThickness - toolWidth - (wireD / 2)]) {
            cube([wallThickness * 4 + 2 * tThreadM + stockLength, holdWidth,wallThickness]);
        }
        translate([tThreadM * 2 + wallThickness, -tSlotWidth / 2, wallThickness]) {
            cube([tThreadM * 2, tSlotWidth, tSlotDepth]);  
        }

        translate([stockLength - (tThreadM * 2 + wallThickness) - tThreadM * 2, -tSlotWidth / 2, wallThickness]) {
            cube([tThreadM * 2, tSlotWidth, tSlotDepth]);  
        }
    }

    translate([-wallThickness - tThreadM / 2, 0, -0.01]) {
        cylinder(r=tThreadM/2+0.05,h=wallThickness + 0.03);
    }

    translate([stockLength + wallThickness + tThreadM / 2, 0, -0.01]) {
        cylinder(r=tThreadM/2+0.05,h=wallThickness + 0.03);
    }
}
