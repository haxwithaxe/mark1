use <chuck.scad>


module handle() {
  rotate([90, 180, 0]) {
    scale([0.5, 0.5, 0.75]) chuck_whole();
    translate([0, 10, -30]) cylinder(h=30, r=5);
    translate([0, -8, -45]) cylinder(h=10, r=5);
  }
  translate([-5, 30, -17]) {
    cube([10, 5, 30]);
  }
}

handle();