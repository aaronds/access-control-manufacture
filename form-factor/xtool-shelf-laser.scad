use <xtool-shelf.scad>
$fn=100;

projection() {
    mainShelf();
}

translate([115, 6.05, 0]) {
    projection() {
        supportShelf();
    }
}

translate([115 + 7, 80 + 115 / 2 + 6.05, 0]) {
    projection() {
        supportTriangle();
    }
}

translate([150 + 7, 60 + 115 / 2 + 6.05, 0]) {
    projection() {
        supportTriangle();
    }
}
