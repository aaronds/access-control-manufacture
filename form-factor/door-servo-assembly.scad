use <../lib/cadmodel-sg90/sg90.scad>
use <../mill/bleep-holes.scad>
use <MCAD/regular_shapes.scad>
include <door-servo-measurements.scad>
$fn=100;


module servo() {
    translate([-servoSpindleOffset, -servoHeight - servoDrivePlateHeight - servoSpindleHeight,servoWidth / 2]) {
        rotate([-90, 0, 0]) {
            *sg90();
        }
    }
}

function angleForT(t=0) = (t < 0.5) ? initialAngle + (t * 2) * deltaAngle : initialAngle + ((1 - t) * 2) * deltaAngle;

$t=0;

module servoArms() {
    translate([0,0,servoWidth / 2]) {
        rotate([0,angleForT($t),0]) {
            union() {
                rotate([90, 0, 0]){
                    difference() {
                        cylinder(r=servoArmM/2,h=servoSpindleHeight - gapToMove);
                        translate([0,0,-0.01]) {
                            cylinder(r=servoSpindleM/2, h=servoSpindleHeight+0.02);
                        }
                    }
                }
                translate([-servoArmM/2, -servoSpindleHeight, 0]) {
                    difference() {
                        translate([0,gapToMove,0]) {
                            cube([servoArmM, servoSpindleHeight - gapToMove, strokeSize]); 
                        }
                        translate([servoArmM/2, -0.01, 0]) {
                            rotate([-90, 0, 0]){
                                cylinder(r=servoSpindleM/2, h=servoSpindleHeight+0.02);
                            }
                        }
                        translate([servoArmM/2, -0.01, strokeSize + 0]) {
                            rotate([-90, 0, 0]){
                                cylinder(r=smallBoltM/2,h=servoSpindleHeight + 0.02);
                            }
                        }
                    }
                }

                translate([0, 0, strokeSize]) {
                    rotate([90, 0, 0]){
                        difference() {
                            cylinder(r=servoArmM/2,h=servoSpindleHeight - gapToMove);
                            translate([0,0,-0.1]) {
                                cylinder(r=smallBoltM/2,h=servoSpindleHeight + 0.02);
                            }
                            translate([0, -0.01, 0]) {
                                cylinder(r=smallBoltM/2,h=servoSpindleHeight + 0.02);
                            }
                        }
                    }

                    translate([0, servoSpindleHeight, 0]) {
                        rotate([90, 0, 0]){
                            difference() {
                                cylinder(r=servoSpindleM/2,h=servoSpindleHeight * 2 - gapToMove);
                                translate([0,0,-0.01]) {
                                    cylinder(r=smallBoltM/2,h=servoSpindleHeight * 2 + 0.02);
                                }
                            }
                        }
                    }

                }
            }
        }
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

/* Door side clip */

module doorClip(frameless=false) {

    translate([strokeSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM, 0]) {
        difference() {
            union() {
                cube([clipSize, clipFullWidth, 2 * clipWall]);
                if (frameless) {
                    translate([0,0,-clipWall]) {
                        cube([clipSize, clipFullWidth, clipWall]);
                    }
                }
            }
            translate([clipSize / 2, 1.5 * boltM, -0.01 - doorWall]) {
                cylinder(r=boltM/2,h=2 * clipWall + 0.02 + doorWall);
                if (frameless) {
                    framelessBoltHole();
                }
                translate([0,0,2 * clipWall + 0.02 + doorWall]) {
                    boltSocket();
                }
            }

            translate([clipSize / 2,clipFullWidth - 1.5 * boltM, -0.01 - doorWall]) {
                cylinder(r=boltM/2,h=2 * clipWall + 0.02 + doorWall);
                if (frameless) {
                    framelessBoltHole();
                }
                translate([0,0,2 * clipWall + 0.02 + doorWall]) {
                    boltSocket();
                }
            }

            translate([-0.01, 3 * boltM + clipWall - gapToMove, -0.01]) {
                cube([clipSize + 0.02, clipSize + 2 * gapToMove, clipWall + 2 * gapToMove + 0.02]);
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
                union() {
                    cube([2 * thinWall + leaverSwitchLength, 2 * thinWall + leaverSwitchThickness + 2 * gapToFit + 0.1, leaverSwitchContactLength + leaverSwitchWidth]);
                    if (frameless) {
                        translate([0,0,-clipWall]) {
                            cube([2 * thinWall + leaverSwitchLength, 2 * thinWall + leaverSwitchThickness + 2 * gapToFit + 0.1, clipWall + 0.01]);   
                        }
                    }
                }
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
                    *color("blue") leaverSwitch();
                }
            }
        }
    }

    /* Guide rails for door bolt */

    translate([2 * clipWall + strokeSize * sin(initialAngle), -clipSize/2 -2 * thinWall, 0]) {
        difference() {
            union() {
                cube([strokeSize - (strokeSize * sin(initialAngle)), 4 * thinWall + clipSize, clipWall + 2 * thinWall]);
                if (frameless) {
                    translate([0,0,-clipWall]) {
                        cube([strokeSize - (strokeSize * sin(initialAngle)), 4 * thinWall + clipSize, clipWall + 0.01]);
                    }
                }
            }
            translate([-0.01, 2 * thinWall - 1 * gapToMove, -0.01]) {
                cube([strokeSize + 0.02, clipSize + 2 * gapToMove , clipWall + 2 * gapToMove + 0.02]);
            }
            translate([-0.01, 3 * thinWall, clipWall - 0.01]) {
                cube([strokeSize + 0.02, clipSize - 2 * thinWall, 2 * thinWall + 0.02]);
            }
        }
    }
}


module doorBolt() {
    translate([strokeSize * sin(angleForT($t)), 0, 0]) {
        union() {
            translate([-servoArmM / 2, 0, 0]) {
                #cube([(servoArmM - servoSpindleM) / 2 - gapToMove, servoSpindleHeight, servoWidth / 2]);
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
                    translate([2 * strokeSize - (strokeSize * sin(initialAngle)) - lockBoltCurveR, lockBoltCurveR, 0]) {
                        rotate([0,0,-90]) {
                            cornerRoundCut(r=lockBoltCurveR + 0.01,h=clipWall);
                        }
                    }
                    translate([2 * strokeSize - (strokeSize * sin(initialAngle)) - lockBoltCurveR, clipSize - lockBoltCurveR, 0]) {
                        rotate([0,0,0]) {
                            cornerRoundCut(r=lockBoltCurveR + 0.01,h=clipWall);
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

    translate([0,0,servoWidth / 2]) {
        translate([strokeSize * sin(angleForT($t)), 0, 0]) {
            servoLink();
        }
    }
}

/* Servo Mount */

module servoMount(frameless=false) {

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

                if (frameless) {
                    translate([-3 * boltM, -3 * boltM, - clipWall]) {
                        cube([3 * boltM + servoMountPlateExtends * 2 + servoLength + 3 * boltM, 3 * boltM, clipWall]);
                    }
                }
            }

            translate([-1.5 * boltM,-1.5 * boltM, -0.01]) {
                cylinder(r=boltM/2,h=clipWall+0.02);
                translate([0,0,clipWall]) {
                    boltSocket();
                }
                if (frameless) {
                    framelessBoltHole();
                }
            }

            translate([servoLength + 2 * servoMountPlateExtends + 1.5 * boltM,-1.5 * boltM, -0.01]) {
                cylinder(r=boltM/2,h=clipWall+0.02);
                translate([0,0,clipWall]) {
                    boltSocket();
                }
                if (frameless) {
                    framelessBoltHole();
                }
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

module frameClip(frameless=true) {
    translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -clipSize / 2 - gapToMove - 3 * boltM,0]) {
        difference() {
            union() {
                cube([doorLatchPannel - gapToMove, clipSize + 6 * boltM + 2 * gapToMove, 2 * clipWall + ferrousSheet]);
                if (frameless) {
                    translate([0,0,-clipWall]) {
                        cube([doorLatchPannel - gapToMove, clipSize + 6 * boltM + 2 * gapToMove, clipWall]);
                        
                    }
                }
            }
            translate([-0.01, 3 * boltM, -0.01]) {
                cube([doorLatchPannel + 0.02, gapToMove * 2 + clipSize, clipWall + 2 * gapToMove]);
            }

            if (frameless) {
                translate([0, 1.5 * boltM, clipWall + ferrousSheet / 2]) {
                    rotate([0,90,0]) {
                        cylinder(r=boltM/2,h=doorLatchPannel);
                        translate([0, 0, boltHeadHeight - 0.01]) {
                            boltSocket();
                        }
                    }
                }
                translate([0, clipSize + 3 * boltM + 2 * gapToMove + 1.5 * boltM, clipWall + ferrousSheet / 2]) {
                    rotate([0,90,0]) {
                        cylinder(r=boltM/2,h=doorLatchPannel);
                        translate([0, 0, boltHeadHeight - 0.01]) {
                            boltSocket();
                        }
                    }
                }
            } else {

                translate([1.5 * boltM, 1.5 * boltM, -0.01]) {
                    cylinder(r=boltM/2,h=2 * clipWall + ferrousSheet + 0.02);
                    translate([0,0,2 * clipWall + ferrousSheet + 0.02]) {
                        boltSocket();
                    }
                    if (frameless) {
                        framelessBoltHole();
                    }
                }

                translate([1.5 * boltM, clipSize + 3 * boltM + 2 * gapToMove + 1.5 * boltM, -0.01]) {
                    cylinder(r=boltM/2,h=2 * clipWall + ferrousSheet + 0.02);
                    translate([0,0,2 * clipWall + ferrousSheet + 0.02]) {
                        boltSocket();
                    }
                    if (frameless) {
                        framelessBoltHole();
                    }
                }
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

    /* Conical alignment on frame */

    translate([strokeSize/2 + clipSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM - 2 * thinWall - leaverSwitchThickness, leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness]) {
        difference() {
            union() {
                translate([gapToMove, 0, 0]) {
                    cube([ strokeSize / 2 + doorClipGap, 2 * thinWall + leaverSwitchThickness + clipWall + boltM, 4 * thinWall]);
                }
                translate([strokeSize / 2 - boltM - thinWall, 2 * thinWall + leaverSwitchThickness + 1.5 * boltM - 0.5 * thinWall, -(leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness) + 2 * clipWall ]) {
                    cylinder(h=leaverSwitchWidth - 0.1, r1=boltM+(2 * gapToMove)+thinWall, r2=1+gapToFit+thinWall);
                }
            }
            translate([strokeSize / 2 - boltM - thinWall, 2 * thinWall + leaverSwitchThickness + 1.5 * boltM - 0.5 * thinWall, -(leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness) + 2 * clipWall ]) {
                cylinder(h=leaverSwitchWidth, r1=boltM+2 * gapToMove, r2=1+gapToFit);
                cylinder(h=leaverSwitchWidth + 0.1, r=1+gapToFit);
                translate([-0.01,-0.01,(boltHeadHeight + gapToMove)/2]) {
                    cube([2 * (boltM + thinWall + 2 * gapToMove) + 0.02, 2 * (boltM + thinWall + 2 * gapToMove) + 0.02, boltHeadHeight + gapToMove],center=true);
                }
            }

        }
    }

    translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -clipSize / 2 - clipWall - 3 * boltM - 2 * thinWall - leaverSwitchThickness, 0]) {
        difference() {
            union() {
                cube([doorLatchPannel - gapToMove, 2 * thinWall + leaverSwitchThickness + clipWall + boltM, leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness + 4 * thinWall]);
                if (frameless) {
                    translate([0,0,-clipWall]) {
                        cube([doorLatchPannel - gapToMove, 2 * thinWall + leaverSwitchThickness + clipWall + boltM, clipWall]);
                    }
                }
            }
            translate([doorLatchPannel/2, 2 * thinWall + leaverSwitchThickness + clipWall + boltM * 1.5 - gapToMove, 0]) {

                if (frameless) {
                    translate([-doorLatchPannel/2, 0, clipWall + ferrousSheet / 2]) {
                        rotate([0,90,0]) {
                            #cylinder(r=boltM/2,h=doorLatchPannel);
                            translate([0, 0, boltHeadHeight - 0.01]) {
                                boltSocket();
                            }
                        }
                    }
                }

                cylinder(h=2*clipWall + leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness + 0.02, r=boltM/2);
                translate([0,0,2 * clipWall + ferrousSheet + 0.02]) {
                    boltSocket();
                }
                translate([0,0,2 * clipWall]) {
                    linear_extrude(leaverSwitchContactLength + leaverSwitchWidth + 0.8 * leaverThickness + 0.02) {
                        hexagon(boltNutM/2);
                    }
                }
            }
        }
        
    }
}

/* Laser cut section for door */
module laserDoorSide() {
    difference() {
        translate([strokeSize + clipSize + doorClipGap + 2 * clipWall - doorSize[0],-(doorSize[1])/2,-doorWall]) {
            color("#e7cfb4") cube([doorSize[0], doorSize[1], doorWall]);
        }

        translate([0,0,-doorWall]) {
            doorNutHoles(doorWall);
        }


        /* Bleepy Box LED and Button */
        translate([0,0,-doorWall - 0.01]) {
            linear_extrude(height=doorWall + 0.02) {
                translate([-(servoMountPlateLength / 2) - servoMountPlateOffset - 6 * boltM, 0, 0]) {
                    rotate([0,0,180]) {
                        translate([0,bleepHolesOffset, 0]) {
                            rotate([0,0,90]) {
                                holesForBleep(onLid=false, withContacts=false);
                            }
                        }
                    }
                }
            }
        }
        
    }
}

module doorNutHoles(height=doorWall) {
    /* Clip / latch door side */
    translate([strokeSize + 2 * clipWall, -clipSize / 2 - clipWall - 3 * boltM, 0 - 0.01]) {
        translate([clipSize / 2, 1.5 * boltM, 0]) {
            cylinder(r=boltM/2,h= 0.02 + height);
        }

        translate([clipSize / 2,clipFullWidth - 1.5 * boltM, 0]) {
            cylinder(r=boltM/2,h=0.02 + height);
        }
    }

    
    /* Servo mount */
    translate([-servoLength/2 - servoSpindleOffset - servoMountPlateExtends,-servoHeight - servoDrivePlateHeight - servoSpindleHeight + servoMountPlateOffset - servoMountPlateThickness/2,0]) { 
        translate([-1.5 * boltM,-1.5 * boltM, 0 -0.01]) {
            cylinder(r=boltM/2,h=height+0.02);
        }

        translate([servoLength + 2 * servoMountPlateExtends + 1.5 * boltM,-1.5 * boltM, 0 -0.01]) {
            cylinder(r=boltM/2,h=height+0.02);
        }
    }
}

module doorHandle() {
    translate([0,0,-doorWall - handleDepth]) {
        curveR = 1.5;
        difference() {
            minkowski() {
                translate([-servoLength/2 - servoSpindleOffset - servoMountPlateExtends - 4 * boltM, -clipSize / 2 - clipWall - 3 * boltM - 1 * boltM, 0]) {
                    difference() {
                        cube([
                            strokeSize + 2 * clipWall + clipSize + servoLength / 2 + servoSpindleOffset + servoMountPlateExtends + 3 * boltM,
                            clipFullWidth + 2 * boltM, 
                            handleDepth
                        ]);
                        translate([
                            -0 * boltM - 0.01,
                            4 * boltM + 0.01,
                            -0.01
                        ]) {
                            cube([
                                strokeSize + 2 * clipWall + clipSize + servoLength / 2 + servoSpindleOffset + servoMountPlateExtends - 1 * boltM,
                                clipFullWidth -2 * boltM,
                                handleDepth + 0.02
                            ]);
                        }
                        translate([0,handleWall - curveR, handleWall - curveR]) {
                            cube([
                                strokeSize + 2 * clipWall + clipSize + servoLength / 2 + servoSpindleOffset + servoMountPlateExtends + 3 * boltM - (handleWall - curveR),
                                clipFullWidth + 2 * boltM - (handleWall - curveR), 
                                handleDepth - (handleWall - 0.5 * curveR)
                            ]);
                        }
                    }
                }
                sphere(r=curveR);
            }
            translate([0,0,handleDepth - handleWall - 2 * curveR - 0.01]) {
                doorNutHoles(2 * handleWall + 2 * curveR + 0.02);
            }
            translate([-servoLength/2 - servoSpindleOffset - servoMountPlateExtends - 4 * boltM, -clipSize / 2 - clipWall - 3 * boltM - 1 * boltM, 0]) {
                *translate([-curveR,-curveR,handleDepth]) {
                    #cube([
                        strokeSize + 2 * clipWall + clipSize + servoLength / 2 + servoSpindleOffset + servoMountPlateExtends + 3 * boltM + 2 * curveR,
                        clipFullWidth + 2 * boltM + 2 * curveR, 
                        2 * curveR
                    ]);
                }
            }
        }
    }
}

module laserFrameSide(showWood=true) {
    difference() { 
        if (showWood) {
            translate([strokeSize + clipSize + doorClipGap + 2 * clipWall + gapToMove, -(doorSize[1])/2,-doorWall]) {
                color("#e7cfb4") cube([doorLatchPannel - gapToMove, doorSize[1], doorWall]);
            }
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
}

module cornerRoundCut(r=5,h=10) {
    difference() {
        cube([r, r, h]); 
        translate([0,0,-0.01]){
            cylinder(r=r,h=h + 0.02);
        }
    }
}

module boltSocket() {
    translate([0,0,-boltHeadHeight]) {
        linear_extrude(boltHeadHeight + 0.02) {
            hexagon(boltNutM/2 + 2 * gapToFit);
        }
    }
}

module framelessBoltHole() {
    translate([0,0,-clipWall]) {
        cylinder(r=boltM/2,h=clipWall + 0.01);
    }
}

servo();
servoArms();
servoMount();
laserFrameSide();
laserDoorSide();
frameClip();
doorClip();
doorBolt();
//doorHandle();
