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
use <rotor_edge_tie.scad>

rotor_edge = 100;
bearing_inset = rotor_height - 2;
rotor_tab_height = rotor_height + rotor_plate_height + 3;

module subtractor() {
  rotate([0, 0, -22.5]) {
    cube([rotor_edge/2, rotor_radius + 20, rotor_height * 3]);
  }
}

module rotor_base() {
  rotate([0, 180, 0]) {
    translate([rotor_edge/-2, rotor_radius - (rotor_tab_excess/2), -rotor_height]) {
      difference() {
        cube([rotor_edge, rotor_tab_excess, rotor_tab_height]);
        cube([rotor_edge, rotor_tab_excess/2, rotor_height + rotor_plate_height]);
      }
    }
  }
  translate([-rotor_edge/2, 0, 0]) {
    cube([rotor_edge, rotor_radius, rotor_height]);
  }
}

module less_rotor_edge_tie() {
  rotate([0, 0, rotor_incidence/-2]) {
    translate([0, rotor_radius - 5.5, rotor_height - rotor_edge_tie_inner_height])
      scale([1.1, 1.1, 1.1]) rotor_edge_tie();
  }
}

module rotor_raw() {
  difference() {
    rotor_base();
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
    less_rotor_edge_tie();
    mirror([1, 0, 0]) less_rotor_edge_tie();
  }
}

module rotor() {
  rotate([0, 180, 0]) rotor_raw();
}

rotor();
