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

wago221s415 = [30.2, 18.6 - 1.5, 8.6];
wago221s413 = [18.7, 18.6 - 1.5, 8.4];
wagoWallWidthH = 1;
wagoWallWidthV = 2;

jstWireThickness = 2;

psuHeight = 3 * wagoWallWidthH + 3 * wago221s415[2];/*22.5*/

use <pcb-models.scad>
use <relay-current-enclosure.scad>
include <pcb-model-sizes.scad>

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

halfWidthNotWago = (pcbWidth - wago221s415[0] - 2 * wagoWallWidthV)/2;

*translate([-pcbWidth / 2 - pcbWallWidth, -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, 0]) {
    cube([pcbWallWidth + halfWidthNotWago , pcbLength + 2 * pcbWallWidth, centerWingWall * 2 + pcbClearance]);
}


*translate([pcbWidth / 2 - halfWidthNotWago , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, 0]) {
    cube([pcbWallWidth + halfWidthNotWago, pcbLength + 2 * pcbWallWidth, centerWingWall * 2 + pcbClearance]);
}

*pcbWalls(showEnds=false);

translate([fullContactorWidth / 2 + pcbWallWidth - (wago221s415[0] + 2 * wagoWallWidthV), pcbLength / 2 + zeroOffsetToContactorCenter - (wago221s415[1] + wagoWallWidthV) + pcbWallWidth, /*centerWingWall * 2 + pcbClearance*/]){
    wagoPort415();
    translate([0, 0, wagoWallWidthH + wago221s415[2]]) {
        wagoPort415();
    }
    translate([0, 0, 2 * wagoWallWidthH + 2 * wago221s415[2]]) {
        wagoPort415();
    }
}

/*

translate([pcbWidth / 2 + pcbWallWidth , zeroOffsetToContactorCenter + pcbLength / 2 + 1 * pcbWallWidth ,wagoWallWidthV  + wago221s415[2]]) {
    translate([-(pcbWallWidth + halfWidthNotWago), -(wago221s415[1] + wagoWallWidthV), -(wagoWallWidthV  + wago221s415[2])]) {
        cube([pcbWallWidth + halfWidthNotWago, wago221s415[1] + wagoWallWidthV, wago221s415[2] + 1 * wagoWallWidthV]);
    }
    rotate([90,-90,0]) {
        wagoPort415();
    }
}

translate([pcbWidth / 2 + pcbWallWidth , zeroOffsetToContactorCenter + pcbLength / 2 + 1 * pcbWallWidth - wagoWallWidthH - 0.01 - wago221s415[2] ,wagoWallWidthV  + wago221s415[2]]) {
    rotate([90,-90,0]) {
        wagoPort415();
    }
}
*/

translate([fullContactorWidth / 2 + pcbWallWidth - pcbThickness - solderThickness - wallThickness , zeroOffsetToContactorCenter + pcbLength / 2 + 1 * pcbWallWidth - wago221s415[1] - 3 * wagoWallWidthH - pcbCurrentSensorSize[0] - pcbContactorPsuSize[0] - 2 * wallThickness - partitionThickness + 2.5, 0]) {
    difference() {
        cube([pcbThickness + solderThickness + wallThickness, pcbCurrentSensorSize[0] + pcbContactorPsuSize[0] + 2 * wallThickness + partitionThickness + 0, 2 * wallThickness + max(pcbCurrentSensorSize[1], pcbContactorPsuSize[1]) + centerWingWall * 2 + 1 * pcbClearance]);
        translate([-0.01, wallThickness, centerWingWall * 2 + 1 * pcbClearance + 0.5]) {
            cube([pcbThickness + solderThickness, pcbCurrentSensorSize[0], pcbCurrentSensorSize[1]]);
        }

        translate([-0.01, wallThickness + pcbCurrentSensorSize[0] + partitionThickness,centerWingWall * 2 + 1 * pcbClearance + 0.5]) {
            cube([pcbThickness + solderThickness, pcbContactorPsuSize[0], pcbContactorPsuSize[1]]);
        }
    }
}


*translate([fullContactorWidth / 2,-18,pcbCurrentSensorSize[1] + centerWingWall * 2 + 2 * pcbClearance]) {
    rotate([90, 0, 0]) {
        rotate([0,-90, 0]) {
            color("green") pcbCurrentSensor();
        }
    }
}

*translate([fullContactorWidth / 2,6, centerWingWall * 2 + 2 * pcbClearance]) {
    psuVertical();
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


module pcbWalls(showEnds=true,extraHeight = 0) {
    wallGap = wago221s415[0]/2;

    translate([-pcbWidth / 2 - pcbWallWidth, -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, centerWingWall * 2]) {
        cube([pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
    }

    translate([pcbWidth / 2 , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, centerWingWall * 2]) {
        cube([pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
    }

    if (showEnds) {
        translate([pcbWidth / 2 - (pcbWidth / 2 - wallGap) , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth,centerWingWall * 2]) {
           cube([pcbWallWidth + (pcbWidth / 2 - wallGap), pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
        }
    }

    translate([-pcbWidth / 2 - pcbWallWidth , pcbLength / 2 + zeroOffsetToContactorCenter,centerWingWall * 2]) {
       cube([pcbWallWidth + (pcbWidth / 2 - wallGap), pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
    }

    if (showEnds) {
        translate([-pcbWidth / 2 - pcbWallWidth , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth,centerWingWall * 2]) {
           cube([pcbWallWidth + (pcbWidth / 2 - wallGap), pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
        }
    }

    translate([pcbWidth / 2 - (pcbWidth / 2 - wallGap) , pcbLength / 2 + zeroOffsetToContactorCenter,centerWingWall * 2]) {
       cube([pcbWallWidth + (pcbWidth / 2 - wallGap), pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
    }
}

module wagoPort415() {  
    difference(){
        cube([wago221s415[0] + 2 * wagoWallWidthV, wago221s415[1] + wagoWallWidthV, wago221s415[2] + 2 * wagoWallWidthH]);
        translate([wagoWallWidthV, wagoWallWidthV, wagoWallWidthH]) {
            cube([wago221s415[0], wago221s415[1] + 0.01, wago221s415[2]]);
        }
    }
}

module maxWidthPort() {
    difference() {
        cube([pcbWallWidth * 2 + pcbWidth, wago221s415[1] + pcbWallWidth, wago221s415[2] + 2 * pcbWallWidth]);
        translate([pcbWallWidth, -0.01, pcbWallWidth]) {
            cube([pcbWidth, wago221s415[1] + 0.01, wago221s415[2]]);
        }
    }
}
