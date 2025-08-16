psuBoardWidth=55;
psuBoardHeight=65;
wallThickness=2;

portSize=6;
cableM = 3;

function pcbToCaseX(pcb) = pcb;
function pcbToCaseY(pcb) = psuBoardHeight - pcb;

containerHeight=22;

legHeight = 13;

translate([psuBoardWidth + 10, 0, 0]) {
    difference() {
        translate([-1 * wallThickness, -1 * wallThickness, -wallThickness]) {
            cube([2 * wallThickness + psuBoardWidth, 2 * wallThickness + psuBoardHeight, 3 * wallThickness]);
        }
        translate([-0.1, -0.1,0]) {
            cube([psuBoardWidth + 0.2, psuBoardHeight + 0.2,2 * wallThickness + 0.01]);
        }
    }
    translate([-wallThickness, -1 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }
    translate([psuBoardWidth - 2 * wallThickness, -1 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }

    translate([-wallThickness, psuBoardHeight + 0 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }
    translate([psuBoardWidth - 2 * wallThickness, psuBoardHeight + 0 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }
}
