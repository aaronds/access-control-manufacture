indTabThickness = 0.8;
indTabLength = 6.3;
lampN = [(67.9 + 68.2) / 2, (34.5 + 40.3) / 2, 0];
conN = [72.5, 58.4, 0];
$fn=100;

mirror([0,1,0]) {
    translate(conN) {
        circle(r=0.892);
    }

    translate(lampN - [indTabThickness / 2,indTabLength / 2, 0]) {
        square([indTabThickness, indTabLength]);
    }
}


