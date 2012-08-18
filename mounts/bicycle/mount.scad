/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>
include <bike_params.scad>
use <../../stator.scad>
use <bike_frame.scad>
use <rotor_cap.scad>

mount_length = 130;
mount_size = 20;

module mount_unadjusted() {
  difference() {
    translate([(mount_length/-2) - 10, bicycle_axis_width/-2, stator_radius + 20]) {
      difference() {
        cube([mount_length, bicycle_axis_width, mount_size]);
        translate([10, 10, 0])
          cube([mount_length - mount_size, bicycle_axis_width - mount_size, mount_size]);
      }
      translate([mount_size/2, (bicycle_axis_width/2) - 5, 0]) {
        cube([mount_length - mount_size, mount_size, mount_size]);
      }
      translate([mount_length/2 - 5, (bicycle_axis_width/2) - 5, -22]) {
        difference() {
          cube([stator_outer_tab_width, mount_size, 32]);
          translate([stator_outer_tab_width/2, mount_size/2 + 11, 8]) {
            rotate([90, 0, 0]) cylinder(h=mount_size + 2, r=hole_radius);
          }
        }
      }
    }
    bike_frame();
  }
}

module mount() {
  translate([0, 0, stator_radius + 40]) {
    rotate([180, 0, 0]) mount_unadjusted();
  }
}

mount();
