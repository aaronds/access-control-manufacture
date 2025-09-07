use <../lib/cadmodel-sg90/sg90.scad>
use <../mill/bleep-holes.scad>

$fn=100;

strokeSize=20;
clipSize=20;
clipWall=5;
doorWall=3;
doorClipGap=3;
boltM=3;
lockBoltCurveR=1.5;

boltPlate = boltM * 3;

gapToMove = 0.2;
gapToFit = 0.1;
doorSize=[300,200];
doorLatchPannel=3 * boltM;


servoHeight = 22.5;
servoDrivePlateHeight = 4;
servoSpindleHeight = 3;
servoSpindleOffset = 5.5;
servoWidth = 12.2;
servoLength = 22.5;
servoArmM=10;
servoSpindleM=4.8;

servoMountPlateLength=32.2;
servoMountPlateOffset=16.75;
servoMountPlateThickness=2;
servoMountPlateExtends = (servoMountPlateLength - servoLength) / 2;
servoMountHoleOffset = 2;
servoMountHoleM = 2;

switchThickness = 9.7;
switchCornerR=4;
switchHoleM=3;
switchLength=27.9;
switchWidth=15.96;
switchRollerOut=9;
switchRollerIn=6.5;
switchRollerM=4.6;
switchRollerTopOffset=3.3;
switchRollerThickness = switchThickness - 2 * 2.5;

leaverSwitchThickness=6.36;
leaverSwitchWidth=9.92;
leaverSwitchLength=20.15;
leaverSwitchCornerR=1;
leaverOffset=3;
leaverExtension=11.5;
leaverThickness = 1;
leaverWidth=4.28;
leaverSwitchContactLength=5;
leaverSwitchContactOffset=1.5;

thinWall=1;
ferrousSheet=1;
magnetM=5;

initialAngle = 20;
deltaAngle = 50;

bleepHolesOffset=110-56;


translate([-servoSpindleOffset, -servoHeight - servoDrivePlateHeight - servoSpindleHeight,servoWidth / 2]) {
    rotate([-90, 0, 0]) {
        sg90();
    }
}

function angleForT(t=0) = (t < 0.5) ? initialAngle + (t * 2) * deltaAngle : initialAngle + ((1 - t) * 2) * deltaAngle;

$t=0;

