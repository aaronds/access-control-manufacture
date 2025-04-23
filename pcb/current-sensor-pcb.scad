pcbWidth = 43;
pcbLength = 34;
pcbHeight = 11;

wireHeight = 6;
wallThickness = 2;

difference() {
    cube([pcbWidth + 2 * wallThickness, pcbLength + 2 * wallThickness, pcbHeight + wallThickness]);
    translate([wallThickness - 0.1, wallThickness - 0.1, wallThickness]) {
        cube([pcbWidth + 0.2, pcbLength + 0.2, pcbHeight + 0.01]);
    }
}

translate([0, pcbLength + 10, 0]) {
    difference() {
        translate([0, wallThickness, 0]) {
            cube([pcbWidth + 4 * wallThickness, pcbLength + 3 * wallThickness, wireHeight + wallThickness]);
        }
        translate([wallThickness - 0.15, wallThickness - 0.15, wallThickness]) {
            cube([pcbWidth + 2 * wallThickness + 0.3, pcbLength + 2 * wallThickness + 0.3, wireHeight + 0.01]); 
        }
    }
}
