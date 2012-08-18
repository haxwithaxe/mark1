/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 * 
 */

include <params.scad>
use <bearing.scad>
use <magnet.scad>
use <rotor_peg.scad>

rotor_edge = 100;
bearing_inset = rotor_height - 2;

module subtractor() {
  rotate([0, 0, -22.5]) {
    cube([rotor_edge/2, rotor_radius + 20, rotor_height * 3]);
  }
}

module rotor() {
  difference() {
    translate([-rotor_edge/2, 0, 0]) {
      cube([rotor_edge, rotor_radius, rotor_height]);
    }
    translate([0, 0, rotor_height * -1.5]) {
      subtractor();
      mirror([1, 0, 0]) { subtractor(); }
    }
    translate([-rotor_edge/2, 0, 0])
      cube([rotor_edge, rotor_inner_radius, rotor_height * 2]);
    translate([0, 0, rotor_height - bearing_inset]) bearing();
    translate([rotor_tie_hole_offset, rotor_radius - 10, 0])
      cylinder(h=rotor_height, r=hole_radius);
    translate([-rotor_tie_hole_offset, rotor_radius - 10, 0])
      cylinder(h=rotor_height, r=hole_radius);
    rotate([0, 0, rotor_incidence*1.75]) magnet();
    translate([0, 1, rotor_height * -2]) {
      rotate([0, 0, rotor_incidence*1.75]) {
        scale([1, 1, 2]) magnet();
      }
    }
    translate([rotor_peg_width/-2, rotor_inner_radius + 2, -rotor_height])
      scale([1.05, 1.05, 1.05]) rotor_peg_unadjusted();
  }
}

rotor();
