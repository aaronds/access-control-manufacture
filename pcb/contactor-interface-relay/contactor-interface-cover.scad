boardWidth=34;
boardLength=40.3;
overhangSize=1.7;
solderDepth=2.5;
wallSize=0.8;
boardDepth=1.7;

difference() {
    union() {
        cube([boardWidth, boardLength, wallSize]);
        translate([-wallSize, 0, 0]) {
            cube([wallSize + overhangSize, boardLength, wallSize + solderDepth + boardDepth + wallSize]); 
        }
    }
    translate([0, -0.01, wallSize + solderDepth]) {
        cube([boardWidth, boardLength + 0.02, boardDepth]);
    }
}
