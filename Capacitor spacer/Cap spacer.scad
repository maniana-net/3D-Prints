// Radial capacitor spacer
// RealGusi (C) 2020
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn = 120;

// Modify those 2 variables to adjust a proper size
$cap_diameter = 10;
$height = 2;

$wall_thickness = 0.8;

$radius_outer = $cap_diameter / 2;
$radius_inner = $radius_outer - $wall_thickness;

difference() {
    cylinder( h = $height, r = $radius_outer);
    cylinder( h = $height, r = $radius_inner);
    
    rotate( [ 0, 0, -45]) 
    cube( [ $radius_outer, $radius_outer, $height]);
    rotate( [ 0, 0, -225]) 
    cube( [ $radius_outer, $radius_outer, $height]);
}

translate( [ - $wall_thickness / 2, - ( $radius_outer + $radius_inner) / 2, 0])
cube( [ $wall_thickness , $radius_outer + $radius_inner, $height]);
