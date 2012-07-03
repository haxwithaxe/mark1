/*
 * WARNING!
 * THIS PART CAN BE PRINTED BUT MUST BE MADE OF STAINLESS STEEL
 * THIS PART NEEDS TO CONTAIN IRON IN ORDER TO SHAPE THE MAGNETIC FLUX
 * WITHOUT IRON IT WILL DO NOTHING AND YOUR TURBINE WILL NOT WORK
 */
include <params.scad>

module octagon() {
  intersection(){
    scale ([rotor_radius*2, rotor_radius*2, rotor_plate_height]) cube(1, true);
    rotate([0,0,45]) scale ([rotor_radius*2, rotor_radius*2, rotor_plate_height]) cube(1, true);
  }
}

module hole() {
  translate([rotor_tie_hole_offset, rotor_radius - 10, 0]) {
    cylinder(h=rotor_plate_height, r=hole_radius);
  }
}

module rotor_plate() {
  difference() {
    translate([0, 0, rotor_plate_height/2]) octagon();
    cylinder(h=rotor_plate_height, r=rotor_cap_radius);
    for (i = [0:rotor_count]) {
      rotate([0, 0, i * (360 / rotor_count)]) {
        hole();
        mirror([1, 0, 0]) hole();
      }
    }
  }
  difference() {
  for (i = [0:stator_count/2]) {
    rotate([0, 0, i * (360 / (stator_count / 2))]) {
      translate([0, blade_holder_edge / -2, 0]) {
        cube([rotor_cap_radius, blade_holder_edge, rotor_plate_height]);
      }
    }
  }
  cylinder(h=rotor_plate_height, r=bearing_or + 0.5);
  }
}

rotor_plate();
