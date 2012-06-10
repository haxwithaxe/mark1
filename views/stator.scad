include <../params.scad>
use <../stator.scad>


module stator_view() {
  for (s = [0:stator_count]) {
    rotate([0, 0, s * (360 / stator_count)]) {
      stator();
    }
  }
}

stator_view();