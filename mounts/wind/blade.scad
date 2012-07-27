/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>


module blade() {
  translate([-110, 0, 0])
    linear_extrude(height=blade_thickness) import(file="blade.dxf", layer="0");
}

blade();