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

legHeight = 4 * wallThickness;

translate([psuBoardWidth + 10, 0, 0]) {
    difference() {
        translate([-wallThickness, -2 * wallThickness, -wallThickness]) {
            cube([4 * wallThickness + psuBoardWidth, 6 * wallThickness + psuBoardHeight, 4 * wallThickness]);
        }
        translate([-0.1, -0.1,0]) {
            cube([2 * wallThickness + psuBoardWidth + 0.2, 2 * wallThickness + psuBoardHeight + 0.2,3 * wallThickness + 0.01]);
        }
    }

    translate([-wallThickness + ((4 * wallThickness + psuBoardWidth) / 2) - 2 * wallThickness, -2 * wallThickness + ((6 * wallThickness + psuBoardHeight) / 2) - 2 * wallThickness, -wallThickness]) {
        cube([4 * wallThickness, 4 * wallThickness, 3 * wallThickness]);
    }

    translate([-wallThickness, -2 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }
    translate([psuBoardWidth - 0 * wallThickness, -2 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }

    translate([-wallThickness, psuBoardHeight + 3 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }
    translate([psuBoardWidth - 0 * wallThickness, psuBoardHeight + 3 * wallThickness, -legHeight]) {
        cube([wallThickness * 3, wallThickness, legHeight]);
    }
}
