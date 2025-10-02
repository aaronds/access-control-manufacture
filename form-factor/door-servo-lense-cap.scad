include <../mill/bleep-holes-measurements.scad>
include <door-servo-measurements.scad>

ledId=10;
ledOd=(bleepIndicatorM) * 2;
transparentWall=0.25;
ledHeight=11.6;
outerRing=1;
$fn=100;

difference() {
    union() {
        cylinder(r=(ledOd) / 2,h=ledHeight + transparentWall);
        cylinder(r1=(ledOd) / 2,r2=outerRing + (ledOd-gapToFit) / 2,h=thinWall);
    }
    translate([0,0,transparentWall]) {
        cylinder(r=(ledId) / 2, h=ledHeight + 0.01);
    }
}
