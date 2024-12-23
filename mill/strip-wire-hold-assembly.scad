include <strip-wire-measurements.scad>
use <strip-wire-hold.scad>
use <strip-wire-hold-base.scad>

translate([0,0,0]) {
    linear_extrude(height=sheetThickness) stripWireHoldBase();
}

translate([0,0,sheetThickness]) {
    linear_extrude(height=sheetThickness) stripWireHold();
}
