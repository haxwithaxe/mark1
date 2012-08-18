/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>


module bearing() {
  difference() {
    cylinder(h=bearing_height, r=bearing_or);
    cylinder(h=bearing_height, r=bearing_ir);
  }
}

bearing();
