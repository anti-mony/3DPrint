length=200;
width=5;
widthFactor=1.5;
height=50;
angle=25;
boxwidth=50;
cut_width=15;

module longside(y){
    difference(){
        color("purple") translate([0, max(0,y-width),0]) cube([length,width,height]);
        color("cyan"){
            for(i=[0:9]){
                translate([i*19+7, max(0,y-width), 0]) cube([cut_width, width, height-5]);                
            }
        }
    }
}

module shortside(x){
    holesize = 2/3*width*widthFactor;
    cubesizefactor=1.25;
    difference(){
        translate([x,0,0]) cube([widthFactor*width,boxwidth,height]);
        color("purple") translate([x+holesize/4, width*1/3, 0]) cube(size=[holesize, holesize/widthFactor, height], center=false);
        color("purple") translate([x+holesize/4, boxwidth-width, 0]) cube(size=[holesize, holesize/widthFactor, height], center=false);
        color("red") translate([x, 0, height-width]) cube(size=[width*widthFactor, width, width], center=false);
        color("red") translate([x, boxwidth-width, height-width]) cube(size=[width*widthFactor, width, width], center=false);
        // color("cyan"){
        //     for(i=[0:1]){
        //         translate([x, i*19+8.5, 5]) rotate([0,0,0]) cube([width, cut_width, cut_height]);                
        //     }
        // }
    }
}

module base(){
    baseHeight = 5;
    translate([width*widthFactor,0,0]) difference() {
        cube([length - 2*(width*widthFactor), boxwidth, baseHeight]);
        color("red"){
            translate([17, 10, 3])
            linear_extrude(baseHeight-3)
            text("SPOONS",size=28,font = "Atkinson Hyperligible Mono:style=Italic");
        }
    }
}

module basePiece(){
color("lightgreen") base();
shortside(0);
shortside(length-(width*widthFactor));    
}

module longsidecut(y){
    difference(){
        longside(y);
        basePiece();
    }
}

basePiece();
// longsidecut(0);
// longsidecut(boxwidth);
