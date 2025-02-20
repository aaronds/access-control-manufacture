psuBoardWidth=60;
psuBoardHeight=60;
wallThickness=2;

portSize=6;
acLive=[2.65, 37.195];
acNeut=[2.65, 2.82];

dcOut=[55, 55];

cableM = 3;

function pcbToCaseX(pcb) = pcb;
function pcbToCaseY(pcb) = psuBoardHeight - pcb;

containerHeight=20;

difference() {
    translate([-wallThickness, -wallThickness, -wallThickness]) {
        cube([2 * wallThickness + psuBoardWidth, 2 * wallThickness + psuBoardHeight, wallThickness + containerHeight]);
    }
    cube([psuBoardWidth, psuBoardHeight, containerHeight + 0.01]);

    translate([-wallThickness - 0.01,0, containerHeight - cableM - wallThickness]) {
        translate([0, pcbToCaseY(acLive[1]) - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM, cableM + wallThickness + 0.01]);
        }

        translate([0, pcbToCaseY(acNeut[1]) - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM, cableM + wallThickness + 0.01]);
        }
    }

    translate([psuBoardWidth - 0.01,0, containerHeight - cableM - wallThickness]) {
        translate([0, pcbToCaseY(dcOut[1]) - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM, cableM + wallThickness + 0.01]);
        }
        /*
        translate([0, (pcbToCaseY(coilHigh[1]) + pcbToCaseY(coilLow[1])) / 2 - cableM / 2, 0]) {
            cube([wallThickness + 0.02, cableM, cableM + wallThickness + 0.01]);
        }
        */
    }
}

translate([psuBoardWidth + 10, 0, 0]) {
    difference() {
        translate([-wallThickness, -wallThickness, -wallThickness]) {
            cube([4 * wallThickness + psuBoardWidth, 4 * wallThickness + psuBoardHeight, 2 * wallThickness]);
        }
        translate([-0.1, -0.1,0]) {
            cube([2 * wallThickness + psuBoardWidth + 0.2, 2 * wallThickness + psuBoardHeight + 0.2, wallThickness + 0.01]);
        }
    }
}