translate([0,0,servoWidth / 2]) {
    rotate([0,angleForT($t),0]) {
        union() {
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

/* Door side clip */

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

/* Conical alignment feature */

translate([strokeSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM, 0]) {
    translate([clipSize - boltM - thinWall, boltM + thinWall, 2 * clipWall]) {
        cylinder(h=leaverSwitchWidth, r1=boltM, r2=1);
    }
}

/* Leaver Switch Holder */

translate([strokeSize + 2 * clipWall - (leaverSwitchLength - clipSize) - 2 * thinWall - leaverExtension, -clipSize / 2 - clipWall - 3 * boltM - 2 * thinWall - leaverSwitchThickness - 2 * gapToFit, 0]) {
    union() {
        difference() {
            cube([2 * thinWall + leaverSwitchLength, 2 * thinWall + leaverSwitchThickness + 2 * gapToFit + 0.1, leaverSwitchContactLength + leaverSwitchWidth]);
            translate([thinWall - gapToFit, thinWall - gapToFit, -0.01]) {
                cube([leaverSwitchLength + 2 * gapToFit, leaverSwitchThickness + 2 * gapToFit, leaverSwitchContactLength + leaverSwitchWidth + 0.02]);
            }
            translate([thinWall + leaverSwitchContactOffset, -0.01, -0.01]) {
                cube([leaverSwitchLength - 2 * leaverSwitchContactOffset, thinWall + 0.02, leaverSwitchContactLength + 0.02]);
            }
        }

        translate([thinWall - gapToFit,thinWall - gapToFit,0]) {
            cube([leaverSwitchContactOffset + 2 * gapToFit,leaverSwitchThickness + 2 * gapToFit,leaverSwitchContactLength]);
        }

        translate([thinWall + leaverSwitchLength - leaverSwitchContactOffset - gapToFit, thinWall - gapToFit,0]) {
            cube([leaverSwitchContactOffset + 2 * gapToFit,leaverSwitchThickness + 2 * gapToFit,leaverSwitchContactLength]);
        }

        translate([thinWall, thinWall,leaverSwitchContactLength]) {
            rotate([0,-90,-90]) {
                color("blue") leaverSwitch();
            }
        }
    }
}

translate([2 * clipWall + strokeSize * sin(initialAngle), -clipSize/2 -2 * thinWall, 0]) {
    difference() {
        cube([strokeSize - (strokeSize * sin(initialAngle)), 4 * thinWall + clipSize, clipWall + 2 * thinWall]);
        translate([-0.01, 2 * thinWall - 1 * gapToMove, -0.01]) {
            cube([strokeSize + 0.02, clipSize + 2 * gapToMove , clipWall + gapToMove + 0.02]);
        }
        translate([-0.01, 3 * thinWall, clipWall - 0.01]) {
            cube([strokeSize + 0.02, clipSize - 2 * thinWall, 2 * thinWall + 0.02]);
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
            difference() {
                cube([2 * strokeSize - (strokeSize * sin(initialAngle)), clipSize, clipWall]);
                translate([2 * strokeSize - (strokeSize * sin(initialAngle)) - lockBoltCurveR, -0.01, lockBoltCurveR]) {
                    rotate([-90,0,0]) {
                        cornerRoundCut(r=lockBoltCurveR + 0.01,h=clipSize + 0.02);
                    }
                }
                translate([2 * strokeSize - (strokeSize * sin(initialAngle)) - lockBoltCurveR, -0.01, clipWall - lockBoltCurveR]) {
                    rotate([-90,-90,0]) {
                        cornerRoundCut(r=lockBoltCurveR + 0.01,h=clipSize + 0.02);
                    }
                }

            }
        }
        translate([servoSpindleM / 2 + gapToMove,0,0]) {
            difference() {
                cube([2 * clipWall - (servoSpindleM / 2 + gapToMove), servoSpindleHeight, clipWall]);
            }
        }
    }
}

/* Servo Mount */

translate([-servoLength/2 - servoSpindleOffset - servoMountPlateExtends,-servoHeight - servoDrivePlateHeight - servoSpindleHeight + servoMountPlateOffset - servoMountPlateThickness/2,0]) { 
    difference() {
        union() {
            translate([-3 * boltM,-3 * boltM, 0]) {
                cube([3 * boltM, 3 * boltM, clipWall]); 
            }
            translate([0, - 3 * boltM, 0]) {
                cube([servoMountPlateExtends - gapToFit, 3 * boltM, servoWidth + clipWall]);
            }


            translate([servoLength + servoMountPlateExtends + gapToFit, -3 * boltM, 0]) {
                cube([servoMountPlateExtends - gapToFit, 3 * boltM, servoWidth + clipWall]);
            }

            translate([servoLength + 2 * servoMountPlateExtends + 0 * boltM,-3 * boltM, 0]) {
                cube([3 * boltM, 3 * boltM, clipWall]); 
            }

            translate([0, - 3 * boltM, servoWidth + gapToFit]) {
                cube([servoLength + 2 * servoMountPlateExtends, 3 * boltM, clipWall]);
            }
        }

        translate([-1.5 * boltM,-1.5 * boltM, -0.01]) {
            cylinder(r=boltM/2,h=clipWall+0.02);
        }

        translate([servoLength + 2 * servoMountPlateExtends + 1.5 * boltM,-1.5 * boltM, -0.01]) {
            cylinder(r=boltM/2,h=clipWall+0.02);
        }

        translate([servoMountHoleOffset, - 3 * boltM - 0.01, servoWidth / 2]) {
            rotate([-90,0,0]) {
                cylinder(r=servoMountHoleM/2, h=3 * boltM + 0.02);
            }
        }

        translate([servoLength + 2 * servoMountPlateExtends - servoMountHoleOffset, - 3 * boltM - 0.01, servoWidth / 2]) {
            rotate([-90,0,0]) {
                cylinder(r=servoMountHoleM/2, h=3 * boltM + 0.02);
            }
        }

    }
}

module microSwitchRoller(depressed=false) {
    translate([0, switchCornerR, 0]) {
        difference() {
            minkowski() {
                cube([switchWidth - switchCornerR/2,switchLength - switchCornerR/2,switchThickness - 2]);
                cylinder(r=switchCornerR/2,h=1);
            }
        }
    }
    translate([switchWidth + (depressed ? switchRollerIn : switchRollerOut) - switchRollerM/2, switchLength - switchRollerTopOffset, (switchThickness - switchRollerThickness) / 2]) {
        cylinder(r=switchRollerM / 2,h=switchRollerThickness);
    }

}

//microSwitch();

module microSwitchRoller(depressed=false) {
    difference() {
        minkowski() {
            cube([switchWidth - switchCornerR/2,switchLength - switchCornerR/2,switchThickness - 2]);
            cylinder(r=switchCornerR/2,h=1);
        }
    }
    translate([switchWidth + (depressed ? switchRollerIn : switchRollerOut) - switchRollerM/2, switchLength - switchRollerTopOffset, (switchThickness - switchRollerThickness) / 2]) {
        cylinder(r=switchRollerM / 2,h=switchRollerThickness);
    }

}

module leaverSwitch(depressed=true) {
    translate([0, leaverSwitchCornerR/2, 0]) {
        difference() {
            minkowski() {
                cube([leaverSwitchWidth - leaverSwitchCornerR/2,leaverSwitchLength - leaverSwitchCornerR/2,leaverSwitchThickness - 1]);
                cylinder(r=leaverSwitchCornerR/2,h=1);
            }
        }
    }
    translate([leaverSwitchWidth, leaverOffset, (leaverSwitchThickness - leaverWidth) / 2]) {
        cube([leaverThickness, (leaverSwitchLength - leaverOffset) + leaverExtension, leaverWidth]);
    }
}

/* Frame side clip */

translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -clipSize / 2 - gapToMove - 3 * boltM,0]) {
    difference() {
        cube([doorLatchPannel - gapToMove, clipSize + 6 * boltM + 2 * gapToMove, 2 * clipWall + ferrousSheet]);
        translate([-0.01, 3 * boltM, -0.01]) {
            cube([doorLatchPannel + 0.02, gapToMove * 2 + clipSize, clipWall + gapToMove]);
        }

        translate([1.5 * boltM, 1.5 * boltM, -0.01]) {
            cylinder(r=boltM/2,h=2 * clipWall + ferrousSheet + 0.02);
        }
        translate([1.5 * boltM, clipSize + 3 * boltM + 2 * gapToMove + 1.5 * boltM, -0.01]) {
            cylinder(r=boltM/2,h=2 * clipWall + ferrousSheet + 0.02);
        }
    }
    translate([-gapToMove - strokeSize / 2 - doorClipGap, 1.5 * boltM + clipSize / 2, 2 * clipWall + ferrousSheet]) {
        difference() {
            cube([gapToMove + strokeSize / 2 + doorClipGap + doorLatchPannel, 1 * boltPlate, 4 * thinWall]);
            translate([strokeSize / 4, boltPlate / 2, 0.5 * thinWall]) {
                cylinder(h=(3.5 * thinWall) + 0.01, r=magnetM/2 + gapToFit);
            }
        }
    }

}

translate([strokeSize/2 + clipSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM - 2 * thinWall - leaverSwitchThickness, leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness]) {
        cube([ strokeSize / 2 + doorClipGap + doorLatchPannel, 2 * thinWall + leaverSwitchThickness, 4 * thinWall]);
}

translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -clipSize / 2 - clipWall - 3 * boltM - 2 * thinWall - leaverSwitchThickness, , 0]) {
    difference() {
        cube([doorLatchPannel - gapToMove, 2 * thinWall + leaverSwitchThickness + clipWall + boltM, leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness]);
        translate([doorLatchPannel/2, 2 * thinWall + leaverSwitchThickness + clipWall + boltM * 1.5 - gapToMove, -0.01]) {
            cylinder(h=leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness + 0.02, r=boltM/2);
        }
    }
    
}

