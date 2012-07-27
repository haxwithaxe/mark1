/*
 * Copyright (c) 2012 Haydn Vesta
 * 
 * See the file license.txt for copying permission.
 *
 */

include <../../params.scad>


module peg() {
  cylinder(h=3, r=2*peg_radius);
  cylinder(h=45, r=peg_radius);
}

peg();