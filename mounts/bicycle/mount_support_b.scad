/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>
use <../../stator.scad>
use <mount_support_a.scad>
use <mount.scad>

module mount_support_b_unadjusted() {
  difference() {
    rotate([0, 0, 180]) {
      mount_support_unadjusted();
    }
    mount_unadjusted();
  }
}

module mount_support_b() {
  translate([0, 0, stator_radius + 53]) {
    rotate([180, 0, 0]) mount_support_b_unadjusted();
  }
}

mount_support_b();