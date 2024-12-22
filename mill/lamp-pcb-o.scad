indTabThickness = 0.8;
indTabLength = 6.3;
lampO = [(72.1 + 72.4) / 2, (34.5 + 40.3) / 2];
conO = [109.7, 58.4];
$fn=100;

mirror([0,1,0]) {
    translate(conO) {
        circle(r=0.892);
    }

    translate(lampO - [indTabThickness / 2,indTabLength / 2, 0]) {
        square([indTabThickness, indTabLength]);
    }
}
