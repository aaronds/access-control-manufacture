xOffset = -0.0045;
yOffset = 0.012;
pcbWidth = 80.2955 - xOffset;
pcbHeight = 36.812 - yOffset;
pcbThickness = 1.7;
lidToCopper=15.57;
lidToIndicatorTop=28.18;
lidToSwitchContactTop=20.08;
wallThickness = 2;
thinGap = 0.5;
lidToRim=13.13;

padX = 5;
padY = 10;

nPadCenter = [3.451803, 11.711994];
lPadCenter = [16.539201, 11.711994];
lampCutoutRadius = 6.231573;

lampCutoutPos = [nPadCenter[0] - (padX / 2), nPadCenter[1] - (padY / 2)];
lampCutoutSize = [(lPadCenter[0] + (padX / 2)) - (nPadCenter[0] - (padX / 2)), lampCutoutRadius * 2];

nInPad = [9.845502, 32.211994];
lInPad = [24.845502, 32.211994];
sInPad = [34.645502, 32.561994];
oInPad = [44.895502, 32.561994];

slotWidth = 10;
slotHeight = 30;

conLedCenter = [69.695502, 17.611994];
conOptCenter = [73.745502, 28.046994];

conOptSize = [7.6, 10];
conLedSize = [12.35, 6.1];


/*mirror([1,0,0]) {*/
    translate([-(pcbWidth/2 + xOffset), 0, 0]){
        translate([-wallThickness - xOffset, -wallThickness - yOffset, -wallThickness]) {
            difference() {
                cube([2 * wallThickness + pcbWidth, 2 * wallThickness + pcbHeight, 2 * wallThickness + lidToSwitchContactTop]);
                translate([wallThickness, wallThickness, wallThickness]) {
                    cube([pcbWidth, pcbHeight, wallThickness + lidToSwitchContactTop + 0.01]);

                    translate([lampCutoutPos[0] - thinGap, lampCutoutPos[1] - thinGap,-wallThickness -0.01]) {
                        cube([lampCutoutSize[0] + 2 * thinGap, lampCutoutSize[1] + 2 * thinGap, wallThickness + 0.02]);
                    }

                    translate([0, 0, (lidToSwitchContactTop - (lidToSwitchContactTop - lidToCopper)) - 5  /*- slotHeight*/]) {
                        translate([nInPad[0] - slotWidth / 2, pcbHeight - 0.01, 0]) {
                            cube([slotWidth, wallThickness + 0.02, slotHeight]);
                        }

                        translate([lInPad[0] - slotWidth / 2, pcbHeight - 0.01, 0]) {
                            cube([slotWidth, wallThickness + 0.02, slotHeight]);
                        }

                        translate([sInPad[0] - slotWidth / 4, pcbHeight - 0.01, 0]) {
                            cube([slotWidth / 2, wallThickness + 0.02, slotHeight]);
                        }

                        translate([oInPad[0] - slotWidth / 2, pcbHeight - 0.01, 0]) {
                            cube([slotWidth, wallThickness + 0.02, slotHeight]);
                        }
                    }

                    translate([conOptCenter[0] - conOptSize[0] / 2, conOptCenter[1] - conOptSize[1] / 2, -wallThickness - 0.01]) {
                        cube([conOptSize[0] + 10, conOptSize[1],wallThickness + (lidToSwitchContactTop - lidToCopper) + pcbThickness  + 0.02 + 30]);
                    }


                    translate([pcbWidth - 0.01, conLedCenter[1] - conLedSize[1] / 2, -wallThickness - 0.01]) {
                        cube([wallThickness + 0.02, conLedSize[1],wallThickness + (lidToSwitchContactTop - lidToCopper) + pcbThickness + 0.02 + 30]);
                    }
                }
            }

            translate([wallThickness, wallThickness, wallThickness]) {
                translate([conOptCenter[0] - conOptSize[0] / 2 - wallThickness, conOptCenter[1] - conOptSize[1] / 2, 0]) {
                    cube([wallThickness, conOptSize[1], (lidToSwitchContactTop - lidToCopper)]);
                }
                translate([conOptCenter[0] - conOptSize[0] / 2 - wallThickness, conOptCenter[1] - conOptSize[1] / 2 - wallThickness, 0]) {
                    cube([conOptSize[1] + wallThickness + 1, wallThickness, (lidToSwitchContactTop - lidToCopper)]);
                }
                translate([conOptCenter[0] - conOptSize[0] / 2 - wallThickness, conOptCenter[1] + conOptSize[1] / 2 , 0]) {
                    cube([conOptSize[1] + wallThickness + 1, wallThickness, (lidToSwitchContactTop - lidToCopper)]);
                }
            }
        }
    }
/*}*/
