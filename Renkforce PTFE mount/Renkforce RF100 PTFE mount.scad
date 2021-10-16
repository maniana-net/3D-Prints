// RealGusi (C) 2021
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn = 60;

$accuracy = 0.1;
$hole_distance = 8;
$screw_hole_r = 3.6 / 2;
$ptfe_hole_r = 9.5 / 2;
$back_thickness = 2;
$wall_thickness = 2.4;
$back_width = 20 + $wall_thickness * 2;
$back_height = 30 + $wall_thickness * 2;

module screw_hole( s_x, s_y) {
    translate( [ s_x, s_y, -$accuracy])
        cylinder( h = $back_thickness + $accuracy * 2, r = $screw_hole_r);
}

module back_plate(){
    difference(){
        cube( [$back_width, $back_height, $back_thickness]);
        screw_hole( $back_width / 2, $back_height / 2 - $hole_distance / 2);
        screw_hole( $back_width / 2, $back_height / 2 + $hole_distance / 2);
    }
}

module top_plate() {
    difference() {
        union() {
            translate( [ $back_width / 2, 
                         $wall_thickness, 
                         $back_width / 2 + $back_thickness])
            rotate( [ 90, 0, 0])
                cylinder( h = $wall_thickness, r = $back_width / 2);
            translate( [ 0, 0, $back_thickness])
                cube( [ $back_width, $wall_thickness, $back_width / 2]);
        }
        translate( [ $back_width / 2, 
                     $wall_thickness + $accuracy, 
                     $back_width / 2 + $back_thickness])
        rotate( [ 90, 0, 0])
            cylinder( h = $wall_thickness + $accuracy * 2, r = $ptfe_hole_r);
    }
}

module side_wall( s_x) {
    translate( [ s_x, $wall_thickness, $back_thickness])
    rotate( [ 90, 0, 90])
    linear_extrude( $wall_thickness)
    polygon( points = [ [0,0], 
                        [ 0,$back_width / 2], 
                        [ $back_height / 2 - $wall_thickness,0]]);
}

back_plate();
top_plate();
side_wall( 0);
side_wall( $back_width -$wall_thickness);