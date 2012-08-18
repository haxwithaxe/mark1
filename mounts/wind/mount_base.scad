/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 *
 */

include <wind_params.scad>


module mount_base() {
  linear_extrude(height=frame_thickness) import(file="mount_base.dxf", layer="0");
}

mount_base();
