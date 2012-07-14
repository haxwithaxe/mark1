include <params.scad>
use <bearing.scad>


stator_x = stator_radius * 1.25;

module coil_subtractor() {
 rotate([0, 0, -30]) {
    cube([coil_edge/2, coil_edge*1.5, stator_height]);
  }
}

module coil() {
  difference() {
    translate([coil_edge/-2, 0, 0]) {
      cube([coil_edge, coil_block_length, stator_height]);
    }
    coil_subtractor();
    mirror([1, 0, 0]) coil_subtractor();
  }
}

module subtractor() {
  rotate([0, 0, -90 + stator_incidence]) {
    cube([stator_radius*0.75, stator_radius*1.5, stator_height]);
  }
}

module tab() {
  difference() {
    cube([stator_outer_tab_width, stator_outer_tab_extrude, stator_height]);
    translate([stator_outer_tab_width/2, stator_outer_tab_extrude/2, 0]) {
      cylinder(h=stator_height, r=hole_radius);
    }
  }
}

module notch() {
  translate([0, (stator_notch/2) - (stator_notch_width/2), 0]) {
    cube([stator_notch, stator_notch_width, stator_height]);
  }
  translate([0, 0, stator_height - stator_notch_width]) {
    cube([stator_notch, stator_notch, stator_notch_width]);
  }
}

module stator() {
  difference() {
    translate([stator_x/-2, 0, 0]) {
      cube([stator_x, stator_radius, stator_height]);
    }
    translate([0, coil_edge/2, 0]) coil();
    subtractor();
    mirror([1, 0, 0]) subtractor();
    rotate([0, 0, -90 + stator_incidence]) {
      translate([-stator_notch, stator_tab_offset, 0]) notch();
    }
    translate([stator_x/-2, stator_wiring_gap_inset, stator_height - stator_inner_height]) {
      cube([stator_x, stator_wiring_gap, stator_inner_height]);
    }
    translate([stator_notch_width/-2, 0, 0]) {
      cube([stator_notch_width, stator_notch, stator_height]);
    }
    translate([25, stator_radius - stator_notch, stator_height/2]) {
      cube([stator_notch_width, stator_radius/2, stator_height/2]);
    }
    translate([0, 0, stator_height - stator_bearing_inset]) bearing();
    translate([0, 0, stator_bearing_inset - bearing_height]) bearing();
  }
  translate([stator_outer_tab_width/-2, stator_radius, 0]) tab();
  rotate([0, 0, 90 - stator_incidence]) {
    translate([-stator_notch, stator_tab_offset, 0]) notch();
  }
}

stator();
