square([110, 155]);
$fn=100;
include <bleep-holes-measurements.scad>


module holesForBleep(onLid=true,withContacts=true) {
    mirror([1,0,0]) {
        translate([-(0), 0, 0]) {

            translate([110 - 21, (onLid ? 1 : 0) * (155 - 21), 0]) {
                circle(r=bleepLedCapM);
            }

            buttonTabSeparation = 9;
            buttonTabOffset = 8/2;
            buttonTabLength = 4.75;
            buttonTablThickness = 0.8;

            translate([110 - 56, (onLid ? 155 - 21 : 0), 0]) {
                difference() {
                    circle(r=bleepButtonM);
                    if (withContacts) {
                        translate([-buttonTabSeparation / 2 - buttonTabLength / 2, -buttonTabOffset - buttonTablThickness / 2,0]) {
                            square([buttonTabLength, buttonTablThickness]);
                        }

                        translate([buttonTabSeparation / 2 - buttonTabLength / 2, -buttonTabOffset - buttonTablThickness / 2,0]) {
                            square([buttonTabLength, buttonTablThickness]);
                        }
                    }
                }
            }

            indTabSeparation = 4.2;
            indTabThickness = 0.8;
            indTabLength = 6.3;
            indTabHeight = 9;

            translate([110 - 84, onLid ? (155 - 21) : 0, 0]) {
                difference() {
                    circle(r=bleepIndicatorM);
                    if (withContacts) {
                        translate([-indTabSeparation / 2 - indTabThickness / 2, -indTabLength / 2, 0]) {
                           square([indTabThickness, indTabLength]); 
                        }

                        translate([indTabSeparation / 2 - indTabThickness / 2, -indTabLength / 2, 0]) {
                           square([indTabThickness, indTabLength]); 
                        }
                    }
                }
            }
        }
    }
}

holesForBleep(onLid=false, withContacts=false);
