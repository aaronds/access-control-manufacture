include <door-servo-measurements.scad>

module windowWithPeninsula(oceanSize=[300,300], peninsularSize=[100, 100], thickness = 3, cornerRadius = 5) {
    union() {
        minkowski() { 
            difference() {
                translate([cornerRadius,-(oceanSize[1] - (2 * cornerRadius)) / 2,0]) {
                    cube([oceanSize[0] - (2 * cornerRadius), oceanSize[1] - (2 * cornerRadius), thickness - 1]);
                }
                translate([cornerRadius, -(peninsularSize[1] + 2 * cornerRadius) / 2, -0.01]) {
                    cube([peninsularSize[0], peninsularSize[1] + 2 * cornerRadius, thickness + 0.02]);
                }
            }
            cylinder(r=cornerRadius,h=1);
        }

        translate([peninsularSize[0] - cornerRadius + 0.01, peninsularSize[1]/2 - cornerRadius + 0.05,0]){
            cornerRoundCut(r=cornerRadius + 0.1,h=thickness);
        }
        translate([peninsularSize[0] - cornerRadius, -peninsularSize[1]/2 + cornerRadius - 0.05,0]){
            rotate([0,0,-90]) {
                cornerRoundCut(r=cornerRadius + 0.1,h=thickness);
            }
        }
    }
    *color("blue") translate([0,0,0]) {
        difference() {
            translate([0,-oceanSize[1] / 2,0]) {
                cube([oceanSize[0], oceanSize[1], thickness]);
            }
            translate([0, -peninsularSize[1] / 2, -0.01]) {
                cube([peninsularSize[0], peninsularSize[1], thickness + 0.02]);
            }
        }
    }
}

module cornerRoundCut(r=5,h=10) {
    difference() {
        cube([r, r, h]); 
        translate([0,0,-0.01]){
            cylinder(r=r,h=h + 0.02);
        }
    }
}

windowWithPeninsula();

translate([-8, 0, 3]) {
    color("blue") windowWithPeninsula([316,316], [100,84], 3, 8);
}

windowWithPeninsulaHoles();

module windowWithPeninsulaHoles(oceanSize=[300,300], peninsularSize=[100, 100], borderSize=8, boltM=3, thickness=6) {
    oceanSizeBorder = [oceanSize[0] + borderSize, oceanSize[1] + borderSize];
    translate([-borderSize / 2, 0, 0]) {
        for(i=[1:3]) {
            translate([i * oceanSizeBorder[0] / 4, -oceanSizeBorder[1] / 2, 0]) {
                cylinder(r=boltM/2,h=thickness);
            }
            translate([i * oceanSizeBorder[0] / 4, oceanSizeBorder[1] / 2, 0]) {
                cylinder(r=boltM/2,h=thickness);
            }
        }
    }

    translate([oceanSize[0] + borderSize / 2, 0, 0]) {
        for(i=[1:2]) {
            translate([0, i * oceanSizeBorder[1] / 6, 0]) {
                cylinder(r=boltM/2,h=thickness);
            }
            translate([0, -i * oceanSizeBorder[1] / 6, 0]) {
                cylinder(r=boltM/2,h=thickness);
            }
        }
    }

    // Corner holes

    cornerOffset = sqrt(borderSize/2);
    translate([-cornerOffset, -oceanSize[1]/2 - cornerOffset, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    translate([-cornerOffset, oceanSize[1]/2 + cornerOffset, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    translate([oceanSize[0] + cornerOffset, oceanSize[1]/2 + cornerOffset, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }
    
    translate([oceanSize[0] + cornerOffset, -oceanSize[1]/2 - cornerOffset, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    // Peninsular holes

    translate([-cornerOffset, peninsularSize[1] / 2 - cornerOffset, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    translate([-cornerOffset, -peninsularSize[1] / 2 + cornerOffset, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    translate([peninsularSize[0] / 2, peninsularSize[1] / 2 - borderSize / 2, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    translate([peninsularSize[0] / 2, -peninsularSize[1] / 2 + borderSize / 2, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }

    translate([peninsularSize[0] - borderSize / 2, 0, 0]) {
        cylinder(r=boltM/2,h=thickness);
    }
}
