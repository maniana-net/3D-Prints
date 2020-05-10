// Picture hanger
// Picutre part / left side
// RealGusi (C) 2020
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

$fn = 120;

$thickness = 2;
$slide_length = 20;
$width = 10;
$screw_width = 3.3;

$wedge_section = 15;

module whole_part() {
  translate( [-$slide_length - $wedge_section / 2, 0, 0])
  cylinder( h = $thickness, r = $width/ 2);
    
  translate( [ $slide_length + $wedge_section / 2, 0, 0])
  cylinder( h = $thickness, r = $width/ 2);
    
  translate( [-$slide_length - $wedge_section / 2, -$width / 2, 0])
  cube( [ $slide_length * 2 + $wedge_section, $width, $thickness]);
}

module screw_hole( angle) {
  rotate( [ 0, 0, angle])
  translate( [ $wedge_section / 2, 0, 0]) 
  translate( [ $screw_width / 2, 0, 0]) 
  cylinder( h = $thickness, r = $screw_width/ 2);
    
  rotate( [ 0, 0, angle])
  translate( [ $wedge_section / 2, 0, 0]) 
  translate( [ $slide_length, 0, 0]) 
  cylinder( h = $thickness, r = $screw_width/ 2);
    
  rotate( [ 0, 0, angle])
  translate( [ $wedge_section / 2, 0, 0]) 
  translate( [ $screw_width / 2, - $screw_width / 2, 0]) 
  cube( [ $slide_length - $screw_width / 2, $screw_width, $thickness]);
}    

difference() {
  whole_part();
  screw_hole( 0);
  screw_hole( 180);
}

difference() {
  translate( [ -5, - $width / 2, $thickness]) 
  cube( [ 10, 10, 10]);

  rotate( [ 0, 0, 45])
  translate( [ - sqrt( 10 * 10 + 10 * 10) / 2, 0, $thickness]) 
  cube( [ sqrt( 10 * 10 + 10 * 10), sqrt( 10 * 10 + 10 * 10), 10]);
}