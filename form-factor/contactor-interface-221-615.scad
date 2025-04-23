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

hsLogoScale=0.035;
hsLogoSize = [131.06, 131.322];
hsTransform = [-125.53331,-274.74036];
hsLogoDepth=0.5;

wago221s615 = [36.3, 21.0 - 4, 9.8];
//wago221s613 = [18.7, 18.6 - 1.5, 8.4];
wagoWallWidthH = 1;
wagoWallWidthV = 2;

psuHeight = 3 * wagoWallWidthH + 3 * wago221s615[2];/*22.5*/

halfWidthNotWago = (pcbWidth - wago221s615[0] - 2 * wagoWallWidthV)/2;

module contactorInterface() {
    difference() {
        translate([-fullContactorWidth / 2, 0, 0]) {
            union() {
                sideWidth = (fullContactorWidth - centerOuterGap) / 2 - centerWingWall;
                cube([fullContactorWidth, centerToFarEdge / 2 + 3, 2 * centerWingWall]);
                /*
                translate([0, -centerToFarEdge,0]) {
                    #cube([sideWidth, centerToFarEdge, 2 * centerWingWall]);
                }
                translate([fullContactorWidth - sideWidth, -centerToFarEdge,0]) {
                    cube([sideWidth, centerToFarEdge, 2 * centerWingWall]);
                }
                */
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
        cube([pcbWallWidth + halfWidthNotWago , pcbLength + 2 * pcbWallWidth, centerWingWall * 2 + pcbClearance]);
    }


    translate([pcbWidth / 2 - halfWidthNotWago , -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, 0]) {
        cube([pcbWallWidth + halfWidthNotWago, pcbLength + 2 * pcbWallWidth, centerWingWall * 2 + pcbClearance]);
    }

    pcbWalls(showEnds=false);

    /*
    translate([-pcbWidth / 2 - pcbWallWidth, zeroOffsetToContactorCenter - verticalSupportWidth / 2, centerWingWall * 2]) {
        cube([pcbWallWidth, verticalSupportWidth, psuHeight]);
    }

    translate([pcbWidth / 2, zeroOffsetToContactorCenter - verticalSupportWidth / 2, centerWingWall * 2]) {
        cube([pcbWallWidth, verticalSupportWidth, psuHeight]);
    }
    */

    translate([-(wago221s615[0] + 2 * wagoWallWidthV) / 2, pcbLength / 2 + zeroOffsetToContactorCenter - (wago221s615[1] + wagoWallWidthV) + pcbWallWidth, /*centerWingWall * 2 + pcbClearance*/]){
        difference() {
            union() {
                wagoPort615();
                translate([0, 0, wagoWallWidthH + wago221s615[2]]) {
                    wagoPort615();
                }
                translate([0, 0, 2 * wagoWallWidthH + 2 * wago221s615[2]]) {
                    wagoPort615();
                }
            }
            translate([wago221s615[0] + 2 * wagoWallWidthV - hsLogoDepth + 0.01, wago221s615[1] / 2 + 0.5, (3 * wago221s615[2] + 2 * wagoWallWidthH)/2 + 5]) {
                rotate([0, 90, 0]) {
                    contactorHSLogo(); 
                }
            }

            translate([hsLogoDepth - 0.01, wago221s615[1] / 2 + 0.5, (3 * wago221s615[2] + 2 * wagoWallWidthH)/2 + 5]) {
                rotate([0, -90, 0]) {
                    contactorHSLogo(); 
                }
            }
        }
    }

    translate([0,0, psuHeight]) {
        translate([-pcbWidth / 2 - pcbWallWidth, zeroOffsetToContactorCenter - pcbLength / 2 - pcbWallWidth,0]) {
            cube([pcbWidth + 2 * pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbClearanceTop]);
        }
        translate([0,0,-2 * centerWingWall]){
            pcbWalls(extraHeight=pcbClearanceTop);
        }

        translate([-pcbWidth/2 - pcbWallWidth, zeroOffsetToContactorCenter - pcbLength / 2 - pcbWallWidth, -wago221s615[2] - pcbWallWidth * 2 ]) {
            maxWidthPort();
        }
    }

    translate([-pcbWidth / 2 - pcbWallWidth, zeroOffsetToContactorCenter -pcbLength / 2 - pcbWallWidth, centerWingWall * 2]) {
        difference() {
            cube([pcbWallWidth, pcbWallWidth + wago221s615[1], psuHeight - 1]);
            translate([hsLogoDepth - 0.01, (pcbWallWidth + wago221s615[1]) / 2, psuHeight - 5]) {
                rotate([90, 0, -90]) {
                    linear_extrude(hsLogoDepth) {
                        text("221-615", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
                
                translate([0,0,-10]) {
                    rotate([90, 0, -90]) {
                        linear_extrude(hsLogoDepth) {
                            text("TURN", size=3.5, halign="center", font = "Liberation Sans");
                        }
                    }
                }

                translate([0,0,-15]) {
                    rotate([90, 0, -90]) {
                        linear_extrude(hsLogoDepth) {
                            text("OFF", size=3.5, halign="center", font = "Liberation Sans");
                        }
                    }
                }

                translate([0,0,-20]) {
                    rotate([90, 0, -90]) {
                        linear_extrude(hsLogoDepth) {
                            text("POWER", size=3.5, halign="center", font = "Liberation Sans");
                        }
                    }
                }
            }
        }
    }

    translate([pcbWidth / 2, zeroOffsetToContactorCenter -pcbLength / 2 - pcbWallWidth, centerWingWall * 2]) {
        difference() {
            cube([pcbWallWidth, pcbWallWidth + wago221s615[1], psuHeight - 1]);

            translate([pcbWallWidth - hsLogoDepth + 0.01, (pcbWallWidth + wago221s615[1]) / 2, psuHeight - 5]) {
                rotate([90, 0, 90]) {
                    linear_extrude(hsLogoDepth) {
                        text("221-615", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
                
                translate([0,0,-10]) {
                    rotate([90, 0, 90]) {
                        linear_extrude(hsLogoDepth) {
                            text("TURN", size=3.5, halign="center", font = "Liberation Sans");
                        }
                    }
                }

                translate([0,0,-15]) {
                    rotate([90, 0, 90]) {
                        linear_extrude(hsLogoDepth) {
                            text("OFF", size=3.5, halign="center", font = "Liberation Sans");
                        }
                    }
                }

                translate([0,0,-20]) {
                    rotate([90, 0, 90]) {
                        linear_extrude(hsLogoDepth) {
                            text("POWER", size=3.5, halign="center", font = "Liberation Sans");
                        }
                    }
                }
            }
        }
    }
}

module pcbWalls(showEnds=true,extraHeight = 0) {
    wallGap = wago221s615[0]/2;

    translate([-pcbWidth / 2 - pcbWallWidth, -pcbLength / 2 + zeroOffsetToContactorCenter - pcbWallWidth, centerWingWall * 2]) {
        difference() {
            cube([pcbWallWidth, pcbLength + 2 * pcbWallWidth, pcbWallWidth * 2 + extraHeight]);
            if (showEnds) {
                translate([-0.01, wago221s615[1] + 2, -0.01]) {
                    cube([pcbWallWidth + 0.02, pcbLength - 2 * wago221s615[1], pcbWallWidth * 2 + extraHeight + 0.02]);
                }
            }
        }
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

/* Logo */

module logoAndText() {
    color("black") translate([-(wago221s615[0] + 2 * wagoWallWidthV) / 2, pcbLength / 2 + zeroOffsetToContactorCenter - (wago221s615[1] + wagoWallWidthV) + pcbWallWidth, /*centerWingWall * 2 + pcbClearance*/]){
        translate([wago221s615[0] + 2 * wagoWallWidthV - hsLogoDepth, wago221s615[1] / 2 + 0.5, (3 * wago221s615[2] + 2 * wagoWallWidthH)/2 + 5]) {
            rotate([0, 90, 0]) {
                contactorHSLogo(); 
            }
        }

        translate([hsLogoDepth, wago221s615[1] / 2 + 0.5, (3 * wago221s615[2] + 2 * wagoWallWidthH)/2 + 5]) {
            rotate([0, -90, 0]) {
                contactorHSLogo(); 
            }
        }
    }

    color("black") translate([-pcbWidth / 2 - pcbWallWidth, zeroOffsetToContactorCenter -pcbLength / 2 - pcbWallWidth, centerWingWall * 2]) {
        translate([hsLogoDepth - 0.01, (pcbWallWidth + wago221s615[1]) / 2, psuHeight - 5]) {
            rotate([90, 0, -90]) {
                linear_extrude(hsLogoDepth) {
                    text("221-615", size=3.5, halign="center", font = "Liberation Sans");
                }
            }
            
            translate([0,0,-10]) {
                rotate([90, 0, -90]) {
                    linear_extrude(hsLogoDepth) {
                        text("TURN", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
            }

            translate([0,0,-15]) {
                rotate([90, 0, -90]) {
                    linear_extrude(hsLogoDepth) {
                        text("OFF", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
            }

            translate([0,0,-20]) {
                rotate([90, 0, -90]) {
                    linear_extrude(hsLogoDepth) {
                        text("POWER", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
            }
        }
    }

    color("black") translate([pcbWidth / 2, zeroOffsetToContactorCenter -pcbLength / 2 - pcbWallWidth, centerWingWall * 2]) {
        translate([pcbWallWidth - hsLogoDepth + 0.01, (pcbWallWidth + wago221s615[1]) / 2, psuHeight - 5]) {
            rotate([90, 0, 90]) {
                linear_extrude(hsLogoDepth) {
                    text("221-615", size=3.5, halign="center", font = "Liberation Sans");
                }
            }
            
            translate([0,0,-10]) {
                rotate([90, 0, 90]) {
                    linear_extrude(hsLogoDepth) {
                        text("TURN", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
            }

            translate([0,0,-15]) {
                rotate([90, 0, 90]) {
                    linear_extrude(hsLogoDepth) {
                        text("OFF", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
            }

            translate([0,0,-20]) {
                rotate([90, 0, 90]) {
                    linear_extrude(hsLogoDepth) {
                        text("POWER", size=3.5, halign="center", font = "Liberation Sans");
                    }
                }
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

module maxWidthPort() {
    difference() {
        cube([pcbWallWidth * 2 + pcbWidth, wago221s615[1] + pcbWallWidth, wago221s615[2] + 2 * pcbWallWidth]);
        translate([pcbWallWidth, -0.01, pcbWallWidth]) {
            cube([pcbWidth, wago221s615[1] + 0.01, wago221s615[2]]);
        }
    }
}


module hackspaceLogo() {
    difference() {
        import("../hackspace_logo.svg");
        import("../hackspace_logo_h.svg");
    }
}


module contactorHSLogo() {
    color("black") linear_extrude(hsLogoDepth) {
        scale(hsLogoScale) {
            translate([hsTransform[0] * 2, 0, 0]) { 
                hackspaceLogo();
            }
        }
    }
}

logoAndText();
