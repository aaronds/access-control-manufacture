include <pcb-model-sizes.scad>

relayTopStands=[9, 42];
relayBottomStands = [12, 41];

module bentoRelay(wallThickness=[2,2,2], solderThickness=3, boardThickness=1.6, standSize = 2) {
    difference() {
        cube([wallThickness[0] * 2 + pcbDevkitcRelaySize[0], wallThickness[1] * 2 + pcbDevkitcRelaySize[1], wallThickness[2] + solderThickness + boardThickness]);
        translate([wallThickness[0], wallThickness[1], wallThickness[2]]) {
            cube([pcbDevkitcRelaySize[0], pcbDevkitcRelaySize[1], solderThickness + boardThickness + 0.01]);
        }
    }
    translate(wallThickness) {
        for(stand = relayBottomStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }
    translate(wallThickness + [0, pcbDevkitcRelaySize[1] - standSize, 0]) {
        for(stand = relayTopStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }
}

bentoRelay();


currentTopStands=[6, 28];
currentBottomStands = [7, 27];

module bentoCurrentSensor(wallThickness=[2,2,2], solderThickness=3, boardThickness=1.6, standSize = 2) {
    difference() {
        cube([wallThickness[0] * 2 + pcbCurrentSensorSize[0], wallThickness[1] * 2 + pcbCurrentSensorSize[1], wallThickness[2] + solderThickness + boardThickness]);
        translate([wallThickness[0], wallThickness[1], wallThickness[2]]) {
            cube([pcbCurrentSensorSize[0], pcbCurrentSensorSize[1], solderThickness + boardThickness + 0.01]);
        }
    }
    translate(wallThickness) {
        for(stand = currentBottomStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }
    translate(wallThickness + [0, pcbCurrentSensorSize[1] - standSize, 0]) {
        for(stand = currentTopStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }
}

translate([80, 0, 0]) {
    bentoCurrentSensor();
}


smtLvTopStands=[0, pcbSmtLvSize[0] - 2 ];
smtLvBottomStands=[pcbSmtLvSize[0]/4, pcbSmtLvSize[0] - pcbSmtLvSize[0]/4 ];

module bentoSmtLv(wallThickness=[2,2,2], solderThickness=3, boardThickness=1.6, standSize = 2, topWall=true) {
    difference() {
        cube([wallThickness[0] * (topWall ? 2 : 1) + pcbSmtLvSize[0], wallThickness[1] * 2 + pcbSmtLvSize[1], wallThickness[2] + solderThickness + boardThickness]);
        translate([wallThickness[0], wallThickness[1], wallThickness[2]]) {
            cube([pcbSmtLvSize[0], pcbSmtLvSize[1], solderThickness + boardThickness + 0.01]);
        }
    }
    translate(wallThickness) {
        for(stand = smtLvBottomStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }
    translate(wallThickness + [0, pcbSmtLvSize[1] - standSize, 0]) {
        for(stand = smtLvTopStands) {
            translate([stand, 0, 0]){
               cube([standSize, standSize, solderThickness]);
            }
        }
    }
}

translate([140, 0, 0]) {
    bentoSmtLv();
}


echo(pcbContactorPsuSize[0]);

module bentoContactorPsu(wallThickness=[2,2,2], solderThickness=3, boardThickness=1.6, standSize = 2) {
    difference() {
        cube([wallThickness[0] * 2 + pcbContactorPsuSize[0], wallThickness[1] * 2 + pcbContactorPsuSize[1], wallThickness[2] + solderThickness + boardThickness]);
        translate([wallThickness[0], wallThickness[1], wallThickness[2]]) {
            cube([pcbContactorPsuSize[0], pcbContactorPsuSize[1], solderThickness + boardThickness + 0.01]);
        }
    }

    translate([wallThickness[0] + pcbContactorPsuSize[0] / 2 - 2 * standSize, wallThickness[1] + pcbContactorPsuSize[1] / 2 - 2 * standSize, wallThickness[2]]) {
        cube([4 * standSize, 4 * standSize, solderThickness]);
    }
}

translate([220, 0, 0]) {
    bentoContactorPsu();
}
