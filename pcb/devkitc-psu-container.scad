psuBoardWidth=40;
psuBoardHeight=40;
wallThickness=2;

portSize=6;
acLive=[2.65, 22];
acNeut=[2.65, 34];

dcOut=[55, 6.5];

cableM = 3;

function pcbToCaseX(pcb) = pcb;
function pcbToCaseY(pcb) = psuBoardHeight - pcb;

containerHeight=22;


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
            cube([wallThickness + 0.02, cableM * 2, cableM + wallThickness + 0.01]);
        }
    }
}
/*

translate([psuBoardWidth + 10, 0, 0]) {
    difference() {
        translate([-wallThickness, -2 * wallThickness, -wallThickness]) {
            cube([4 * wallThickness + psuBoardWidth, 6 * wallThickness + psuBoardHeight, 3 * wallThickness]);
        }
        translate([-0.1, -0.1,0]) {
            cube([2 * wallThickness + psuBoardWidth + 0.2, 2 * wallThickness + psuBoardHeight + 0.2,2 * wallThickness + 0.01]);
        }
    }
    translate([-wallThickness, -2 * wallThickness, - 3 * wallThickness]) {
        cube([wallThickness * 3, wallThickness, 3 * wallThickness]);
    }
    translate([psuBoardWidth - 0 * wallThickness, -2 * wallThickness, - 3 * wallThickness]) {
        cube([wallThickness * 3, wallThickness, 3 * wallThickness]);
    }

    translate([-wallThickness, psuBoardHeight + 3 * wallThickness, - 3 * wallThickness]) {
        cube([wallThickness * 3, wallThickness, 3 * wallThickness]);
    }
    translate([psuBoardWidth - 0 * wallThickness, psuBoardHeight + 3 * wallThickness, - 3 * wallThickness]) {
        cube([wallThickness * 3, wallThickness, 3 * wallThickness]);
    }
}
*/
