$fn=100;
cornerSize=14;
screwHoleR=8 / 2;
screwHoleDepth=6;
outerDepth=10;
outerR=screwHoleR + 1.5;
buttonClearance=12;
outerEdge=2;

module inverseCorner(r=8,h=10) {
    difference() {
        translate([0,0,0]) {
            cube([r, r, h]);
        }
        translate([0,0,-0.001]) {
            cylinder(r=r,h=h + 0.002);
        }
    }
}

//inverseCorner();


difference() {
    union() {
        cube([cornerSize + outerEdge, cornerSize + outerEdge, buttonClearance]);
        translate([cornerSize - outerR, cornerSize - outerR, -outerDepth]) {
            cube([ outerR + outerEdge, outerR + outerEdge, outerDepth]);
        }

    }
    translate([cornerSize - outerR, cornerSize - outerR, -outerDepth - 0.01]) {
        inverseCorner(r=outerR + outerEdge,h=buttonClearance + outerDepth + 0.02);
    }
    translate([cornerSize - outerR, cornerSize - outerR, -outerDepth - 0.01]) {
        cylinder(r=outerR, h=outerDepth + 0.01);
        *inverseCorner(r=outerR + outerEdge,h=buttonClearance + outerDepth + 0.02);
    }
}
translate([cornerSize - outerR, cornerSize - outerR, -screwHoleDepth]) {
    cylinder(r=screwHoleR - 0.1, h=screwHoleDepth);
}
