boardWidth=34;
boardLength=40.3;
overhangSize=1.7;
solderDepth=2.5;
wallSize=0.8;
boardDepth=1.7;
relayDepth=15;
capacitorDepth=10;

difference() {
    union() {
        translate([0, - wallSize / 2, 0]) {
            cube([boardWidth, boardLength + wallSize / 2, wallSize]);
        }
        translate([-wallSize, -wallSize / 2, 0]) {
            cube([wallSize + overhangSize, boardLength + wallSize / 2, wallSize + solderDepth + boardDepth + max(wallSize, capacitorDepth)]); 
        }
        translate([-wallSize, -wallSize - wallSize / 2, 0]) {
            cube([wallSize + boardWidth, wallSize + 0.01, wallSize + solderDepth + boardDepth + relayDepth]);
        }
    }
    translate([0, -0.01, wallSize + solderDepth]) {
        cube([boardWidth, boardLength + 0.02, boardDepth]);
    }
}
