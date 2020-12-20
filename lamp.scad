// tSide = 460;

dLamp = 15;
hLampBase = 3;
dLampBase = 10;

module lamp() {
  deltaZ = hLampBase + sqrt(dLamp*dLamp - dLampBase*dLampBase)/2;
  translate([0, 0, deltaZ])  
  color("White")
  sphere(d = dLamp, , $fn=100);
    
  color("Black")  
    cylinder(hLampBase, dLampBase/2, dLampBase/2);
}

module lampLine() {
  for (i = [1:3]) {
    translate([tSide/4 * i, 0, 0])
      lamp();
  }
}

// lamp();
//lampLine();