/* Laser cut section for door */
difference() {
    translate([strokeSize + clipSize + doorClipGap + 2 * clipWall - doorSize[0],-(doorSize[1])/2,-doorWall]) {
        color("#e7cfb4") cube([doorSize[0], doorSize[1], doorWall]);
    }


    /* Bleepy Box LED and Button */
    translate([0,0,-doorWall - 0.01]) {
        linear_extrude(height=doorWall + 0.02) {
            translate([-(servoMountPlateLength / 2) - servoMountPlateOffset, bleepHolesOffset, 0]) {
                rotate([0,0,90]) {
                    holesForBleep(onLid=false, withContacts=false);
                }
            }
        }
    }
    
    /* Clip / latch door side */
    translate([strokeSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM, -doorWall - 0.01]) {
        translate([clipSize / 2, 1.5 * boltM, 0]) {
            cylinder(r=boltM/2,h= 0.02 + doorWall);
        }

        translate([clipSize / 2,clipFullWidth - 1.5 * boltM, 0]) {
            cylinder(r=boltM/2,h=0.02 + doorWall);
        }
    }

    
    /* Servo mount */
    translate([-servoLength/2 - servoSpindleOffset - servoMountPlateExtends,-servoHeight - servoDrivePlateHeight - servoSpindleHeight + servoMountPlateOffset - servoMountPlateThickness/2,0]) { 
        translate([-1.5 * boltM,-1.5 * boltM, -doorWall -0.01]) {
            cylinder(r=boltM/2,h=doorWall+0.02);
        }

        translate([servoLength + 2 * servoMountPlateExtends + 1.5 * boltM,-1.5 * boltM, -doorWall -0.01]) {
            cylinder(r=boltM/2,h=doorWall+0.02);
        }

    }
}

*difference() { 
    translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -(doorSize[1])/2,-doorWall]) {
        color("#e7cfb4") cube([doorLatchPannel - gapToMove, doorSize[1], doorWall]);
    }

    /* Clip / Latch, frame side */

    translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -clipSize / 2 - gapToMove - 3 * boltM,0]) {
        translate([1.5 * boltM, 1.5 * boltM, -doorWall - 0.01]) {
            
            cylinder(r=boltM/2,h=doorWall + 0.02);
        }

        translate([1.5 * boltM, clipSize + 3 * boltM + 2 * gapToMove + 1.5 * boltM, -doorWall -0.01]) {
            cylinder(r=boltM/2,h=doorWall + 0.02);
        }
    }
}

module cornerRoundCut(r=5,h=10) {
    difference() {
        cube([r, r, h]); 
        translate([0,0,-0.01]){
            cylinder(r=r,h=h + 0.02);
        }
    }
}

