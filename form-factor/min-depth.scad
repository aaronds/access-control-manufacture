lidWidth = 118;
lidLength = 160;
lidFullHeight = 17.5;
lidThickness = 19.64 - 17.6;
screwWidth = 98;
screwLength = 141.2;
screwM = 3.1;
boltInsertM=4.5;
boltInsertDepth=8;

mountM=5;

tableThickness=0.6;
wallWidth=2;
wallHeight=20;
$fn=100;

viceSize = 20;
viceLength = 100;

cornerRadius=10;

portSize=15;

difference() {
    union() {
        translate([-lidWidth / 2, -lidLength / 2, 0]) {
            color("brown") cube([lidWidth, lidLength, tableThickness]);

        }

        translate([-lidWidth / 2, -lidLength / 2 + cornerRadius, tableThickness]) {
            cube([wallWidth, lidLength - 2 * cornerRadius, wallHeight]);
        }

        translate([lidWidth / 2 - wallWidth, -lidLength / 2 + cornerRadius, tableThickness]) {
            cube([wallWidth, lidLength - 2 * cornerRadius, wallHeight]);
        }

        translate([-lidWidth / 2 + cornerRadius, -lidLength / 2, tableThickness]) {
            cube([lidWidth - 2 * cornerRadius, wallWidth, wallHeight]);
        }

        translate([-lidWidth / 2 + cornerRadius, lidLength / 2 - wallWidth, tableThickness]) {
            cube([lidWidth - 2 * cornerRadius, wallWidth, wallHeight]);
        }

        translate([-lidWidth / 2, lidLength / 2 - cornerRadius, 0]) {
            cube([cornerRadius, cornerRadius, tableThickness + wallHeight]);
        }

        translate([lidWidth / 2 - cornerRadius, lidLength / 2 - cornerRadius, 0]) {
            cube([cornerRadius, cornerRadius, tableThickness + wallHeight]);
        }

        translate([-lidWidth / 2, -lidLength / 2, 0]) {
            cube([cornerRadius, cornerRadius, tableThickness + wallHeight]);
        }

        translate([lidWidth / 2 - cornerRadius, -lidLength / 2, 0]) {
            cube([cornerRadius, cornerRadius, tableThickness + wallHeight]);
        }

        translate([0, screwLength / 2, -0.01]) {
            translate([-screwWidth / 2, 0, 0]) {
                cylinder(r=boltInsertM/2 + wallWidth, h=tableThickness + wallHeight);
            }
            translate([screwWidth / 2, 0, 0]) {
                cylinder(r=boltInsertM/2 + wallWidth, h=tableThickness  + wallHeight);
            }
        }

        translate([0, -screwLength / 2, -0.01]) {
            translate([-screwWidth / 2, 0, 0]) {
                cylinder(r=boltInsertM/2 + wallWidth, h=tableThickness + wallHeight);
            }
            translate([screwWidth / 2, 0, 0]) {
                cylinder(r=boltInsertM/2 + wallWidth, h=tableThickness + wallHeight);
            }
        }

        
    }

    translate([-lidWidth /  2, lidLength / 2 - cornerRadius , -0.01]) {
        curveCorner(cornerRadius, wallHeight + tableThickness + 0.02);
    }
    
    translate([-lidWidth /  2 + cornerRadius, -lidLength / 2, -0.01]) {
        rotate([0,0,90]) {
            curveCorner(cornerRadius, wallHeight + tableThickness + 0.02);
        }
    }

    translate([lidWidth /  2, -lidLength / 2 + cornerRadius, -0.01]) {
        rotate([0,0,180]) {
            #curveCorner(cornerRadius, wallHeight + tableThickness + 0.02);
        }
    }

    translate([lidWidth /  2 - cornerRadius, lidLength / 2, -0.01]) {
        rotate([0,0,270]) {
            #curveCorner(cornerRadius, wallHeight + tableThickness + 0.02);
        }
    }

    translate([0, screwLength / 2, -0.01]) {
        translate([-screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.2 + wallHeight);
        }
        translate([screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.1 + wallHeight);
        }
    }

    translate([0, -screwLength / 2, -0.01]) {
        translate([-screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.2 + wallHeight);
        }
        translate([screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.2 + wallHeight);
        }
    }

    translate([0, screwLength / 2, -0.01]) {
        translate([-screwWidth / 2, 0, 0]) {
            cylinder(r=boltInsertM/2, h=boltInsertDepth);
        }
        translate([screwWidth / 2, 0, 0]) {
            cylinder(r=boltInsertM/2, h=boltInsertDepth);
        }
    }

    translate([0, -screwLength / 2, -0.01]) {
        translate([-screwWidth / 2, 0, 0]) {
            cylinder(r=boltInsertM/2, h=boltInsertDepth);
        }
        translate([screwWidth / 2, 0, 0]) {
            cylinder(r=boltInsertM/2, h=boltInsertDepth);
        }
    }

    translate([lidWidth / 2 - wallWidth - 0.01, cornerRadius + -lidLength / 4 - portSize, tableThickness + (wallHeight - portSize) / 2 + portSize / 2]) {
        rotate([0, 90, 0]) {
            cylinder(r=portSize/2,h=wallWidth + 0.02);
        }
    }

    translate([lidWidth / 2 - wallWidth - 0.01, cornerRadius + -lidLength / 4 + portSize, tableThickness + (wallHeight - portSize) / 2 + portSize / 2]) {
        rotate([0, 90, 0]) {
            cylinder(r=portSize/2,h=wallWidth + 0.02);
        }
    }
}

