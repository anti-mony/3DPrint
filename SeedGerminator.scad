module ring(height, radius, ringWidth) {
  difference() {
    color("purple") cylinder(h=height, r=radius, center=true);
    color("red") cylinder(h=height, r=radius - ringWidth, center=true);
  }
}

module triangle(base, height, thickness) {
  points = [
    [0, 0, 0], //0
    [base, 0, 0], //1
    [base, thickness, 0], //2
    [0, thickness, 0], //3
    [0, 0, 0], //4
    [base, 0, height], //5
    [base, thickness, height], //6
    [0, thickness, 0], // 7
  ];

  faces = [
    [0, 1, 2, 3], // bottom
    [4, 5, 1, 0], // front
    [7, 6, 5, 4], // top
    [5, 6, 2, 1], // right
    [6, 7, 3, 2], // back
    [7, 4, 0, 3], // left
  ];
  polyhedron(points=points, faces=faces);
}

module spoke(base, height, thickness, spokeThickness) {
  difference() {
    color("blue") triangle(base=base, height=height, thickness=thickness);
    color("pink") translate([spokeThickness, 0, 0]) triangle(base=base, height=height, thickness=thickness);
  }
  spokeHeightBegin = (height / base) * (base - spokeThickness);
  color("orange") translate([base, 0, spokeHeightBegin]) cube([15, thickness, height - spokeHeightBegin]);
}

radius = 20;
height = 4;
thickness = 5;

spokeBase = 30;
spokeHeight = 50;
spokeThickness = 5;

nSpokes = 4;
for (i=[0:nSpokes]) {
rotate([0, 0, i*(360/nSpokes)]) translate([radius - 2, -1 * (thickness / 2), -1 * height / 2]) cube(size=[5, 5, 4]);
rotate([0, 0, i*(360/nSpokes)]) translate([radius - 2, -1 * (thickness / 2), -1 * height / 2]) spoke(base=spokeBase, height=spokeHeight, thickness=thickness, spokeThickness=spokeThickness);  
}


// rotate([0, 0, 120]) translate([radius - 2, -1 * (thickness / 2), -1 * height / 2]) cube(size=[8, 5, 4]);
// rotate([0, 0, 120]) translate([radius - 2, -1 * (thickness / 2), -1 * height / 2]) spoke(base=spokeBase, height=spokeHeight, thickness=thickness, spokeThickness=spokeThickness);
// rotate([0, 0, 240]) translate([radius - 2, -1 * (thickness / 2), -1 * height / 2]) cube(size=[8, 5, 4]);
// rotate([0, 0, 240]) translate([radius - 2, -1 * (thickness / 2), -1 * height / 2]) spoke(base=spokeBase, height=spokeHeight, thickness=thickness, spokeThickness=spokeThickness);
ring(height, radius, 2);
