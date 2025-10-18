totalSide = 84;
plateDelta = 6;
plateSide = totalSide - plateDelta;
height = 12;

module plate3d(side) {
  linear_extrude(height=2) plate(side=side - 0.25);;
}

module plate(side) {
  difference() {
    square(side, center=true);
    square(side - 8, center=true);
  }
  for (i = [-1:1]) {
    color("orange") translate(v=[i * 20, 0, 0]) square([2, side - 8], center=true);
  }
  for (i = [-1:1]) {
    color("white") translate(v=[0, i * 20, 0]) square([side - 8, 2], center=true);
  }
}

module base(side, plateSide, height) {
  baseSurfaceThickness = 2;
  visualAid = 1;
  plateDistanceFromBaseSurface = 8;
  difference() {
    color("orange") linear_extrude(height=height) square(side);
    color("pink") translate([plateDelta, plateDelta, baseSurfaceThickness])
        linear_extrude(height - baseSurfaceThickness + visualAid)
          square(plateSide - plateDelta);
    color("purple") translate([plateDelta / 2, plateDelta / 2, plateDistanceFromBaseSurface])
        linear_extrude(height=height - plateDistanceFromBaseSurface + visualAid) square(plateSide);
  }
}

plate3d(plateSide);
// base(totalSide, plateSide, height);
