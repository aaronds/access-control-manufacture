lidWidth = 118;
lidLength = 160;
lidFullHeight = 17.5;
lidThickness = 19.64 - 17.6;
screwWidth = 98;
screwLength = 141.2;
screwM = 3.1;

tableThickness=3;
$fn=100;

viceSize = 20;
viceLength = 100;

/*projection()*/ difference() {
    union() {
        translate([-lidWidth / 2, -lidLength / 2, 0]) {
            color("brown") cube([lidWidth, lidLength, tableThickness]);

        }
        translate([-viceSize / 2, (lidLength / 2) - viceLength - viceSize, -viceSize]) {
            cube([viceSize, viceLength, viceSize]);
        }

        translate([-viceSize * 2, (lidLength / 2) - viceLength - 2 * viceSize, -viceSize]) {
            cube([viceSize * 4, viceSize, viceSize]);
        }
    }

    translate([0, screwLength / 2, -0.01]) {
        translate([-screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.1);
        }
        translate([screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.1);
        }
    }

    translate([0, -screwLength / 2, -0.01]) {
        translate([-screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.1);
        }
        translate([screwWidth / 2, 0, 0]) {
            cylinder(r=screwM/2, h=tableThickness + 0.1);
        }
    }

    translate([0, (lidLength / 2) - viceLength - 1.5 * viceSize, -viceSize - 0.01]) {
        translate([-viceSize, 0, 0]) {
            cylinder(r=screwM/2, h=viceSize + tableThickness + 0.1);
        }

        translate([viceSize, 0, 0]) {
            cylinder(r=screwM/2, h=viceSize + tableThickness + 0.1);
        }
    }

    translate([0, 0, -viceSize - 0.01]) {
        translate([0, 0, 0]) {
            cylinder(r=screwM/2, h=viceSize + tableThickness + 0.1);
        }

        translate([0, viceLength / 4, 0]) {
            cylinder(r=screwM/2, h=viceSize + tableThickness + 0.1);
        }
    }
}

