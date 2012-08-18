/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>
use <mount_base.scad>
use <mount_vertical.scad>


module vane() {
  linear_extrude(height=3) import(file="vane.dxf", layer="0");
}

vane();

