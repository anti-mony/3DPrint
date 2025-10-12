length = 30;
width = 6;

module hook(length, width) {
  slitWidth = 0.4 * width;
  difference() {
    square([length, width]);
    translate([2.5, (width / 2) - (slitWidth / 2), 0]) square([length, slitWidth]);
  }
  hookArmLength = 5;
  hookArmWidth = 2;
  color("orange") translate([length - hookArmLength/2, -hookArmWidth, 0]) square([hookArmLength/2, hookArmWidth]);
  color("blue") translate([length - 2 * hookArmLength, -2 * hookArmWidth, 0]) square([2 * hookArmLength, hookArmWidth]);
  color("orange") translate([length - hookArmLength/2, width, 0]) square([hookArmLength/2, hookArmWidth]);
  color("blue") translate([length - 2 *hookArmLength, width+hookArmWidth, 0]) square([2*hookArmLength, hookArmWidth]);
}

linear_extrude(5) hook(length, width);
