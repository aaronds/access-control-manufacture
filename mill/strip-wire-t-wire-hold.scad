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
    }

    translate([0, -wireD/2, -0.01]) {
        cube([stockLength, wireD, wallThickness + 0.02]);
    }

    translate([-wallThickness - tThreadM / 2, 0, -0.01]) {
        cylinder(r=tThreadM/2+0.05,h=wallThickness + 0.03);
    }

    translate([stockLength + wallThickness + tThreadM / 2, 0, -0.01]) {
        cylinder(r=tThreadM/2+0.05,h=wallThickness + 0.03);
    }
}
