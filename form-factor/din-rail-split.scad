use <bento-pcb-containers.scad>
include <pcb-model-sizes.scad>

wallThickness = [2, 2, 2];
dinWidth = 2 * wallThickness[2];

dinMountToRailTop = 13.64;
dinRailWidth = 22;
dinRailFullWidth = 49.71;
psuHeightClearance = 18;
latchWall=2;
pcbClearance = 0.5;
mainBoardOverhang = 2;

module dinClip() {
	translate([-.15,0,0])linear_extrude(height=dinWidth, convexity=5) {
		import(file="../pcb/din_clip_01a.dxf", layer="0", $fn=64);
	}
}

rotate([0, 0, -90]) {
    dinClip();
}


cube([dinRailFullWidth, pcbContactorPsuSize[1] - dinMountToRailTop + 2 * wallThickness[1], dinWidth]);

translate([0, pcbContactorPsuSize[1] - dinMountToRailTop + 2 * wallThickness[1], -wallThickness[0] - solderThickness - 3 - pcbThickness - mainBoardOverhang]) {
    cube([pcbContactorPsuSize[0] + 3 * wallThickness[0], wallThickness[1] + 0.002, wallThickness[2] + solderThickness + 3 + pcbThickness + 0.01 + mainBoardOverhang + dinWidth]);
    difference() {
        bentoSmtLv(solderThickness = solderThickness + 3);
        translate([0, 1 * wallThickness[1] + pcbSmtLvSize[1] - 0.001, 0]) {
            cube([2 * wallThickness[0] + pcbSmtLvSize[0],wallThickness[1] + 0.002, wallThickness[2] + solderThickness + 3 + pcbThickness + 0.01]);
        }
    }
}

translate([latchWall, -dinMountToRailTop,dinWidth]) {
    difference() {
        cube([dinRailWidth,wallThickness[1], psuHeightClearance]); 
        cube([wallThickness[0],wallThickness[1], wallThickness[0] / 4]);
    }
}

translate([0 * latchWall,-dinMountToRailTop,dinWidth + psuHeightClearance]) {
    translate([0,0,0]) {
        cube([pcbContactorPsuSize[0] + 2* wallThickness[0], wallThickness[0], wallThickness[2] + solderThickness + pcbThickness]);
    }
    translate([0,pcbClearance,wallThickness[2] + solderThickness + pcbThickness]) {
        rotate([0,0, 0]) {
            mirror([0,0,1]) {
                bentoContactorPsu();
            }
        }
        
        translate([0, 2 * wallThickness[1] + pcbContactorPsuSize[1], 0]) {
            rotate([0,0, 0]) {
                mirror([0,0,1]) {
                    bentoCurrentSensorMini();
                }
            }
        }

    }
}

translate([0,-dinMountToRailTop - latchWall, dinWidth + psuHeightClearance]) {
    cube([latchWall,latchWall + 2 * wallThickness[1], wallThickness[2] + solderThickness + pcbThickness]);
}

