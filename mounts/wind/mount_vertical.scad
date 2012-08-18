/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>
include <../../params.scad>
use <../../rotor.scad>

module mount_vertical() {
  linear_extrude(height=frame_thickness) import(file="mount_vertical.dxf", layer="0");
}

mount_vertical();


