boxWidth = 114.4;
boxDepth = 77;
shelfThickness = 6.05;
tabSize = 4 * shelfThickness;
screwM=3.7;

module mainShelf() {
    difference() {
        cube([boxWidth, boxDepth * 2, shelfThickness]);
        translate([(boxWidth / 4) - (tabSize / 2),- 0.01, -0.01]) {
            cube([tabSize, shelfThickness + 0.01, shelfThickness + 0.02]);
        }
        translate([(boxWidth * (3 / 4)) - (tabSize / 2),- 0.01, -0.01]) {
            cube([tabSize, shelfThickness + 0.01, shelfThickness + 0.02]);
        }
        translate([(boxWidth / 4) - (shelfThickness / 2), boxWidth / 2 - tabSize, -0.01]) {
           cube([shelfThickness, tabSize, shelfThickness + 0.02]); 
        }
        translate([(boxWidth * (3 / 4)) - (shelfThickness / 2), boxWidth / 2 - tabSize, -0.01]) {
           cube([shelfThickness, tabSize, shelfThickness + 0.02]); 
        }
    }
}

module supportShelf() {
    difference() {
        union() {
            cube([boxWidth, boxWidth / 2, shelfThickness]);
            translate([(boxWidth / 4) - (tabSize / 2),- shelfThickness, -0.01]) {
                cube([tabSize, shelfThickness, shelfThickness + 0.02]);
            }
            translate([(boxWidth * (3 / 4)) - (tabSize / 2),- shelfThickness, -0.01]) {
                cube([tabSize, shelfThickness + 0.01, shelfThickness + 0.02]);
            }
        }
        translate([(boxWidth / 4) - (shelfThickness / 2), boxWidth / 2 - tabSize, -0.01]) {
           cube([shelfThickness, tabSize, shelfThickness + 0.02]); 
        }
        translate([(boxWidth * (3 / 4)) - (shelfThickness / 2), boxWidth / 2 - tabSize, -0.01]) {
           cube([shelfThickness, tabSize, shelfThickness + 0.02]); 
        }
        translate([(boxWidth / 2), 2 * screwM, -0.01]) {
            cylinder(h=shelfThickness+0.02,r=screwM/2);
        }
        translate([(boxWidth / 2), boxWidth / 2 - 2 * screwM, -0.01]) {
            cylinder(h=shelfThickness+0.02,r=screwM/2);
        }
        translate([(0 + 2 * screwM), boxWidth / 2 - 2 * screwM, -0.01]) {
            cylinder(h=shelfThickness+0.02,r=screwM/2);
        }
        translate([(boxWidth - 2 * screwM), boxWidth / 2 - 2 * screwM, -0.01]) {
            cylinder(h=shelfThickness+0.02,r=screwM/2);
        }
    }
}

mainShelf();

rotate([-90, 0, 0]) {
    supportShelf();
}

module supportTriangle() {
    union() {
        linear_extrude(shelfThickness) {
            polygon([[0,-boxWidth/2 + (0 * shelfThickness)], [0,0], [boxWidth / 2 - shelfThickness,0]]);
        }
        translate([-shelfThickness, -boxWidth / 2 , 0]) {
            cube([shelfThickness, tabSize, shelfThickness]);
        }
        translate([boxWidth / 2 - tabSize - shelfThickness, 0]) {
            cube([tabSize,shelfThickness , shelfThickness]);
        }
    }
}

translate([(boxWidth / 4) - (shelfThickness/ 2),shelfThickness, 0]) {
    rotate([90, 0, 90]) {
        supportTriangle();
    }
}

