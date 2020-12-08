
// Брус ограды
module railBar() {
  color("LightYellow", 1.0) 
    translate([0, -barH/2, 0]) 
      cube([tSide, barH, barW], false);
}


// Ограда этажа
module railingBars() {
    translate([0, -tRadius, 0]) 
      rotate([0, 0, 60]) 
      railBar();
    translate([0, -tRadius, 0]) 
      rotate([0, 0, 120]) 
      railBar();    
}
