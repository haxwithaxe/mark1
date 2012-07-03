difference() {
  union() {
    translate([-10, 0, 0]) {
      cube([20, 75, 5]);
      cube([20, 15, 40]);
    }
  }
  translate([0, 16, 40]) {
    rotate([90, 0, 0]) cylinder(h=20, r=5);
  }
}