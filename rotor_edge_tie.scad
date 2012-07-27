/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <params.scad>

x_inset = rotor_edge_tie_peg_inset + (hole_radius / 6);

module rotor_edge_tie_raw() {
  cube([rotor_edge_tie_length, rotor_edge_tie_width, rotor_edge_tie_inner_height]);
  translate([x_inset, rotor_edge_tie_peg_inset, 0])
    cylinder(h=rotor_edge_tie_height, r=peg_radius);
  translate([rotor_edge_tie_length - (x_inset), rotor_edge_tie_peg_inset, 0])
    cylinder(h=rotor_edge_tie_height, r=peg_radius - 0.5);
}

module rotor_edge_tie() {
  intersection() {
    translate([rotor_edge_tie_length/-2, rotor_edge_tie_width/-2, 0])
      rotor_edge_tie_raw();
    translate([-x_inset * (5/4), -hole_radius, 0])
      cube([x_inset * 2.5, hole_radius * 2, rotor_edge_tie_height]);
  }  
}

rotor_edge_tie();
