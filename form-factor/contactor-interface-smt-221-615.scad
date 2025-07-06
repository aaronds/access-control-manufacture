fullContactorWidth=45; /*45.3*/
centerWingWidth=18;
centerInnerWingWidth=14;
centerInnerGap=9; /*8.9*/
centerOuterGap=22;
centerToPortEdge = centerOuterGap;
centerWingWall=2.25;
centerWingDepth=10.5;
centerWingSlotDepth=7;
centerToFarEdge = 19;
slotGap = 0.15;
pcbWidth=50;
pcbLength=66;
zeroOffsetToContactorCenter=-5;
pcbWallWidth=2;
pcbClearance=0.5;
pcbClearanceTop=1;
sideWidth = (fullContactorWidth - centerOuterGap) / 2 - centerWingWall;
gapWidth = fullContactorWidth / 2 - sideWidth;
verticalSupportWidth = 20;

wago221s615 = [36.3, 21.0 - 4, 9.8];
wago221s613 = [22.9, 21.0 - 4, 9.8];
wagoWallWidthH = 1;
wagoWallWidthV = 2;
wagoWireD = 6;
wagoLeaverOffset = 4;
wagoInterallWall = 0.8;

psuHeight = 3 * wagoWallWidthH + 3 * wago221s615[2];/*22.5*/

use <pcb-models.scad>
use <relay-current-enclosure.scad>
include <pcb-model-sizes.scad>

module contactorInterfaceSMT615() {

    difference() {
        translate([-fullContactorWidth / 2, 0, 0]) {
            union() {
                sideWidth = (fullContactorWidth - centerOuterGap) / 2 - centerWingWall;
                cube([fullContactorWidth, centerToFarEdge / 2 + 3, 2 * centerWingWall]);
            }
        }
        translate([-centerInnerGap / 2 - centerWingWall - slotGap, 0, 0]) {
            cube([centerWingWall + slotGap, centerWingDepth, centerWingWall]);
        }

        translate([-centerInnerGap / 2 - 2 * centerWingWall, 0, 0]) {
            cube([centerWingWall, centerWingWall, centerWingWall]);
        }

        translate([centerInnerGap / 2, 0, 0]) {
            cube([centerWingWall + slotGap, centerWingDepth, centerWingWall]);
        }

        translate([centerInnerGap / 2 + 1 * centerWingWall, 0, 0]) {
            cube([centerWingWall, centerWingWall, centerWingWall]);
        }

        translate([-centerInnerGap / 2 - (centerWingWall * 2), 0, centerWingWall]) {
            cube([2 * centerWingWall, centerWingDepth, centerWingWall]);
        }

        translate([centerInnerGap / 2 - (centerWingWall * 0), 0, centerWingWall]) {
            cube([2 * centerWingWall, centerWingDepth, centerWingWall]);
        }
    }

    halfWidthNotWago = (pcbWidth - wago221s615[0] - 2 * wagoWallWidthV)/2;

    translate([fullContactorWidth / 2 + pcbWallWidth - (wago221s615[0] + 2 * wagoWallWidthV), pcbLength / 2 + zeroOffsetToContactorCenter - (wago221s615[1] + wagoWallWidthV) + pcbWallWidth, /*centerWingWall * 2 + pcbClearance*/]){
        wagoPort615();
        translate([0, 0, wagoWallWidthH + wago221s615[2]]) {
            wagoPort615();
        }
        translate([0, 0, 2 * wagoWallWidthH + 2 * wago221s615[2]]) {
            wagoPort615();
        }
    }

