use <strip-wire-brown-base.scad>
use <strip-wire-brown.scad>

translate([0,0,0]) {
    linear_extrude(height=3) cutWireBrown();
}
translate([0,0,3]) {
    linear_extrude(height=3) stripWireBrown();
}
