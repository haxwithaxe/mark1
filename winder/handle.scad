use <chuck.scad>


module handle() {
  rotate([90, 180, 0]) {
    scale([0.5, 0.5, 0.75]) chuck_whole();
    translate([0, 10, -30]) cylinder(h=30, r=5);
    translate([-40, 11, -45]) cylinder(h=10, r=5);
  }
  translate([-5, 30, -5]) {
    rotate([0, 90, 0]) cube([11.5, 5, 50]);
  }
}

handle();