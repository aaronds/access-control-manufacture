use <bento-pcb-containers.scad>
include <pcb-model-sizes.scad>

wallThickness = [2, 2, 2];
dinWidth = 2 * wallThickness[2];

dinMountToRailTop = 13.64;
dinRailWidth = 22;
dinRailFullWidth = 49.71;
psuHeightClearance = 18;

module dinClip() {
	translate([-.15,0,0])linear_extrude(height=dinWidth, convexity=5) {
		import(file="../pcb/din_clip_01a.dxf", layer="0", $fn=64);
	}
}

rotate([0, 0, -90]) {
    dinClip();
}


cube([dinRailFullWidth, pcbContactorPsuSize[1] - dinMountToRailTop + 2 * wallThickness[1], dinWidth]);

translate([0, pcbContactorPsuSize[1] - dinMountToRailTop + 2 * wallThickness[1], 0]) {
    difference() {
        bentoSmtLv(solderThickness = solderThickness + 3);
        #translate([0, 1 * wallThickness[1] + pcbSmtLvSize[1] - 0.001, 0]) {
            cube([2 * wallThickness[0] + pcbSmtLvSize[0],wallThickness[1] + 0.002, wallThickness[2] + solderThickness + 3 + pcbThickness + 0.01]);
        }
    }
}

translate([2 * wallThickness[0],-dinMountToRailTop,dinWidth]) {
   cube([dinRailWidth,wallThickness[1], psuHeightClearance]); 
}

translate([2 * wallThickness[0],-dinMountToRailTop,dinWidth + psuHeightClearance]) {
    translate([0,0,wallThickness[2] + solderThickness + pcbThickness]) {
        rotate([0,0, 0]) {
            mirror([0,0,1]) {
                bentoContactorPsu();
            }
        }
        
        translate([0, 2 * wallThickness[1] + pcbContactorPsuSize[1], 0]) {
            rotate([0,0, 0]) {
                mirror([0,0,1]) {
                    bentoCurrentSensor();
                }
            }
        }

    }
}
