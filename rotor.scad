include <params.scad>
use <magnet.scad>

rotor_edge = 100;

module subtractor() {
  rotate([0, 0, -22.5]) {
    cube([rotor_edge/2, rotor_radius + 20, rotor_height]);
  }
}

module rotor() {
  difference() {
    translate([-rotor_edge/2, 0, 0]) { cube([rotor_edge, rotor_radius, rotor_height]); }
    subtractor();
    mirror([1, 0, 0]) { subtractor(); }
    translate([-rotor_edge/2, 0, 0]) { cube([rotor_edge, 25, rotor_height]); }
    translate([-rotor_edge/2, 0, 3]) { cube([rotor_edge, 50, 7]); }
    translate([0, 35, 0]) { cylinder(h=rotor_height, r=hole_radius); }
    translate([30, rotor_radius - 10, 0]) { cylinder(h=rotor_height, r=hole_radius); }
    translate([-30, rotor_radius - 10, 0]) { cylinder(h=rotor_height, r=hole_radius); }
    rotate([0, 0, rotor_incidence*1.75]) { magnet(); }
  }
}

rotor();
