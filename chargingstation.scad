appleWatchDiameter = 27 + 2;
pixelWatchLength = 41 + 2;
pixelWatchWidth = 27 + 2;
wireWidth = 4;
width = 90;
height = 40;
depth = 5;
basePlateHeight = 5;
cavity = 8;
cornerRadius = 6;

module applewatchcharger() {
  circle(d=appleWatchDiameter, $fn=256);
}

module pixelwatchcharger() {
  $fn = 128;

  r = pixelWatchWidth / 2;
  straight = pixelWatchLength - pixelWatchWidth;

  hull() {
    translate([-straight / 2, 0])
      circle(r=r);
    translate([straight / 2, 0])
      circle(r=r);
  }
}

module bottom() {
  xSpace = (width - (appleWatchDiameter + pixelWatchLength)) / 3;
  ySpace = (height - appleWatchDiameter) / 2;

  appleWatchCenterX = (appleWatchDiameter / 2) + xSpace;
  pixelWatchCenterX = (2 * xSpace + appleWatchDiameter) + (pixelWatchLength / 2);

  difference() {
    linear_extrude(height=depth) offset(r=cornerRadius) offset(delta=-cornerRadius) square(size=[width, height]);
    color("pink") translate([cavity / 2, cavity / 2, -1])
        linear_extrude(height=depth) square(size=[width - cavity, height - cavity]);
  }

}

module top() {
  xSpace = (width - (appleWatchDiameter + pixelWatchLength)) / 3;
  ySpace = (height - appleWatchDiameter) / 2;

  appleWatchCenterX = (appleWatchDiameter / 2) + xSpace;
  pixelWatchCenterX = (2 * xSpace + appleWatchDiameter) + (pixelWatchLength / 2);

  translate([0, 0, basePlateHeight]) linear_extrude(height=depth)
      difference() {
        offset(r=cornerRadius) offset(delta=-cornerRadius) square(size=[width, height]);
        color("orange") translate([appleWatchCenterX, (appleWatchDiameter / 2) + ySpace])
            applewatchcharger();
        translate([appleWatchCenterX - (wireWidth / 2), 0]) square([4, height / 4]);

        color("purple") translate([pixelWatchCenterX, (appleWatchDiameter / 2) + ySpace])
            pixelwatchcharger();
        translate([pixelWatchCenterX - (wireWidth / 2), 0]) square([4, height / 4]);
      }
}

module dock() {
  xSpace = (width - (appleWatchDiameter + pixelWatchLength)) / 3;
  ySpace = (height - appleWatchDiameter) / 2;

  appleWatchCenterX = (appleWatchDiameter / 2) + xSpace;
  pixelWatchCenterX = (2 * xSpace + appleWatchDiameter) + (pixelWatchLength / 2);

  difference() {
    linear_extrude(height=depth) offset(r=cornerRadius) offset(delta=-cornerRadius) square(size=[width, height]);
    color("pink") translate([cavity / 2, cavity / 2, -1])
        linear_extrude(height=depth) square(size=[width - cavity, height - cavity]);
  }

  translate([0, 0, basePlateHeight]) linear_extrude(height=depth)
      difference() {
        offset(r=cornerRadius) offset(delta=-cornerRadius) square(size=[width, height]);
        color("orange") translate([appleWatchCenterX, (appleWatchDiameter / 2) + ySpace])
            applewatchcharger();
        translate([appleWatchCenterX - (wireWidth / 2), 0]) square([4, height / 4]);

        color("purple") translate([pixelWatchCenterX, (appleWatchDiameter / 2) + ySpace])
            pixelwatchcharger();
        translate([pixelWatchCenterX - (wireWidth / 2), 0]) square([4, height / 4]);
      }
}

// top();
bottom();