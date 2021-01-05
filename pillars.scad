// Стойка с площадкой
module pillar(PillarHeight) {
  color("Silver") 
    cylinder(r = pillarDiam/2 , h = PillarHeight, center = false);
  color("Silver") 
    translate([-10, -10, PillarHeight]) 
    square(footSize,false);
}

// задний опорный брус
module pillarBar(h) { 
  color("LightYellow", 1.0) 
    translate([0, -barW/2, 0]) 
      cube([barH, barW, h], false);    
}

// Опорные брусья 
module pillarBars1(time) {
  if ($t >= time+0/100) {    
    // Правая задняя первого этажа
    translate([tSide/2 - barH/2, tRadius*sin(30) - barH, pillarHeight+barH]) 
      rotate([0,0,60])
      pillarBar(pillarHeight);
  }
  if ($t >= time+1/100) {    
    // Левая задняя первого этажа
    translate([-tSide/2, tRadius/2, pillarHeight+barH]) 
      rotate([0,0,-60])  
      pillarBar(pillarHeight); 
  }
  if ($t >= time+2/100) {      
    // Правая средняя перил первого этажа
    translate([tSide/4 - barH/2, -(tRadius*sin(30)/2 + barH), (pillarHeight+barH)*1]) 
      rotate([0,0,60])
      pillarBar(railingH); 
  }      
  if ($t >= time+3/100) {    
    // Левая средняя перил первого этажа
    translate([-(tSide/4), -tRadius/4, (pillarHeight+barH)*1]) 
      rotate([0,0,-60])  
      pillarBar(railingH); 
  }
  if ($t >= time+4/100) {    
    // Задняя перил первого этажа
    RDx = (tSide/2) - platformL *2  - (pillarHeight + barH*2)  + 2*smallCornerW  ;    
    translate([RDx, (tRadius/2), (pillarHeight+barH)*1]) 
      rotate([0,0,0])  
      pillarBar(railingH);   
  }
  if ($t >= time+4/100) {    
    // Стойки платформ  
    // Правая конечная перил первого этажа
    translate([tSide/2 + (ladderW/cos(30))*sin(30) - barW/2, (tRadius*sin(30) + (ladderW) - barH), (pillarHeight+barH)*1]) 
      rotate([0,0,60])
      pillarBar(railingH); 
  } 
}

module pillarBars2(time) {     
//   if ($t >= time+0/100) {    
//     // Передняя второго этажа    
//     translate([-barH/2, -tRadius - 0, pillarHeight*2+barH*2]) 
//       rotate([0,0,90])
//       pillarBar(railingH);
//   }
  if ($t >= time+1/100) {    
    // Правая задняя второго этажа
    translate([tSide/2 - barH/2, tRadius*sin(30) - barH, (pillarHeight+barH)*2]) 
      rotate([0,0,60])
      pillarBar(railingH); 
  }    
  if ($t >= time+2/100) {          
    // Левая задняя второго этажа
    translate([-tSide/2, tRadius/2, (pillarHeight+barH)*2]) 
      rotate([0,0,-60])  
      pillarBar(railingH); 
  }
  if ($t >= time+3/100) {       
    // Правая средняя перил второго этажа
    translate([tSide/4 - barH/2, -(tRadius*sin(30)/2 + barH), (pillarHeight+barH)*2]) 
      rotate([0,0,60])
      pillarBar(railingH);  
  }
  if ($t >= time+4/100) {     // Левая средняя перил второго этажа
    translate([-(tSide/4), -tRadius/4, (pillarHeight+barH)*2]) 
      rotate([0,0,-60])  
      pillarBar(railingH); 
  }
  if ($t >= time+5/100) {     // Задняя перил второго этажа
    translate([-barH/2, (tRadius/2), (pillarHeight+barH)*2]) 
      rotate([0,0,0])  
      pillarBar(railingH); 
  }
  if ($t >= time+6/100) {       
    // Стойки платформ  
    // Левая конечная второго этажа
    translate([-tSide/2 - (ladderW/cos(30))*sin(30), tRadius/2 + (ladderW), (pillarHeight+barH)*2]) 
      rotate([0,0,-60])  
      pillarBar(railingH);     
  }
}

// Опорные стойки
module pillars1(time) {
  pRadius = tRadius - footSize;
  if ($t >= time+2/100) {
    translate([pRadius * cos(30), pRadius * sin(30), 0]) 
      pillar(pillarHeight);
  }
  if ($t >= time+4/100) {
    translate([pRadius * cos(150), pRadius * sin(150), 0])
      pillar(pillarHeight);
  }    
  if ($t >= time+6/100) {    
    translate([pRadius * cos(270), pRadius * sin(270), 0])
      pillar(pillarHeight);
  }  
}
      
 module pillars2(time) {
  pRadius = tRadius - footSize;
  // Передняя стойка второго этажа
  if ($t >= time) {
    translate([pRadius * cos(270), pRadius * sin(270), pillarHeight+barH])
      pillar(pillarHeight + railingH);
  }
}
