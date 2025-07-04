contactor();

translate([-40, 0, 0]) {
    contactorInterfaceRelay();
}

module contactorInterfaceRelay() {
    translate([-92, 21, 0]) {
        rotate([-90, 0, 0]) {
            scale(1000) {
                import("pcb-models/contactor-interface-relay.stl");
            }
        }
    }
}

module contactor() {
    rotate([90, 0, 0]) {
        scale(25) {
            import("pcb-models/CJX2-09_12.stl");
        }
    };
}
