difference() {
  union() {
    translate([-10, 0, 0]) {
      cube([20, 60, 5]);
      cube([20, 15, 20]);
    }
  }
  translate([0, 16, 20]) {
    rotate([90, 0, 0]) cylinder(h=20, r=5);
  }
}