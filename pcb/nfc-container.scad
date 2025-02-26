wallThickness=3;
moduleSize=42;
cableGap=5;
$fn=100;

difference() {
	cylinder(r=moduleSize/2 + wallThickness, h=moduleSize+2*wallThickness);
	translate([0,0, wallThickness]) {
		cylinder(r=moduleSize / 2, h=moduleSize);
	}
	translate([-moduleSize / 2 - wallThickness, -0.01, -0.01]) {
		cube([moduleSize + wallThickness * 2, moduleSize + wallThickness * 2, moduleSize + 2 * wallThickness + 0.02]);
	}
	translate([0,0,-0.01]) {
		cylinder(r=cableGap, h=wallThickness + 0.02);
	}
}
