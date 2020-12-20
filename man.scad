legH = 95;
bodyH = 65;
headD = 30;

module leg() {
  color("Red") 
  cylinder(legH, 8, 8);
}

module hand() {
  color("Red") 
  cylinder(70, 8, 5);
}

module body() {
  color("White") 
  cylinder(bodyH, 20, 15);
}

module head() {
  color("Gray") 
    sphere(d = headD , $fn=100);
}

module man() {
  translate([5,0,legH])
    rotate([0, 165, 0])
    leg();
  translate([-5,0,legH])
    rotate([0, -165, 0])
    leg(); 
  translate([0, 0, legH])
    body();
  translate([0, 0, legH + bodyH + headD/2])
    head(); 
  translate([15, 0, legH + bodyH])
    rotate([0, 60, 0])
   hand(); 
  translate([-15, 0, legH + bodyH])
    rotate([0, -60, 0])
   hand();       
}

module manN() {
  translate([5,0,legH])
    rotate([0, 178, 0])
    leg();
  translate([-5,0,legH])
    rotate([0, -178, 0])
    leg(); 
  translate([0, 0, legH])
    body();
  translate([0, 0, legH + bodyH + headD/2])
    head(); 
  translate([15, 0, legH + bodyH])
    rotate([0, 175, 0])
   hand(); 
  translate([-15, 0, legH + bodyH])
    rotate([0, -175, 0])
   hand();       
}

//leg();
// body();
//head();
//hand();
//manN();
