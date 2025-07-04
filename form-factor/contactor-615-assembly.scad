use <contactor-assembly.scad>
use <contactor-interface-smt-221-615.scad>
include <pcb-model-sizes.scad>

translate([0,45.3 / 2, 0]) {
    color("blue") contactor();
}

translate([-55, -pcbContactorInterfaceRelaySize[0] / 2, pcbContactorInterfaceRelaySize[1] + 5]) {
    rotate([90, 0, 0]) {
        rotate([0,90,0]) {
            color("green") contactorInterfaceRelay();
        }
    }
}

translate([-6,0,80 - 3]) {
    rotate([0,0,90]) {
        contactorInterfaceSMT615();
    }
}

