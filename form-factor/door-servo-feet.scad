include <door-servo-measurements.scad>

module frontFoot() {
    union() {
        cube([feetSize, feetSize, feetSize]);
        translate([feetSize - boxWallThickness, 0, feetSize]) {
            cube([boxWallThickness, feetSize, feetSize]);
        }
    }
}

module backFoot() {
    difference() {
        cube([feetSize, feetSize + 1 * boxWallThickness, feetSize + 3 * boxWallThickness]);
        translate([-0.01, -0.01, feetSize]) {
            cube([feetSize - 1 * boxWallThickness + 0.01, feetSize + 0 + 0.01, boxWallThickness + gapToFit]);
        }

        translate([feetSize - 2 * boxWallThickness - gapToFit / 2, -0.01, feetSize]) {
            cube([boxWallThickness + gapToFit, feetSize + 0 + 0.01, 3 * boxWallThickness + 0.01]);
        }

        
    }
}

frontFoot();

translate([3 * feetSize, 0,0]) {
    mirror([1, 0, 0]) frontFoot();
}

translate([0, 3 * feetSize, 0]) {
    backFoot();
}

translate([3 * feetSize, 3 * feetSize, 0]) {
    mirror([1, 0, 0]) backFoot();
}
