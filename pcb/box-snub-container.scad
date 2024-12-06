snubWidth = 14;
snubLength = 30.6;
snubHeight = 15;

wallThickness = 2;

difference() {
    cube([snubWidth + 2 * wallThickness, snubLength + 2 * wallThickness, snubHeight + wallThickness]);
    translate([wallThickness, wallThickness, wallThickness]) {
        cube([snubWidth, snubLength + wallThickness + 0.1, snubHeight + 0.1]);
    }
}

translate([snubWidth * 2, 0, 0]) {
    difference() {
        cube([snubWidth + 4 * wallThickness, snubLength + 4 * wallThickness, snubHeight + 2 * wallThickness]);
        translate([wallThickness - 0.2, wallThickness - 0.2, wallThickness]) {
            cube([snubWidth + 2 * wallThickness + 0.4, snubLength + 2 * wallThickness + 0.4, wallThickness + snubHeight + 0.1]);
        }

        translate([wallThickness * 2, wallThickness * 2, wallThickness]) {
            cube([snubWidth, snubLength +  2 * wallThickness + 0.1, wallThickness + snubHeight + 0.1]);
        }
    }
}
