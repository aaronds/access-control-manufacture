use <bento-pcb-containers.scad>
include <pcb-model-sizes.scad>

wallThickness = [2, 2, 2];

dinWidth = wallThickness[2] + solderThickness + pcbThickness;

module dinClip() {
	translate([-.15,0,0])linear_extrude(height=dinWidth, convexity=5) {
		import(file="../pcb/din_clip_01a.dxf", layer="0", $fn=64);
	}
}

rotate([0, 0, -90]) {
    dinClip();
}

translate([wallThickness[0] * 2 + pcbContactorPsuSize[1],0,0]) {
    rotate([0,0, 90]) {
        bentoContactorPsu();
    }
}

edgeStrip = (wallThickness[0] * 2 + pcbSmtLvSize[0]) - (wallThickness[0] * 4 + pcbContactorPsuSize[1] + pcbCurrentSensorSize[1]);

translate([wallThickness[0] * 2 + pcbContactorPsuSize[1], 0, 0]) {
    cube([edgeStrip, wallThickness[0] * 2 + pcbContactorPsuSize[0], dinWidth]); 
}

translate([edgeStrip + wallThickness[0] * 2 + pcbContactorPsuSize[1] + wallThickness[0] * 2 + pcbCurrentSensorSize[1],0,0]) {
    rotate([0,0, 90]) {
        bentoCurrentSensor();
    }
}

translate([0, wallThickness[0] * 1.5 + pcbCurrentSensorSize[0], 0]) {
    cube([2 * wallThickness[0] + pcbSmtLvSize[0], wallThickness[0], dinWidth]);

    translate([wallThickness[0] * 1 + pcbContactorPsuSize[1], 0, 0]) {
        cube([wallThickness[0] * 2 + edgeStrip, 4 * wallThickness[0], dinWidth]); 
    }

    translate([0,4 * wallThickness[0], 0]) {
        rotate([0, 0, 0]) {
            difference() {
                bentoSmtLv(solderThickness = solderThickness + 3);
                translate([0, 1 * wallThickness[1] + pcbSmtLvSize[1] - 0.001, 0]) {
                    cube([2 * wallThickness[0] + pcbSmtLvSize[0],wallThickness[1] + 0.002, dinWidth + 3 + 0.01]);
                }
            }
        }
    }
}

