include <../params.scad>
use <rotor.scad>
use <stator.scad>

rotor_view();
translate([0, 0, rotor_height + stator_height*1.25]) stator_view();
translate([0, 0, rotor_height*3 + stator_height*3]) {
  mirror([0, 0, 1]) rotor_view();
}