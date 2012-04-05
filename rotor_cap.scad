include <params.scad>

module rotor_insert() {
  cylinder(r=rotor_cap_radius, h=rotor_cap_height);
  for (i = [0:rotor_count]) {
    rotate(i * (360 / (rotor_count + 1)), [0, 0, 1])
    translate([0, rotor_cap_peg_radius, 0])
    cylinder(r=peg_radius, h=rotor_cap_insert_height);
  }
}

module blade_holder() {
  translate([0, 0, -blade_holder_edge]) {
    difference() {
      translate([0, blade_holder_edge/-2, 0]) {
        rotate([0, 0, 90]) { cube([blade_holder_edge, rotor_cap_radius, blade_holder_edge]); }
      }

      translate([0, 0, blade_holder_edge/2]) {
        rotate([0, -90, 0]) {
          cylinder(r=hole_radius, h=rotor_cap_radius + 10);
        }
      }
    }
  }
}

module rotor_cap_full() {
  rotor_insert();
  for (i = [0:stator_count/2]) {
    rotate([0, 0, i * (360 / (stator_count/2))]) { blade_holder(); }
  }
}

difference() {
  rotor_cap_full();
  translate([0, 0, -50]) { cylinder(h=100, r=rotor_cap_inner_radius); }
}
