include <strip-wire-measurements.scad>
include <strip-wire-lib.scad>

paddingWidth = wallThickness * 2 + 2 * toolWidth;
holdWidth = paddingWidth + wireD;

$fn=100;

module cutWireBrown() {
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
        
        wireALength = 16.17 + 5.2 + 7;
        wireBLength = 17.85 + 5.2 + 15;

        translate([0, 0]) {
            cutWireCuts(16.17, 5.2, 7);
        }


        translate([toolWidth + wireALength, 0]) {
            cutWireCuts(17.85, 5.2, 15);
        }

        translate([2 * toolWidth + wireALength + wireBLength, 0]) {
            cutWireCuts(16.17, 5.2, 7);
        }

        translate([3 * toolWidth + 2 * wireALength + wireBLength, 0]) {
            cutWireCuts(17.85, 5.2, 15);
        }

        translate([4 * toolWidth + 2 * wireALength + 2 * wireBLength, 0]) {
            cutWireCuts(16.17, 5.2, 7);
        }

        translate([5 * toolWidth + 3 * wireALength + 2 * wireBLength, 0]) {
            cutWireCuts(17.85, 5.2, 15);
        }

        translate([6 * toolWidth + 3 * wireALength + 3 * wireBLength, 0]) {
            cutWireCuts(16.17, 5.2, 7);
        }

        translate([7 * toolWidth + 4 * wireALength + 3 * wireBLength, 0]) {
            cutWireCuts(17.85, 5.2, 15);
        }

    }
}

cutWireBrown();
