/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <params.scad>


module rotor_peg_unadjusted() {
  cube([rotor_peg_width, (bearing_ir - rotor_inner_radius) - 5, rotor_peg_height]);
}

module rotor_peg() {
  rotate([0, 90, 0])
  rotor_peg_unadjusted();
}

rotor_peg();