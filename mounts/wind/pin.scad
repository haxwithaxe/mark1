/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>
include <../../params.scad>


pin_height = frame_thickness + stator_height + (hole_radius * 2);

module pin_unadjusted() {
  difference() {
    cylinder(h=pin_height, r=peg_radius);
    translate([-peg_radius, 0, 25]) {
      rotate([0, 90, 0]) cylinder(h=peg_radius*2, r=peg_radius/2);
    }
  }
  cylinder(h=3, r=peg_radius + 3);
}

module pin() {
  difference() {
    rotate([0, 90, 0]) pin_unadjusted();
    translate([0, -peg_radius - 3, peg_radius*-2.75]) 
      cube([pin_height + 1, (peg_radius*2) + 6, peg_radius*2]);
  }
}

pin();
