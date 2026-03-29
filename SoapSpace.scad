baseLength = 72;
baseWidth = 72;

plateDelta = 6;
plateLength = baseLength - plateDelta;
plateWidth = baseWidth - plateDelta;

height = 12;

module plate3d(length, width) {
  marginOfError = 0.25;
  linear_extrude(height=2) plate(length - marginOfError, width - marginOfError);;
}

module plate(length, width) {
  plateBoundaryWidth = 8;
  difference() {
    square([length, width], center=true);
    square([length - plateBoundaryWidth, width - plateBoundaryWidth], center=true);
  }
  for (i = [-2:2]) {
    color("orange") translate(v=[i * 16, 0, 0]) square([2, width - 8], center=true);
  }
  for (i = [-1:1]) {
    color("white") translate(v=[0, i * 16, 0]) square([length - 8, 2], center=true);
  }
}

module base(baseLength, baseWidth, plateLength, plateWidth,  height) {
  baseSurfaceThickness = 2;
  visualAid = 1;
  plateDistanceFromBaseSurface = 8;
  difference() {
    color("orange") linear_extrude(height=height) square([baseLength, baseWidth]);
    color("pink") translate([plateDelta, plateDelta, baseSurfaceThickness])
        linear_extrude(height - baseSurfaceThickness + visualAid)
          square([plateLength - plateDelta, plateWidth - plateDelta]);
    color("purple") translate([plateDelta / 2, plateDelta / 2, plateDistanceFromBaseSurface])
        linear_extrude(height=height - plateDistanceFromBaseSurface + visualAid) square([plateLength, plateWidth]);
  }
}

plate3d(plateLength, plateWidth);
// base(baseLength, baseWidth, plateLength, plateWidth,  height);
