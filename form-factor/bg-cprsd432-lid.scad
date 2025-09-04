include <bg-cprsd432-dimensions.scad>

pcbDepth = 2.5;

*difference() {
    cube([pannelSize + 0.2 + 2 * wallWidth, pannelSize + 0.2 + 2 * wallWidth, wallWidth + centerHoleRingDepth * 2 + pcbDepth]);
    translate([wallWidth, wallWidth, wallWidth]) {
        cube([pannelSize + 0.2, pannelSize + 0.2, pannelDepth + centerHoleRingDepth * 2 + pcbDepth + 0.01]);
    }
}


logoSize=28.754;
translate([((pannelSize + 0.2 + 2 * wallWidth) / 2) - (logoSize / 2), (pannelSize + 0.2 + 2 * wallWidth) / 2 - logoSize / 2, -0.001]) {
    color("black") linear_extrude(height=wallWidth - 1) import("../nfc-logo.svg");
}
