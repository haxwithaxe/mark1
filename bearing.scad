/*
 * Copyright (c) 2012 Haydn Vestal
 * 
 * See the file license.txt for copying permission.
 * 
 * 
 * DISCLAIMER!
 * THIS IS NOT A PRINTED PART
 * IT IS A PLACEHOLDER FOR A THIRD-PARTY BEARING
 */
include <params.scad>

module bearing() {
  difference() {
    cylinder(h=bearing_height,  r=bearing_or);
    cylinder(h=bearing_height, r=bearing_ir);
  }
}

bearing();
