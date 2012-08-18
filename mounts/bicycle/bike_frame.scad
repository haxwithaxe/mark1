/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <bike_params.scad>

module bike_frame_side() {
  translate([0, (bicycle_axis_width/2) + bicycle_strut_radius, 0]) {
    rotate([bicycle_y_front_offset, -bicycle_x_front_offset, 0]) {
      cylinder(h=bike_frame_height, r=bicycle_strut_radius);
    }
    rotate([bicycle_y_rear_offset, bicycle_x_rear_offset, 0]) {
      cylinder(h=bike_frame_height, r=bicycle_strut_radius);
    }
  }
}

module bike_frame() {
  bike_frame_side();
  mirror([0, 1, 0]) bike_frame_side();
  translate([0, bicycle_axis_width/2, 0]) {
    rotate([90, 0, 0]) {
      cylinder(h=bicycle_axis_width, r=bicycle_axis_radius);
    }
  }
}

bike_frame();
