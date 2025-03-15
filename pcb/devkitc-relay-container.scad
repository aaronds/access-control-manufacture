relayBoardWidth=25;
relayBoardHeight=56;
wallThickness=2;

portSize=6;
relayOut=[2.65, 37.195];
relayIn=[2.65, 2.82];
neut=[14.95, 53.32];

coilHigh=[18.98, 1.6];
coilLow=[18.98, 18.54];

cableM = 3;

function pcbToCaseX(pcb) = pcb;
function pcbToCaseY(pcb) = relayBoardHeight - pcb;

containerHeight=23;

difference() {
    translate([-wallThickness, -wallThickness, -wallThickness]) {
        cube([2 * wallThickness + relayBoardWidth, 2 * wallThickness + relayBoardHeight, wallThickness + containerHeight]);
    }
    cube([relayBoardWidth, relayBoardHeight, containerHeight + 0.01]);

    translate([-wallThickness - 0.01,0, containerHeight - cableM - wallThickness]) {
        translate([0, pcbToCaseY(relayOut[1]) - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM * 3, cableM + wallThickness + 0.01]);
        }

        translate([0, pcbToCaseY(relayIn[1]) - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM, cableM + wallThickness + 0.01]);
        }
    }

    translate([relayBoardWidth - 0.01,0, containerHeight - cableM - wallThickness]) {
        translate([0, pcbToCaseY(neut[1]) - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM * 3, cableM + wallThickness + 0.01]);
        }
        translate([0, (pcbToCaseY(coilHigh[1]) + pcbToCaseY(coilLow[1])) / 2 - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM, cableM + wallThickness + 0.01]);
        }
    }
}

translate([relayBoardWidth + 10, 0, 0]) {
    difference() {
        translate([-wallThickness, -wallThickness, -wallThickness]) {
            cube([4 * wallThickness + relayBoardWidth, 4 * wallThickness + relayBoardHeight, 2 * wallThickness]);
        }
        translate([-0.1, -0.1,0]) {
            cube([2 * wallThickness + relayBoardWidth + 0.2, 2 * wallThickness + relayBoardHeight + 0.2, wallThickness + 0.01]);
        }
    }
}

