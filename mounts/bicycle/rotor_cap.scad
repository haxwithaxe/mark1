/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>
include <bike_params.scad>
use <../../rotor_cap.scad>
use <../../lib/publicDomainGearV1.1.scad>


module bicycle_gear() {
  union() {
    translate([0, 0, rotor_cap_height + bicycle_gear_thickness]) {
      gear(
        bicycle_gear_spacing, bicycle_gear_teeth,
        bicycle_gear_thickness, bicycle_axis_radius*2
      );
    }
    translate([0, 0, 0]) {
      cylinder(h=blade_holder_edge - 5, r=bicycle_gear_circle_radius);
    }
  }
}

module rotor_cap() {
  difference() {
    union() {
      cylinder(h=rotor_cap_height, r=rotor_cap_radius);
    bicycle_gear();
}
    cylinder(h=rotor_cap_height + bicycle_gear_thickness*2, r=rotor_cap_inner_radius);
    subtractor();
    translate([0, 0, bicycle_gear_thickness]) {
      for (i = [0:stator_count/2]) {
        rotate([0, 0, i * (360 / (stator_count/2))]) {
          translate([(blade_holder_edge/-2) - 0.5, 0, 0]) {
              //cube([blade_holder_edge + 1, bicycle_gear_circle_radius, blade_holder_edge]);
          }
        }
      }
    }
  }
}

rotor_cap();
