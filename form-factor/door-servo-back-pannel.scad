use <../lib/cadmodel-sg90/sg90.scad>
use <../mill/bleep-holes.scad>

$fn=100;
doorSize=[300,200];

strokeSize=20;
clipSize=20;
clipWall=5;
doorWall=3;
boltM=3;
gapToMove = 0.2;

servoHeight = 22.5;
servoDrivePlateHeight = 4;
servoSpindleHeight = 3;
servoWidth = 12.2;
servoArmM=10;
servoSpindleM=4.8;

servoMountPlateLength=32.2;
servoMountPlateOffset=16.75;

thinWall=0.8;

initialAngle = 20;
deltaAngle = 50;

bleepHolesOffset=110-56;


translate([-5.5, -servoHeight - servoDrivePlateHeight - servoSpindleHeight,servoWidth / 2]) {
    rotate([-90, 0, 0]) {
        sg90();
    }
}

function angleForT(t=0) = (t < 0.5) ? initialAngle + (t * 2) * deltaAngle : initialAngle + ((1 - t) * 2) * deltaAngle;


translate([0,0,servoWidth / 2]) {
    rotate([0,angleForT($t),0]) {
        #union() {
            rotate([90, 0, 0]){
                cylinder(r=servoArmM/2,h=servoSpindleHeight);
            }
            translate([-servoArmM/2, -servoSpindleHeight, 0]) {
                cube([servoArmM, servoSpindleHeight, strokeSize]); 
            }

            translate([0, 0, strokeSize]) {
                rotate([90, 0, 0]){
                    cylinder(r=servoArmM/2,h=servoSpindleHeight);
                }

                translate([0, servoSpindleHeight, 0]) {
                    rotate([90, 0, 0]){
                        cylinder(r=servoSpindleM/2,h=servoSpindleHeight * 2);
                    }
                }

            }
        }
    }
    translate([strokeSize * sin(angleForT($t)), 0, 0]) {
        servoLink();
    }
}

module link(width=5, length=10, internalWidth=2.5,thickness=3) {
    difference() {
        union() {
            cylinder(r=width/2, h=thickness);
            translate([-width / 2, 0, 0]) {
                cube([width, length, thickness]);
            }
            translate([0, length, 0]) {
                cylinder(r=width/2, h=thickness);
            }
        }
        if (internalWidth > 0) {
            translate([0,0,-0.01]) {
                cylinder(r=internalWidth/2, h=thickness + 0.02);
                translate([-internalWidth / 2, 0, 0]) {
                    cube([internalWidth, length, thickness + 0.02]);
                }
                translate([0, length, 0]) {
                    cylinder(r=internalWidth/2, h=thickness + 0.02);
                }
            }
        }
    }
}

module servoLink(width=servoArmM, length=strokeSize, internalWidth=servoSpindleM, thickness=servoSpindleHeight) {
    translate([0,servoSpindleHeight,0]) {
        rotate([90, 0, 0]) {
            link(width=width, length=length, internalWidth=internalWidth + gapToMove,thickness=thickness);
        }
    }
}



clipFullWidth = 3 * boltM + clipSize + 2 * clipWall + 3 * boltM;
translate([strokeSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM, 0]) {
    difference() {
        cube([clipSize, clipFullWidth, 2 * clipWall]);
        translate([clipSize / 2, 1.5 * boltM, -0.01 - doorWall]) {
            cylinder(r=boltM/2,h=2 * clipWall + 0.02 + doorWall);
        }

        translate([clipSize / 2,clipFullWidth - 1.5 * boltM, -0.01 - doorWall]) {
            cylinder(r=boltM/2,h=2 * clipWall + 0.02 + doorWall);
        }

        translate([-0.01, 3 * boltM + clipWall - gapToMove, -0.01]) {
            cube([clipSize + 0.02, clipSize + 2 * gapToMove, clipWall + gapToMove + 0.02]);
        }
    }
}

translate([2 * clipWall, -clipSize/2 -2 * thinWall, 0]) {
    difference() {
        cube([strokeSize, 4 * thinWall + clipSize, clipWall + thinWall]);
        translate([-0.01, 2 * thinWall - 1 * gapToMove, -0.01]) {
            cube([strokeSize + 0.02, clipSize + 2 * gapToMove , clipWall + gapToMove + 0.02]);
        }
        translate([-0.01, 3 * thinWall, clipWall - 0.01]) {
            cube([strokeSize + 0.02, clipSize - 2 * thinWall, thinWall + 0.02]);
        }
    }
}

translate([strokeSize * sin(angleForT($t)), 0, 0]) {
    union() {
        translate([-servoArmM / 2, 0, 0]) {
            cube([(servoArmM - servoSpindleM) / 2 - gapToMove, servoSpindleHeight, servoWidth / 2]);
            cube([2 * clipWall + (servoArmM / 2), servoSpindleHeight, servoWidth / 2 - servoSpindleM/2 - gapToMove]);  
        }
        translate([2 * clipWall, -clipSize / 2, 0]) {
            cube([2 * strokeSize - (strokeSize * sin(initialAngle)), clipSize, clipWall]);
        }
        translate([servoSpindleM / 2 + gapToMove,0,0]) {
            difference() {
                cube([2 * clipWall - (servoSpindleM / 2 + gapToMove), servoSpindleHeight, clipWall]);
            }
        }
    }
}

difference() {
    translate([strokeSize + clipSize + 3 * clipWall - doorSize[0],-(doorSize[1])/2,-doorWall]) {
        color("#e7cfb4") cube([doorSize[0], doorSize[1], doorWall]);
    }

    translate([0,0,-doorWall - 0.01]) {
        linear_extrude(height=doorWall + 0.02) {
            translate([-(servoMountPlateLength / 2) - servoMountPlateOffset, bleepHolesOffset, 0]) {
                rotate([0,0,90]) {
                    holesForBleep(onLid=false, withContacts=false);
                }
            }
        }
    }

    translate([strokeSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM, -doorWall - 0.01]) {
        translate([clipSize / 2, 1.5 * boltM, 0]) {
            cylinder(r=boltM/2,h= 0.02 + doorWall);
        }

        translate([clipSize / 2,clipFullWidth - 1.5 * boltM, 0]) {
            cylinder(r=boltM/2,h=0.02 + doorWall);
        }
    }
}
