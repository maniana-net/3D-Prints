// Syringe holder
// RealGusi (C) 2020
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn = 120;

// Modify those 3 variables to adjust a proper size
// Below are ok for 10ml syringe
$diameter_inner = 21;
$wall_thickness = 1.6;
$height = 10;

$diameter_outer = $diameter_inner + $wall_thickness * 2;



difference() {
    cylinder( h = $height, r = $diameter_outer/ 2);
    cylinder( h = $height, r = $diameter_inner / 2);
    translate( [ 0, -$diameter_outer / 2, 0]) 
    cube( [ $diameter_outer / 2, $diameter_outer, $height]);
}

translate( [ 0, -$diameter_outer / 2, 0])
cube( [ $diameter_outer / 2, $wall_thickness, $height]);

translate( [ 0, $diameter_outer / 2 - $wall_thickness, 0])
cube( [ $diameter_outer / 2, $wall_thickness, $height]);

translate( [ $diameter_inner / 2, - $diameter_outer , 0])
cube( [ $wall_thickness, $diameter_outer * 2, $height]);
