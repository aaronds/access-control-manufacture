pcbHeight = 2;
solderHeight = 2;
wallHeight = 2;
baseHeight = 2;
dinClipLength = 50;

pcbLength = 44.1;
pcbWidth = 24.2;

wallWidth = (dinClipLength - pcbLength) / 2;

dinWidth = pcbHeight + solderHeight + wallHeight + baseHeight;

module din_clip() {
	translate([-.15,0,0])linear_extrude(height=dinWidth, convexity=5) {
		import(file="../din_clip_01a.dxf", layer="0", $fn=64);
	}
}

din_clip();

translate([-pcbWidth - wallWidth, 0, 0]) {
    difference() {
        cube([pcbWidth + wallWidth, pcbLength + 2 * wallWidth, baseHeight + solderHeight + pcbHeight + wallHeight]); 
        translate([wallWidth, wallWidth, baseHeight]) {
            cube([pcbWidth, pcbLength, solderHeight + pcbHeight + wallHeight + 0.01]);
        }
    }
    translate([wallWidth + pcbWidth / 2 - 2 * wallWidth, wallWidth + pcbLength /2 - 2 * wallWidth, baseHeight]) {
        cube([4 * wallWidth, 4 * wallWidth, solderHeight]);
    }
}
