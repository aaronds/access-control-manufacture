include <door-servo-measurements.scad>
$fn=100;

module cabinetHingeFrameSpacer() {
    spacerThickness = cabinetHingeFrameSize[2] + cabinetHingeFrameInsetFace;
    innerRadius = cabinetHingeFrameCornerRadius - cabinetHingeDoorMetalThickness;
    difference() {
        translate([0,-cabinetHingeFrameSize[1]/2, 0]) {
            translate([innerRadius, innerRadius, 0]) {
                minkowski() {
                    cube([cabinetHingeFrameSize[0] - 2 * innerRadius, cabinetHingeFrameSize[1] - 2 * innerRadius, spacerThickness - 1]);
                    cylinder(r=innerRadius - gapToFit,h=1);
                }
            }
        }

        translate([cabinetHingeFrameHoleOne, 0, -0.01]) {
            translate([0,cabinetHingeFrameBoltOffsetHeight,0]) {
                cylinder(r=boltM/2,h=spacerThickness + 0.02);
                translate([0,0,spacerThickness - cabinetHingeFrameInsetFace - gapToFit]) {
                    cylinder(r=cabinetHingeDoorBoltChamferM/2 + gapToFit, h=cabinetHingeFrameInsetFace + gapToFit + 0.02);
                    translate([0,0,-boltHeatInsertLength]) {
                        cylinder(r=boltHeatInsertM/2,h=boltHeatInsertLength + 0.01);
                    }
                }

                cylinder(r=boltHeatInsertM/2,h=boltHeatInsertLength + 0.01);
            }
            translate([0,-cabinetHingeFrameBoltOffsetHeight,0]) {
                cylinder(r=boltM/2,h=spacerThickness + 0.02);
                translate([0,0,spacerThickness - cabinetHingeFrameInsetFace - gapToFit]) {
                    cylinder(r=cabinetHingeDoorBoltChamferM/2 + gapToFit, h=cabinetHingeFrameInsetFace + gapToFit + 0.02);
                    translate([0,0,-boltHeatInsertLength]) {
                        cylinder(r=boltHeatInsertM/2,h=boltHeatInsertLength + 0.01);
                    }
                }

                cylinder(r=boltHeatInsertM/2,h=boltHeatInsertLength + 0.01);
            }
            

        }

        translate([cabinetHingeFrameHoleTwo, 0, -0.01]) {
            translate([0,cabinetHingeFrameBoltOffsetHeight,0]) {
                cylinder(r=boltM/2,h=spacerThickness + 0.02);
                translate([0,0,spacerThickness - cabinetHingeFrameInsetFace / 2]) {
                    cube([cabinetHingeFrameLargeChamferSize[0], cabinetHingeFrameLargeChamferSize[1], cabinetHingeFrameInsetFace + 0.04], center=true);
                }
            }
            translate([0,-cabinetHingeFrameBoltOffsetHeight,0]) {
                cylinder(r=boltM/2,h=spacerThickness + 0.02);
                translate([0,0,spacerThickness - cabinetHingeFrameInsetFace / 2]) {
                    cube([cabinetHingeFrameLargeChamferSize[0], cabinetHingeFrameLargeChamferSize[1], cabinetHingeFrameInsetFace + 0.04], center=true);
                }
            }
        }
    }
}

cabinetHingeFrameSpacer();
