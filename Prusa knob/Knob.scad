// Knob inspired by Prusa Mini
// This model utilises a locking notch on encoder knob
// Adjust a bolt size with $bolt_width variable
// You need to compensate for accuracy of your printer
// RealGusi (C) 2020
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn = 120;
$bolt_width = 6.3;

module wing( angle) {
    rotate( angle)
    translate( [ 0, -2, 0])
    cube( [ 18, 4, 10]);
}    

module knob() {
    cylinder( h = 10, r1 = 10, r2 = 7);
    wing( 0);
    wing( 120);
    wing( 240);
}

difference() {
    intersection() {
        knob();
        cylinder( h = 10, r1 = 18, r2 = 15);
    }
    cylinder( h = 7, r = $bolt_width / 2);
    translate( [ 0, 0, 21]) sphere( 12);
}
translate( [ 1.8, -3,0 ])cube( [ 2, 6, 7]);
