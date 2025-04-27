include <bg-cprsd432-dimensions.scad>

$fn=100;

difference() {
    translate([-pannelSize / 2, -pannelSize / 2, 0]){
        cube([pannelSize, pannelSize, centerHoleRingDepth * 2]);
    }
    translate([0,0,-0.01]) {
        cylinder(r=centerHoleRingR, h=centerHoleRingDepth * 2 + 0.02);
    }
}

for (rotate=[0, 90, 180, 270]) {
    rotate([0,0,rotate]) {
        translate([screwHoleGap / 2,screwHoleGap / 2, -pannelDepth]) {
            cylinder(r=screwHoleR, h=pannelDepth + 0.1);
        }
    }
}
