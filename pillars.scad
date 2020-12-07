// Стойка с площадкой
module pillar() {
  color("Silver") cylinder(r = pillarDiam/2 , h = pillarHeight, center = false);
  color("Silver") translate([-10, -10, pillarHeight]) square(footSize,1,false);
}

// задний опорный брус
module pillarBar(h) { 
  color("LightYellow", 1.0) 
    translate([0, -barW/2, 0]) 
      cube([barH, barW, h], false);    
}

// Задние опорные брусья 
module pillarBars() {
  translate([tSide/2 - barH, tRadius/2, pillarHeight+barH]) 
    pillarBar(pillarHeight);
  translate([-tSide/2, tRadius/2, pillarHeight+barH]) 
    pillarBar(pillarHeight);    
}

// Опорные стойки
module pillars() {
    pRadius = tRadius - footSize;
    translate([pRadius * cos(30), pRadius * sin(30), 0]) 
      pillar();
    translate([pRadius * cos(150), pRadius * sin(150), 0])
      pillar();
    translate([pRadius * cos(270), pRadius * sin(270), 0])
      pillar();
    // Передняя стойка второго этажа
    translate([pRadius * cos(270), pRadius * sin(270), pillarHeight+barH])
      pillar();
}
