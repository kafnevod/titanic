
// Брус треугольника
module bar(scale) {
  color("LightYellow", 1.0) 
    translate([0, -barW/2, 0]) 
      cube([tSide / scale, barW, barH], false);
}

// Треугольник из брусьев
module bars(scale) {
  translate([0, -tRadius/scale, 0]) 
    rotate([0, 0, 60]) 
    bar(scale);
  translate([0, -tRadius/scale, 0]) 
    rotate([0, 0, 120]) 
    bar(scale);
  translate([-tSide/(2*scale), tRadius/(2*scale), 0]) rotate([0, 0, 0]) 
    bar(scale);
}
