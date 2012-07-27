/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>
use <../../stator.scad>
use <mount.scad>

module mount_support_unadjusted() {
  translate([30, -20, stator_radius + 30]) {
    cube([100, 50, 23]);
  }
  translate([95, 10, 50]) {
    difference() {
      union() {
        cube([20, 20, 95]);
        rotate([0, 9, 0]) cube([20, 20, 100]);
      }
      translate([-17, 0, 0]) {
        rotate([0, 60, 0]) cube([20, 40, 20]);
      }
      translate([10, 41, 11]) {
        rotate([90, 0, 0]) cylinder(h=42, r=hole_radius);
      }
    }
  }
}

module mount_support_a() {
  translate([0, 0, stator_radius + 53]) {
  rotate([180, 0, 0]) {
    difference() {
      mount_support_unadjusted();
      scale([1.05, 1.05, 1.05]) mount_unadjusted();
    }
  }
  }
}

mount_support_a();
