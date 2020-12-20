// Atari XEGS Buttor replacement stand
// RealGusi (C) 2020
// https://maniana.net
// Creative Commons - Attribution - Non-Commercial - Share Alike license.

// Modify those 2 variables to adjust a proper size
$stand_width = 6;
$stand_height = 6.4;
$spacer_thickness = 4.0;

translate( [ - ( $stand_width) / 2, - ( $stand_width) / 2, , 0])
cube( [ $stand_width , 2, $stand_height]);

translate( [ - ( $stand_width) / 2, + ( $stand_width) / 2 - 2, , 0])
cube( [ $stand_width , 2, $stand_height]);

translate( [ - $spacer_thickness / 2, - ( $stand_width) / 2, 0])
cube( [ $spacer_thickness , $stand_width, $stand_height]);
