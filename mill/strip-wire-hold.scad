include <strip-wire-measurements.scad>

paddingWidth = wallThickness * 2 + 2 * toolWidth;
holdWidth = paddingWidth + wireD;

$fn=100;

module stripWireHold() {
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

        translate([0, -wireD/2]) {
            square([stockLength, wireD]);
        }

        stripWireCuts(10, 5, 5);

    }
}

module stripWireCuts(wireLength=10,stripInLength=5,stripOutLength=5) {
    translate([stripInLength - toolR, -toolWidth - (wireD / 2)]) {
        square([toolWidth, 2 * toolWidth + wireD]);
    }

    translate([stripInLength + wireLength - toolR, -toolWidth - (wireD / 2)]) {
        square([toolWidth, 2 * toolWidth + wireD]);
    }
}

stripWireHold();
