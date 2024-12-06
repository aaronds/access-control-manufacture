/*%square([110, 155]);*/
$fn=100;

mirror([1,0,0]) {
    translate([-(110 - 56), 0, 0]) {

        translate([110 - 21, 155 - 21, 0]) {
            circle(r=6.4/2);
        }

        buttonTabSeparation = 9;
        buttonTabOffset = 8/2;
        buttonTabLength = 4.75;
        buttonTablThickness = 0.8;

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

        indTabSeparation = 4.2;
        indTabThickness = 0.8;
        indTabLength = 6.3;
        indTabHeight = 9;
        translate([110 - 84, 155 - 21, 0]) {
            difference() {
                circle(r=11.8/2);
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
