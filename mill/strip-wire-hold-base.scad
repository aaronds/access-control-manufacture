include <strip-wire-measurements.scad>

paddingWidth = wallThickness * 2 + 2 * toolWidth;
holdWidth = paddingWidth + wireD;
$fn=100;

module stripWireHoldBase() {
    difference() {
        translate([ - wallThickness, - wallThickness - toolWidth - (wireD / 2)]) {
            square([wallThickness * 2 + stockLength, holdWidth]);
        }

        translate([stripLength / 2, -wireD/2 -paddingWidth / 4]) {
            circle(boltM/2);
        }

        translate([stripLength / 2, wireD/2 + paddingWidth / 4]) {
            circle(boltM/2);
        }

        translate([stockLength - stripLength / 2, -wireD/2 -paddingWidth / 4]) {
            circle(boltM/2);
        }

        translate([stockLength - stripLength / 2, wireD/2 + paddingWidth / 4]) {
            circle(boltM/2);
        }

        translate([wireLength + toolR, -toolR]) {
            square([toolWidth, toolWidth]);
        }
    }
}

stripWireHoldBase();

