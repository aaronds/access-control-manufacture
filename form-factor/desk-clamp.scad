boxHeight=160;
clampWidth=30;
clampDepth=40;
wallThickness=10;

heightOffDesk = 30;
deskHeight = 20;
deskDepth = 20;
deskWidth = 20;

difference() {
    cube([clampWidth, clampDepth + wallThickness, boxHeight + 2 * wallThickness]);
    translate([-0.01, wallThickness, wallThickness]) {
        cube([clampWidth + 0.02, clampDepth + 0.01, boxHeight]);
    }
}
translate([clampWidth / 2 - wallThickness / 2, 0, -heightOffDesk]) {
    cube([wallThickness, clampDepth / 2, heightOffDesk]);
}
translate([clampWidth /2 - deskWidth / 2, 0,-heightOffDesk - deskHeight - 2 * wallThickness]) {
    difference() {
        cube([deskWidth, deskDepth + wallThickness, deskHeight + 2 * wallThickness]);
        translate([-0.01, wallThickness, wallThickness]) {
            cube([deskWidth + 0.02, deskDepth + 0.01, deskHeight]);
        }
    }
}   

