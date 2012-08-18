/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../params.scad>
use <../rotor.scad>
use <../magnet.scad>
use <../bearing.scad>
use <../rotor_plate.scad>
use <../rotor_cap.scad>
use <../rotor_edge_tie.scad>


module rotor_view() {
  for (r = [0:rotor_count]) {
    rotate([0, 0, r * (360 / rotor_count)]) {
      translate([0, 0, mag_height * 2]) rotor();
        rotate([0, 0, 90 - 11.25]) magnet();
      }
    }
    translate([0, 0, rotor_plate_height * -2]) rotor_plate();
    translate([0, 0, bearing_height * -2]) {
    bearing();
    for (t = [0:rotor_count]) {
      rotate([180, 0, 22.5 + (t * (360 / rotor_count))]) {
        translate([0, 99, -100]) rotor_edge_tie_unadjusted();
      }
    }
  }
  translate([0, 0, rotor_cap_height * 5]) {
    rotor_cap();
  }
}

rotor_view();
