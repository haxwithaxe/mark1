/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 * 
 */

include <../params.scad>
use <chuck.scad>


module subtractor() {  
  translate([coil_edge/-2 - 2, coil_block_length/1.8, 0]) {
    cube([coil_edge/3, coil_edge/10, stator_height]);
  }
}

module support_whole() {
  difference() {
    translate([coil_edge/-2, 0, 0]) cube([coil_edge, coil_block_length, 3]);
    rotate([0, 0, -30])  cube([coil_edge/2, coil_edge, 3]);
    mirror([1, 0, 0]) {
      rotate([0, 0, -30])  cube([coil_edge/2, coil_edge, 3]);
    }
  }
  translate([0, coil_block_length/2, 0]) {
    scale([0.45, 0.45, 0.5]) chuck_whole();
  }
}

module support() {
  difference() {
    support_whole();
    subtractor();
    mirror([1, 0, 0]) subtractor();
  }
}

support();
