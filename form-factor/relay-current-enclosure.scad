include <pcb-model-sizes.scad>


module relayCurrentCase() {
    maxY = max(pcbCurrentSensorSize[0], pcbDevkitcRelaySize[1]);
    sizeX = 2 * wallThickness + partitionThickness + pcbDevkitcRelaySize[0] + pcbCurrentSensorSize[1];
    difference() {
        cube([sizeX, 2 * wallThickness + maxY, wallThickness + pcbThickness + solderThickness]);
        translate([wallThickness - caseMargin, wallThickness + (maxY - pcbDevkitcRelaySize[1]) / 2 - caseMargin, wallThickness]) {
            cube([pcbDevkitcRelaySize[0] + 2 * caseMargin, pcbDevkitcRelaySize[1] + 2 * caseMargin, pcbThickness + solderThickness + 0.01]);
        }
        translate([wallThickness + pcbDevkitcRelaySize[0] + partitionThickness, wallThickness + (maxY - pcbCurrentSensorSize[0]) / 2, wallThickness]) {
            cube([pcbCurrentSensorSize[1], pcbCurrentSensorSize[0], pcbThickness + solderThickness + 0.01]);
        }
    }
    translate([0, 0, wallThickness + pcbThickness + solderThickness]) {
        translate([wallThickness + caseMargin, 0, 0]) {
            cube([2 * wallThickness, wallThickness, 2 * wallThickness]);
        }

        translate([sizeX - wallThickness - caseMargin - 2 * wallThickness, 0, 0]) {
            cube([2 * wallThickness, wallThickness, 2 * wallThickness]);
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

relayCurrentCase();


translate([0, -wallThickness, wallThickness + pcbThickness + solderThickness + 2]) {
    relayCurrentCaseTop();
}
