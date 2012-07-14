/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <params.scad>


module ring() {
	difference() {
		cylinder(h=mag_height, r=mag_ring_or);
		translate([0, 0, -1]) cylinder(h=mag_height+2, r=mag_ring_ir);
	}
}

module block() { cube([(mag_ring_or*2)+2, mag_ring_or+2, mag_height+2]); }

module magnet() {
	intersection() {
		ring();
		translate([-mag_ring_or-1, -1, -1]) block();
		rotate(v=[0,0,1], a=360/mag_count) translate([-mag_ring_or-1, -mag_ring_or-1, -1]) block();
	}
}


magnet();