    translate([fullContactorWidth / 2 + pcbWallWidth - pcbThickness - solderThickness - wallThickness , zeroOffsetToContactorCenter + pcbLength / 2 + 1 * pcbWallWidth - wago221s615[1] - 3 * wagoWallWidthH - pcbCurrentSensorSize[0] - pcbContactorPsuSize[0] - 2 * wallThickness - partitionThickness + 2.5, 0]) {
        maxOuterSize = 2 * wallThickness + max(pcbCurrentSensorSize[1], pcbContactorPsuSize[1]) + centerWingWall * 2 + 1 * pcbClearance + wagoWallWidthV;
        difference() {
            cube([pcbThickness + solderThickness + wallThickness, pcbCurrentSensorSize[0] + pcbContactorPsuSize[0] + 2 * wallThickness + partitionThickness + 0, maxOuterSize]);
            translate([-0.01, wallThickness, centerWingWall * 2 + 1 * pcbClearance + 0.5 + wagoWallWidthV]) {
                cube([pcbThickness + solderThickness, pcbCurrentSensorSize[0], pcbCurrentSensorSize[1]]);
            }

            translate([-0.01, wallThickness + pcbCurrentSensorSize[0] + partitionThickness,centerWingWall * 2 + 1 * pcbClearance + 0.5 + wagoWallWidthV]) {
                cube([pcbThickness + solderThickness, pcbContactorPsuSize[0], pcbContactorPsuSize[1]]);
            }
        }

        translate([-wago221s615[2] - 2 * wagoWallWidthH - wago221s615[2], wago221s615[1] + 1.5 * wagoWireD + wallThickness , 2 * centerWingWall + wagoWallWidthH + 0.5]) {

            rotate([180, -90, 0]) { 
                wagoPort613(true);
            }

            translate([0,0,(maxOuterSize - (2 * centerWingWall + wagoWallWidthH)) -  wago221s613[0]]) {
                rotate([180, -90, 0]) { 
                    #wagoPort613(true);
                }
            }

            translate([wago221s615[2] + 2 * wagoWallWidthH, -wago221s615[1] - wagoWallWidthV, 0]) {
                cube([wago221s615[2], wago221s615[1] + wagoWallWidthV, wallThickness]);

                translate([-wagoWallWidthH, 0, 0]) {
                    cube([wagoWallWidthH, wago221s615[1] + wagoWallWidthV, maxOuterSize - (2 * centerWingWall + wagoWallWidthH) - 0.5]);
                }

                translate([0, 0, (maxOuterSize - (2 * centerWingWall + wagoWallWidthH)) - wagoWallWidthV]) {
                    cube([wago221s615[2], wago221s615[1] + wagoWallWidthV, wallThickness]);
                }
            }
        }

    }


    *translate([fullContactorWidth / 2 - solderThickness,-14,pcbCurrentSensorSize[1] + centerWingWall * 2 + 2 * pcbClearance + wagoWallWidthV]) {
        rotate([90, 0, 0]) {
            rotate([0,-90, 0]) {
                color("green") pcbCurrentSensor();
            }
        }
    }

    *translate([fullContactorWidth / 2 - solderThickness,11, centerWingWall * 2 + 2 * pcbClearance + wagoWallWidthV]) {
        psuVertical();
    }
}

module psuVertical() {
    translate([-1.0,7.5,0]) {
        rotate([0, 0, 0]) {
            rotate([0,-90, 0]) {
                color("green") pcbContactorPsu();
            }
        }
    }
}


module wagoPort615() {  
    difference(){
        cube([wago221s615[0] + 2 * wagoWallWidthV, wago221s615[1] + wagoWallWidthV, wago221s615[2] + 2 * wagoWallWidthH]);
        translate([wagoWallWidthV, wagoWallWidthV, wagoWallWidthH]) {
            cube([wago221s615[0], wago221s615[1] + 0.01, wago221s615[2]]);
        }
    }
}

module wagoPort613(open=false) {  
    difference(){
        cube([wago221s613[0] + 2 * wagoWallWidthV, wago221s613[1] + wagoWallWidthV, wago221s613[2] + 2 * wagoWallWidthH]);
        translate([wagoWallWidthV, wagoWallWidthV, wagoWallWidthH]) {
            cube([wago221s613[0], wago221s613[1] + 0.01, wago221s613[2]]);
        }

        if (open) {
            translate([wagoWallWidthV + wagoInterallWall,wagoWallWidthV + wagoLeaverOffset,-0.01]) {
                cube([wago221s613[0] - 2 * wagoInterallWall, wago221s613[1] - wagoLeaverOffset + 0.01, wagoWallWidthH + 0.02]);
            }
        }
    }
}

module maxWidthPort() {
    difference() {
        cube([pcbWallWidth * 2 + pcbWidth, wago221s615[1] + pcbWallWidth, wago221s615[2] + 2 * pcbWallWidth]);
        translate([pcbWallWidth, -0.01, pcbWallWidth]) {
            cube([pcbWidth, wago221s615[1] + 0.01, wago221s615[2]]);
        }
    }
}


contactorInterfaceSMT615();
