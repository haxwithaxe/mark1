/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../params.scad>


chuck_edge = coil_edge/2;

module chuck_whole() {
  difference() {
    translate([chuck_edge/-2, 0, 0])
      cube([chuck_edge, chuck_edge/1.2, stator_height]);
    rotate([0, 0, 120]) cube([chuck_edge, chuck_edge, stator_height]);
    mirror([0, 1, 0]) {
      rotate([0, 0, 300]) cube([chuck_edge, chuck_edge, stator_height]);
    }
  }
}

module chuck() {
  difference() {
    chuck_whole();
    translate([0, chuck_edge/4, 0]) scale([0.5, 0.5, 1]) chuck_whole();
    translate([chuck_edge/-2, chuck_edge/2, stator_height/2]) {
      rotate([90, 0, 90]) cylinder(h=chuck_edge, r=1);
    }
  }
}

chuck();
