$fn=100;

use <pcb-models.scad>
use <relay-current-enclosure.scad>
include <pcb-model-sizes.scad>

buttonTabSeparation = 9;
buttonTabOffset = 8/2;
buttonTabLength = 4.75;
buttonTablThickness = 0.8;
buttonXOffset = (110 - 56);
buttonSmtLvOffset = buttonXOffset - (pcbSmtLvSize[0] - ((15.16 + 22.06) / 2)) - 1.1;

buttonYOffset = 15.11 + 0.5;


echo(buttonSmtLvOffset);

translate([65.94 + buttonSmtLvOffset, - buttonYOffset + (21 - buttonYOffset) + buttonTabOffset / 2 - buttonTablThickness / 2 - 1.8 , 20]) {
    translate([-(110 - 56), 155, 0]) {
        rotate([0,180,0]) {
            color("#008C4A") pcbSmtLv();
        }
    }
}

difference() {
    translate([-(110 - 56), 0, 0]) {
        square([110, 155]);
    }
    mirror([1,0,0]) {
        translate([-(110 - 56), 0, 0]) {
            translate([110 - 21, 155 - 21, 0]) {
                circle(r=6.4/2);
            }
            translate([110 - 56, 155 - 21, 0]) {
                difference() {
                    circle(r=20.2/2);

                    translate([-buttonTabSeparation / 2 - buttonTabLength / 2, -buttonTabOffset - buttonTablThickness / 2,0]) {
                        square([buttonTabLength, buttonTablThickness]);
                    }

                    translate([buttonTabSeparation / 2 - buttonTabLength / 2, -buttonTabOffset - buttonTablThickness / 2,0]) {
                        square([buttonTabLength, buttonTablThickness]);
                    }
                }
            }
            translate([110 - 84, 155 - 21, 0]) {
                circle(r=11.8/2);
            }
        }
    }
}

maxRCEY = max(pcbCurrentSensorSize[0], pcbDevkitcRelaySize[1]);

translate([-(110 - 56) + 0, 155 - 90, 2.5]) {
    relayCurrentCase();
    translate([wallThickness, -(maxRCEY - pcbDevkitcRelaySize[0]) / 2 - wallThickness - 1, 7]) {
        rotate([0,0,90]) {
            color("#008C4A") pcbDevkitcRelay();
        }
    }
    translate([pcbDevkitcRelaySize[0] + pcbCurrentSensorSize[1] + wallThickness + partitionThickness, pcbCurrentSensorSize[0] + wallThickness, 7]) {
        rotate([0,0,-90]) {
            color("#008C4A") pcbCurrentSensor();
        }
    }
    translate([0,-wallThickness,0]) {
        relayCurrentCaseTop();
    }
}

