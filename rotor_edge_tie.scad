include <params.scad>

module rotor_edge_tie() {
	union() {
		cube([40, 20, 5]);
		translate([10, 10, 0]) { cylinder(h=15, r=4.5); }
		translate([30, 10, 0]) { cylinder(h=15, r=4.5); }
	}
}

rotor_edge_tie();