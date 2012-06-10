include <params.scad>

x_inset = rotor_edge_tie_peg_inset + (hole_radius / 4);

module rotor_edge_tie_raw() {
  union() {
    cube([rotor_edge_tie_length, rotor_edge_tie_width, rotor_edge_tie_inner_height]);
    translate([x_inset, rotor_edge_tie_peg_inset, 0]) {
      cylinder(h=rotor_edge_tie_height, r=peg_radius);
    }
    translate([rotor_edge_tie_length - (x_inset), rotor_edge_tie_peg_inset, 0]) {
      cylinder(h=rotor_edge_tie_height, r=peg_radius);
    }
  }
}

module rotor_edge_tie() {
  translate([rotor_edge_tie_length/-2, rotor_edge_tie_width/-2, 0]) rotor_edge_tie_raw();
}

rotor_edge_tie();
