include <bg-cprsd432-dimensions.scad>

difference() {
    cube([pannelSize + 0.2 + 2 * wallWidth, pannelSize + 0.2 + 2 * wallWidth, wallWidth + pannelDepth]);
    translate([wallWidth, wallWidth, wallWidth]) {
        cube([pannelSize + 0.2, pannelSize + 0.2, pannelDepth + 0.01]);
    }
}
