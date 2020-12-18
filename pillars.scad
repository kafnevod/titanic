// Стойка с площадкой
module pillar() {
  color("Silver") 
    cylinder(r = pillarDiam/2 , h = pillarHeight, center = false);
  color("Silver") 
    translate([-10, -10, pillarHeight]) 
    square(footSize,false);
}

// задний опорный брус
module pillarBar(h) { 
  color("LightYellow", 1.0) 
    translate([0, -barW/2, 0]) 
      cube([barH, barW, h], false);    
}

// Опорные брусья 
module pillarBars() {
  // Правая задняя первого этажа
  translate([tSide/2 - barH/2, tRadius*sin(30) - barH, pillarHeight+barH]) 
    rotate([0,0,60])
    pillarBar(pillarHeight);
  // Левая задняя первого этажа
  translate([-tSide/2, tRadius/2, pillarHeight+barH]) 
    rotate([0,0,-60])  
    pillarBar(pillarHeight);  
  // Правая средняя перил первого этажа
  translate([tSide/4 - barH/2, -(tRadius*sin(30)/2 + barH), (pillarHeight+barH)*1]) 
    rotate([0,0,60])
    pillarBar(railingH);  
  // Левая средняя перил первого этажа
  translate([-(tSide/4), -tRadius/4, (pillarHeight+barH)*1]) 
    rotate([0,0,-60])  
    pillarBar(railingH); 
  // Задняя перил первого этажа
  RDx = (tSide/2) - platformL *2  - (pillarHeight + barH*2)  + 2*smallCornerW  ;    
  translate([RDx, (tRadius/2), (pillarHeight+barH)*1]) 
    rotate([0,0,0])  
    pillarBar(railingH);     
    
  // Передняя второго этажа    
  translate([-barH/2, -tRadius - 0, pillarHeight*2+barH*2]) 
    rotate([0,0,90])
    pillarBar(railingH); 
  // Правая задняя второго этажа
  translate([tSide/2 - barH/2, tRadius*sin(30) - barH, (pillarHeight+barH)*2]) 
    rotate([0,0,60])
    pillarBar(railingH); 
    
  // Левая задняя второго этажа
  translate([-tSide/2, tRadius/2, (pillarHeight+barH)*2]) 
    rotate([0,0,-60])  
    pillarBar(railingH); 
    
  // Правая средняя перил второго этажа
  translate([tSide/4 - barH/2, -(tRadius*sin(30)/2 + barH), (pillarHeight+barH)*2]) 
    rotate([0,0,60])
    pillarBar(railingH);  
  // Левая средняя перил второго этажа
  translate([-(tSide/4), -tRadius/4, (pillarHeight+barH)*2]) 
    rotate([0,0,-60])  
    pillarBar(railingH); 
  // Задняя перил второго этажа
  translate([-barH/2, (tRadius/2), (pillarHeight+barH)*2]) 
    rotate([0,0,0])  
    pillarBar(railingH); 
    
  // Стойки платформ  
   // Правая конечная перил первого этажа
  translate([tSide/2 + (ladderW/cos(30))*sin(30) - barW/2, (tRadius*sin(30) + (ladderW) - barH), (pillarHeight+barH)*1]) 
    rotate([0,0,60])
    pillarBar(railingH); 

  // Левая конечная второго этажа
  translate([-tSide/2 - (ladderW/cos(30))*sin(30), tRadius/2 + (ladderW), (pillarHeight+barH)*2]) 
    rotate([0,0,-60])  
    pillarBar(railingH);     
    
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
