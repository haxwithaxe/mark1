/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 * 
 */

// GLOBAL
hole_radius = 5;
peg_radius = 4.5;

// MAGNET
mag_height = 6.4;
mag_ring_ir = 50;
mag_ring_or = 102;
mag_count = 16;

// BEARING
bearing_height = 17;
bearing_ir = 33;
bearing_or = 44;

// STATOR
stator_height = 20;
stator_inner_height = 10;
stator_bearing_inset = (stator_height/2) - 1;
stator_count = 6;
stator_incidence = 360/stator_count;
stator_radius = 115;
stator_tab_width = 10;
stator_tab_offset = 50;
stator_wiring_gap = 25;
stator_wiring_gap_inset = stator_radius - (stator_wiring_gap + 10);
stator_outer_tab_extrude = 15;
stator_outer_tab_width = 30;
stator_notch = 15;
stator_notch_width = 5;
coil_edge = 80;
coil_block_length = 70;

// ROTOR & ROTOR CAP
rotor_height = 10;
rotor_inner_height = 3;
rotor_radius = 105;
rotor_inner_diameter = 25;
rotor_count = 8;
rotor_incidence = 360/rotor_count;
rotor_tie_hole_offset = 30;
rotor_notch = 10;
rotor_notch_height = 2;

rotor_cap_radius = 50;
rotor_cap_peg_radius = 35;
rotor_cap_inner_radius = 10;
rotor_cap_height = 10;
rotor_cap_insert_height = 10;
rotor_cap_bearing_inset = (bearing_height + rotor_inner_height) - rotor_cap_height;
rotor_plate_height = 5;
blade_holder_edge = 20;

// ROTOR EDGE TIE
rotor_edge_tie_length = 40;
rotor_edge_tie_width = 20;
rotor_edge_tie_inner_height = 5;
rotor_edge_tie_height = 20;
rotor_edge_tie_peg_inset = 10;


