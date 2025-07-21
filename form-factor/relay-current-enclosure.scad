include <pcb-model-sizes.scad>

currentTopStands=[6, 28];
currentBottomStands = [7, 27];
relayTopStands=[9, 42];
relayBottomStands = [12, 41];
standSize = 2;

module relayCurrentCase() {
    maxY = max(pcbCurrentSensorSize[0], pcbDevkitcRelaySize[1]);
    sizeX = 2 * wallThickness + partitionThickness + pcbDevkitcRelaySize[0] + pcbCurrentSensorSize[1];
    relayYOffset = (maxY - pcbDevkitcRelaySize[1]) / 2;
    difference() {
        cube([sizeX, 2 * wallThickness + maxY, wallThickness + pcbThickness + solderThickness]);
        translate([wallThickness - caseMargin, wallThickness + relayYOffset - caseMargin, wallThickness]) {
            cube([pcbDevkitcRelaySize[0] + 2 * caseMargin, pcbDevkitcRelaySize[1] + 2 * caseMargin, pcbThickness + solderThickness + 0.01]);
        }
        translate([wallThickness + pcbDevkitcRelaySize[0] + partitionThickness, wallThickness + (maxY - pcbCurrentSensorSize[0]) / 2, wallThickness]) {
            cube([pcbCurrentSensorSize[1], pcbCurrentSensorSize[0], pcbThickness + solderThickness + 0.01]);
        }
    }
    translate([wallThickness,wallThickness + relayYOffset,wallThickness]) {
        for(stand = relayBottomStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }

    translate([wallThickness,wallThickness + relayYOffset + pcbDevkitcRelaySize[1] - standSize,wallThickness]) {
        for(stand = relayTopStands) {
            translate([stand, 0, 0]){
               #cube([standSize, standSize, solderThickness]);
            }
        }
    }

    translate([wallThickness + pcbDevkitcRelaySize[0] + partitionThickness,wallThickness,wallThickness]) {
        for(stand = currentBottomStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }

    translate([wallThickness + pcbDevkitcRelaySize[0] + partitionThickness,wallThickness + pcbCurrentSensorSize[0] - standSize,wallThickness]) {
        for(stand = currentTopStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }

    translate([0, 0, wallThickness + pcbThickness + solderThickness - 0.01]) {
        translate([wallThickness + caseMargin, 0, 0]) {
            cube([1 * wallThickness, wallThickness, 2 * wallThickness]);
        }

        translate([sizeX - wallThickness - caseMargin - 1 * wallThickness, 0, 0]) {
            cube([1 * wallThickness, wallThickness, 2 * wallThickness]);
        }

        translate([wallThickness + caseMargin, maxY + wallThickness, 0]) {
            cube([2 * wallThickness, wallThickness, 2 * wallThickness]);
        }

        translate([sizeX - wallThickness - caseMargin - 2 * wallThickness, maxY + wallThickness, 0]) {
            cube([2 * wallThickness, wallThickness, 2 * wallThickness]);
        }
    }
}

module relayCurrentCaseTop() {
    maxY = max(pcbCurrentSensorSize[0], pcbDevkitcRelaySize[1]);
    trayHeight = wallThickness + pcbThickness + solderThickness;

    difference() {
        cube([2 * wallThickness + partitionThickness + pcbDevkitcRelaySize[0] + pcbCurrentSensorSize[1], 4 * wallThickness + maxY, wallThickness + pcbThickness + solderThickness + pcbRelayHeight + wallThickness]);
        translate([-0.01, wallThickness - caseMargin, -0.01]) {
            cube([2 * wallThickness + partitionThickness + pcbDevkitcRelaySize[0] + pcbCurrentSensorSize[1] + 0.02, 2 * wallThickness + maxY + 2 * caseMargin, wallThickness + pcbThickness + solderThickness]);
        }
        translate([wallThickness -0.01, wallThickness, wallThickness + pcbThickness + solderThickness - 0.01]) {
            cube([partitionThickness + pcbDevkitcRelaySize[0] + pcbCurrentSensorSize[1] + 0.02, 2 * wallThickness + maxY, pcbRelayHeight + 0.01]);
        }
        for(hole=[[6,6], [33, 6], [51, 6], [pcbDevkitcRelaySize[0] + partitionThickness + 15.5, 6], [pcbDevkitcRelaySize[0] + partitionThickness + 39, 6]]) {
            translate([wallThickness + hole[0] - hole[1] / 2, - 0.01, 0]) {
                cube([hole[1], wallThickness + 0.02, trayHeight + hole[1]]);
            }
        }
        for(hole=[[16,6], [46, 4], [pcbDevkitcRelaySize[0] + partitionThickness + 28.5, 6]]) {
            translate([wallThickness + hole[0] - hole[1] / 2, 3 * wallThickness + maxY - 0.01, 0]) {
                cube([hole[1], wallThickness + 0.02, trayHeight + hole[1]]);
            }
        }
    }
}

module smtLvSled() {
    maxY = max(pcbCurrentSensorSize[0], pcbDevkitcRelaySize[1]);

    offsetY = maxY + (2 * wallThickness) - (pcbSmtLvSize[1] + 2 * wallThickness);

    difference() {
        union() {
            translate([0, 0, 0]) {
                cube([pcbSmtLvSize[0] + 2 * wallThickness, pcbSmtLvSize[1] + 2 * wallThickness, wallThickness + pcbTallCompoent + pcbThickness]);
            }
        }
        translate([wallThickness, 1 * wallThickness, wallThickness]) {
            cube([pcbSmtLvSize[0], pcbSmtLvSize[1] + 0 * wallThickness + 0.01, pcbTallCompoent + pcbThickness + 0.01]);
        }

        translate([wallThickness, wallThickness, pcbTallCompoent / 2]) {
            cube([pcbSmtLvSize[0], pcbSmtLvSize[1] + wallThickness + 0.01, pcbTallCompoent / 2 + pcbThickness + wallThickness + 0.01]);
        }
    }
    translate([pcbSmtLvSize[0] / 4 - wallThickness, wallThickness, wallThickness]) {
        cube([wallThickness * 2, wallThickness * 3, pcbTallCompoent]);
    }
    translate([ 3 * pcbSmtLvSize[0] / 4 - wallThickness, wallThickness, wallThickness]) {
        cube([wallThickness * 2, wallThickness * 3, pcbTallCompoent]);
    }

    translate([pcbSmtLvSize[0] / 4 - wallThickness, wallThickness, wallThickness]) {
        cube([wallThickness * 2, wallThickness * 3, pcbTallCompoent]);
    }
    translate([ 3 * pcbSmtLvSize[0] / 4 - wallThickness, wallThickness, wallThickness]) {
        cube([wallThickness * 2, wallThickness * 3, pcbTallCompoent]);
    }

    translate([pcbSmtLvSize[0] / 4 - wallThickness, wallThickness + pcbSmtLvSize[1] - wallThickness * 1, wallThickness]) {
        #cube([wallThickness * 2, wallThickness * 2, pcbTallCompoent]);
    }

    translate([3 * pcbSmtLvSize[0] / 4 - wallThickness, wallThickness + pcbSmtLvSize[1] - wallThickness * 1, wallThickness]) {
        #cube([wallThickness * 2, wallThickness * 2, pcbTallCompoent]);
    }

    translate([0, -offsetY - 1.4, 0]) {
        cube([pcbSmtLvSize[0] + 2 * wallThickness, maxY + 4 * wallThickness + 2.8, wallThickness]);
    }

    translate([0, -offsetY - 1.4 - wallThickness, -3 * wallThickness]) {
        cube([pcbSmtLvSize[0] + 2 * wallThickness, wallThickness, 4 * wallThickness]);
    }

    translate([0, maxY + 3 * wallThickness + 1.4, -3 * wallThickness]) {
        cube([pcbSmtLvSize[0] + 2 * wallThickness, wallThickness, 4 * wallThickness]);
    }

}

*relayCurrentCase();


translate([0, -wallThickness, wallThickness + pcbThickness + solderThickness + 2]) {
    *relayCurrentCaseTop();
}

translate([0, 0, 15 + pcbRelayHeight + wallThickness]) {
    smtLvSled();
}
