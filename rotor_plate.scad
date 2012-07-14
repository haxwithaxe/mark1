/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 * 
 * 
 * WARNING!
 * THIS PART CAN BE PRINTED BUT MUST BE MADE OF STAINLESS STEEL
 * THIS PART NEEDS TO CONTAIN IRON IN ORDER TO SHAPE THE MAGNETIC FLUX
 * WITHOUT IRON IT WILL DO NOTHING AND YOUR TURBINE WILL NOT WORK
 */
include <params.scad>

linear_extrude(file="rotor_plate.dxf", layer="Layer_1", height=rotor_plate_height);
