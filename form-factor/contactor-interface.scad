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
sideWidth = (fullContactorWidth - centerOuterGap) / 2 - centerWingWall;
gapWidth = fullContactorWidth / 2 - sideWidth;
psuHeight = 20.5;
verticalSupportWidth = 20;

difference() {
    translate([-fullContactorWidth / 2, 0, 0]) {
        union() {
            sideWidth = (fullContactorWidth - centerOuterGap) / 2 - centerWingWall;
            cube([fullContactorWidth, centerOuterGap, 2 * centerWingWall]);
            translate([0, -centerToFarEdge,0]) {
                cube([sideWidth, centerToFarEdge, 2 * centerWingWall]);
            }
            translate([fullContactorWidth - sideWidth, -centerToFarEdge,0]) {
                cube([sideWidth, centerToFarEdge, 2 * centerWingWall]);
            }
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

translate([-pcbWidth / 2 - pcbWallWidth, -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, 0]) {
    cube([pcbWallWidth + pcbWidth / 2 - gapWidth, pcbLength + 2 * pcbWallWidth, centerWingWall * 2 + pcbWallWidth]);
}


translate([pcbWidth / 2 - (pcbWidth / 2 - gapWidth) , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, 0]) {
    cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbLength + 2 * pcbWallWidth, centerWingWall * 2 + pcbWallWidth]);
}

pcbWalls();

translate([-pcbWidth / 2 - pcbWallWidth, zeroOffsetToContactorCenter - verticalSupportWidth / 2, centerWingWall * 2]) {
    cube([pcbWallWidth, verticalSupportWidth, psuHeight]);
}

translate([pcbWidth / 2, zeroOffsetToContactorCenter - verticalSupportWidth / 2, centerWingWall * 2]) {
    cube([pcbWallWidth, verticalSupportWidth, psuHeight]);
}

translate([0,0,centerWingWall * 2 + psuHeight]) {
    translate([-pcbWidth / 2 - pcbWallWidth, zeroOffsetToContactorCenter - pcbLength / 2 - pcbWallWidth,0]) {
        cube([pcbWidth + 2 * pcbWallWidth, pcbLength + 2 * pcbWallWidth, centerWingWall]);
    }
    translate([0,0,-1 * centerWingWall]){
        pcbWalls();
    }
}

translate([pcbWidth / 2 , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, centerWingWall * 2]) {
    cube([pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbWallWidth * 2]);
}

translate([pcbWidth / 2 - (pcbWidth / 2 - gapWidth) , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth,centerWingWall * 2]) {
   cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
}

translate([-pcbWidth / 2 - pcbWallWidth , pcbLength / 2 + zeroOffsetToContactorCenter,centerWingWall * 2]) {
   cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
}

translate([-pcbWidth / 2 - pcbWallWidth , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth,centerWingWall * 2]) {
   
   cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
}

translate([pcbWidth / 2 - (pcbWidth / 2 - gapWidth) , pcbLength / 2 + zeroOffsetToContactorCenter,centerWingWall * 2]) {
   cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
}

module pcbWalls() {
    translate([-pcbWidth / 2 - pcbWallWidth, -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, centerWingWall * 2]) {
        cube([pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbWallWidth * 2]);
    }

    translate([pcbWidth / 2 , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, centerWingWall * 2]) {
        cube([pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbWallWidth * 2]);
    }

    translate([pcbWidth / 2 - (pcbWidth / 2 - gapWidth) , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth,centerWingWall * 2]) {
       cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
    }

    translate([-pcbWidth / 2 - pcbWallWidth , pcbLength / 2 + zeroOffsetToContactorCenter,centerWingWall * 2]) {
       cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
    }

    translate([-pcbWidth / 2 - pcbWallWidth , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth,centerWingWall * 2]) {
       
       cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
    }

    translate([pcbWidth / 2 - (pcbWidth / 2 - gapWidth) , pcbLength / 2 + zeroOffsetToContactorCenter,centerWingWall * 2]) {
       cube([pcbWallWidth + (pcbWidth / 2 - gapWidth), pcbWallWidth, pcbWallWidth * 2]);
    }
}
