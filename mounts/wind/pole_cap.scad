/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>
use <bearing.scad>

module pole_cap() {
  difference() {
    union() {
      cylinder(h=pole_cap_height, r=swivel_ir - 1.5);
      cylinder(h=10, r=swivel_or + 5);
    }
    cylinder(h=pole_cap_height - 10, r=pole_radius + 1);
  }
}

pole_cap();

