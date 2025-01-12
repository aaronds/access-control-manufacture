include <strip-wire-measurements.scad>
include <strip-wire-lib.scad>

paddingWidth = wallThickness * 2 + 2 * toolWidth;
holdWidth = paddingWidth + wireD;

$fn=100;

difference() {
    union() {
        translate([ - wallThickness - wallThickness - tThreadM, - wallThickness - toolWidth - (wireD / 2)]) {
            square([wallThickness * 4 + 2 * tThreadM + stockLength, holdWidth]);
        }
    }

    translate([-wallThickness - tThreadM / 2, 0]) {
        circle(r=tThreadM/2+0.05);
    }

    translate([stockLength + wallThickness + tThreadM / 2, 0]) {
        circle(r=tThreadM/2+0.05);
    }
}
