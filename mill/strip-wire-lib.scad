module stripWireCuts(wireLength=10,stripInLength=5,stripOutLength=5) {
    translate([stripInLength - toolR, -toolWidth - (wireD / 2)]) {
        square([toolWidth, 2 * toolWidth + wireD]);
    }

    translate([stripInLength + wireLength - toolR, -toolWidth - (wireD / 2)]) {
        square([toolWidth, 2 * toolWidth + wireD]);
    }
}

module cutWireCuts(wireLength=10, stripInLength=5,stripOutLength=5) {
    translate([wireLength + stripInLength + stripOutLength, -toolWidth / 2]) {
        square([toolWidth, toolWidth]);
    }
}
