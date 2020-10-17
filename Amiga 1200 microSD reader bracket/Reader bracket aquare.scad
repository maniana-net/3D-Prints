// Amiga 1200 micro SD card reader bracket - square version
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
$mounting_hole_distance = 18;
$plate_thickness = 6;

$screw_diameter = 2.8 / 2;

$screw_block_size = 9;
$screw_block_depth = 6;

$reader_base_width = $reader_width + 2 * $side_wall_thickness;

module main_plate_base (){
    difference (){
        translate( [ - $plate_width / 2, - $plate_length / 2, 0])
        cube( [ $plate_width, $plate_length, $mounting_hole_depth]);
        
        translate( [ 0, $plate_length / 2 - $mounting_hole_distance, 0])
        cylinder( h = $mounting_hole_depth, r = $mounting_hole_diameter);    
    }
} 

module main_plate_middle (){
    union () {
        difference () {       
            translate( [ - $reader_base_width / 2, 
                         - $plate_length / 2, 
                           $mounting_hole_depth])
            cube( [ $reader_base_width, 
                    $plate_length, 
                    $plate_thickness]);

            translate( [ 0, $plate_length / 2 - $mounting_hole_distance,
                         $mounting_hole_depth])
            cylinder( h = $plate_thickness, r = $screw_diameter);    
        }
        //Hole plug
        //Remove it so you don't have to drill through
        translate( [ 0, $plate_length / 2 - $mounting_hole_distance,
                     $mounting_hole_depth])
        cylinder( h = 0.4, r = $screw_diameter);    
    }
}

module main_plate_walls (){
    //side walls
    difference () {       
        translate( [ - $reader_base_width / 2, 
                     - $plate_length / 2 + $back_wall_thickness, 
                       $mounting_hole_depth + $plate_thickness])
        cube( [ $reader_base_width, 
                $plate_length - $back_wall_thickness, 
                $side_wall_height]);

        translate( [ - $reader_width / 2, 
                     - $plate_length / 2 + $back_wall_thickness, 
                       $mounting_hole_depth + $plate_thickness])
        cube( [ $reader_width, $reader_length, $side_wall_height]);
    }
    
    //back wall
    translate( [ - $reader_base_width / 2, 
                 - $plate_length / 2, 
                   $mounting_hole_depth + $plate_thickness])
    cube( [ $reader_base_width, 
            $back_wall_thickness, 
            $back_wall_height]);
}

module screw_blocks (){
    difference () {       
        translate( [ - $plate_width / 2, 
                       $plate_length / 2 - 2 * $screw_block_size , 
                       $mounting_hole_depth])
        cube( [ $screw_block_size, 
                $screw_block_size, 
                $side_wall_height + $plate_thickness]);

        translate( [ - $plate_width / 2 + $screw_block_size / 2, 
                       $plate_length / 2 - 1.5 * $screw_block_size, 
                       $mounting_hole_depth + $plate_thickness + $side_wall_height - 
                       $screw_block_depth])
        cylinder( h = $screw_block_depth, r = $screw_diameter);    
    }
    
    difference () {       
        translate( [   $plate_width / 2 - $screw_block_size, 
                       $plate_length / 2 - 2 * $screw_block_size , 
                       $mounting_hole_depth])
        cube( [ $screw_block_size, 
                $screw_block_size, 
                $side_wall_height + $plate_thickness]);

        translate( [   $plate_width / 2 - $screw_block_size / 2, 
                       $plate_length / 2 - 1.5 * $screw_block_size, 
                       $mounting_hole_depth + $plate_thickness + $side_wall_height - 
                       $screw_block_depth])
        cylinder( h = $screw_block_depth, r = $screw_diameter);    
    }
    
}


main_plate_base();
main_plate_middle();
main_plate_walls();
screw_blocks();
