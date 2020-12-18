
// Брус ограды
module railBar(L) {
  color("LightYellow", 1.0) 
    translate([0, -barH/2, 0]) 
      cube([L, barH, barW], false);
}

// Брус перил
module handRailBar(L) {
  color("LightYellow", 1.0) 
    translate([0, -barH/2, 0]) 
      cube([L, barW, barW], false);
}

// Ограда этажа
module railingBars() {
    translate([0, -tRadius, 0]) 
      rotate([0, 0, 60]) 
      railBar(tSide);
    translate([0, -tRadius, 0]) 
      rotate([0, 0, 120]) 
      railBar(tSide);    
}

// Заднее ограждение 1-го этажа 
module back1RailingBars() {
     translate([tSide/2, tRadius*sin(30), pillarHeight+ barH + railingH]) 
      rotate([0, 0, 60]) 
      handRailBar(ladderW/cos(30)); 
      railDelta = (ladderW/cos(30))*sin(30);
      translate([tSide/2 - (platformL + railDelta)/2 - barW*2, tRadius*sin(30) + ladderW + barW, pillarHeight+ barH + railingH]) 
      rotate([0, 0, 0]) 
      handRailBar(platformL + railDelta + barW*2); 
      
}


// Заднее ограждение 2-го этажа 
module back2RailingBars() {
}
