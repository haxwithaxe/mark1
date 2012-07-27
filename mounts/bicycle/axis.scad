/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>
include <bike_params.scad>


module axis() {
  cylinder(h=bicycle_axis_width + 5, r=bicycle_axis_radius - 0.1);
  cylinder(h=5, r=bicycle_axis_radius*2);
}

axis();