railingH = 100;

crossBarH = 4;
crossBarW = 3;
crossStep = (railingH/cos(30))*sin(30);


// Брус перекрестия
module crossBar(L) {
  color("White", 1.0) 
    translate([0, -crossBarW/2, 0]) 
      rotate([0, -90, 0])
      cube([L, crossBarW, crossBarH], false);
}

module cross() {
  crossBar(railingH);
  rotate([0, 30, 0])
    crossBar(railingH/cos(30));
  translate([crossStep, 0, 2])  
    rotate([0, -30, 0])
    crossBar(railingH/cos(30));    
}

module crossElements(n) {
  for (i = [1:n]) {    
    translate([crossStep * (i-1), 0, 0])
      cross();
  }    
}

//crossElements(5);
