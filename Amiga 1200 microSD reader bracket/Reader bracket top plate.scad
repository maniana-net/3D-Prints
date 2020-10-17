// Amiga 1200 micro SD card reader bracket - top plate
// RealGusi (C) 2020
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn = 120;

$back_wall_thickness = 4.8;
$back_wall_height = 3;
$side_wall_thickness = 2.8;
$side_wall_height = 7.0;
$reader_width = 26;
$reader_length = 31;

$plate_width = 45.2;
$plate_length = $reader_length + $back_wall_thickness;
$mounting_hole_depth = 2.2;
$mounting_hole_diameter = 11 / 2;
$mounting_hole_distance = 19;
$plate_thickness = 6;

$screw_diameter = 2.8 / 2;

$screw_block_size = 9;
$screw_block_depth = 5;

$reader_base_width = $reader_width + 2 * $side_wall_thickness;

$top_plate_height = 2;
$top_plate_screw_diameter = 3.4 / 2;

module screw_blocks (){
    difference () {       
        union () {
            translate( [ - $plate_width / 2 + $screw_block_size / 2, 0, 0])
            cylinder( h = $top_plate_height, r = $screw_block_size / 2);    

            translate( [   $plate_width / 2 - $screw_block_size / 2, 0, 0])
            cylinder( h = $top_plate_height, r = $screw_block_size / 2);    
            
            translate( [ - $plate_width / 2 + $screw_block_size / 2, 
                         - $screw_block_size / 2, 0])
            cube( [ $plate_width - $screw_block_size, 
                    $screw_block_size, 
                    $top_plate_height]);
        }

        translate( [ - $plate_width / 2 + $screw_block_size / 2, 
                       0, 0])
        cylinder( h = $top_plate_height, r = $top_plate_screw_diameter);    
        translate( [   $plate_width / 2 - $screw_block_size / 2, 
                       0, 0])
        cylinder( h = $top_plate_height, r = $top_plate_screw_diameter);    
    }
}

screw_blocks();
