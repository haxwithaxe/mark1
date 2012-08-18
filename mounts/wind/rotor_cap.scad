/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>
include <wind_params.scad>
use <../../rotor_cap.scad>
use <blade.scad>


module blade_holder() {
  difference() {
    translate([0, blade_holder_edge/-2, rotor_cap_height]) {
      cube([rotor_cap_radius, blade_holder_edge, blade_holder_edge]);
    }
    translate([12, 5, rotor_cap_height + (blade_holder_edge/2) + 1]) {
      rotate([0, 15, -90]) {
        scale([1.05, 1.05, 1.05]) blade();
      }
    }
  }
}

module rotor_cap() {
  difference() {
    rotor_insert();
    subtractor();
  }
  for (i = [0:blade_count]) {
    rotate([0, 0, i * (360/blade_count)]) blade_holder();
  }
}

rotor_cap();
translate([12, 5, rotor_cap_height + (blade_holder_edge/2) + 1]) {
      rotate([0, 15, -90]) {
        scale([1.05, 1.05, 1.05]) blade();
      }
    }