translate([-lidWidth / 2 - mountM  - 2 * wallWidth, lidLength / 2 - cornerRadius - (mountM + 2 * wallWidth), 0]) {
    difference() {
        union() {
            cube([mountM + 2 * wallWidth, mountM + 2 * wallWidth, 2 * wallWidth]);

            translate([0, mountM / 2 + wallWidth, 0]) {
                cylinder(r=mountM/2 + wallWidth,h=2 * wallWidth);
            }
        }
        
        translate([0, mountM / 2 + wallWidth, -0.01]) {
            cylinder(r=mountM/2,h=2 * wallWidth + 0.02);
        }
        
    }

}

translate([-lidWidth / 2 - mountM  - 2 * wallWidth, -lidLength / 2 + cornerRadius, 0]) {
    difference() {
        union() {
            cube([mountM + 2 * wallWidth, mountM + 2 * wallWidth, 2 * wallWidth]);

            translate([0, mountM / 2 + wallWidth, 0]) {
                cylinder(r=mountM/2 + wallWidth,h=2 * wallWidth);
            }
        }
        
        translate([0, mountM / 2 + wallWidth, -0.01]) {
            cylinder(r=mountM/2,h=2 * wallWidth + 0.02);
        }
        
    }

}

translate([lidWidth / 2, lidLength / 2 - cornerRadius - (mountM + 2 * wallWidth), 0]) {
    difference() {
        union() {
            cube([mountM + 2 * wallWidth, mountM + 2 * wallWidth, 2 * wallWidth]);

            translate([mountM + 2 * wallWidth, mountM / 2 + wallWidth, 0]) {
                cylinder(r=mountM/2 + wallWidth,h=2 * wallWidth);
            }
        }
        
        translate([mountM + 2 * wallWidth, mountM / 2 + wallWidth, -0.01]) {
            cylinder(r=mountM/2,h=2 * wallWidth + 0.02);
        }
        
    }

}

translate([lidWidth / 2, - lidLength / 2 + cornerRadius , 0]) {
    difference() {
        union() {
            cube([mountM + 2 * wallWidth, mountM + 2 * wallWidth, 2 * wallWidth]);

            translate([mountM + 2 * wallWidth, mountM / 2 + wallWidth, 0]) {
                cylinder(r=mountM/2 + wallWidth,h=2 * wallWidth);
            }
        }
        
        translate([mountM + 2 * wallWidth, mountM / 2 + wallWidth, -0.01]) {
            cylinder(r=mountM/2,h=2 * wallWidth + 0.02);
        }
        
    }

}


module curveCorner(radius=8,thickness=3) {
    difference() {
        cube([radius, radius, thickness]);
        translate([radius, 0 , -0.01]) {
            cylinder(r=radius, h=thickness + 0.02);
        }
   }
}
