
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
module railingBars(time) {
    if ($t >= time) { 
    translate([0, -tRadius, 0]) 
      rotate([0, 0, 60]) 
      railBar(tSide);
   } 
  if ($t >= time+1/100) {   
    translate([0, -tRadius, 0]) 
      rotate([0, 0, 120]) 
      railBar(tSide);
   }   
}

// Заднее ограждение 1-го этажа 
module back1RailingBars(time) {
  if ($t >= time+0/100) {  
    // Ограждение правой площадки
    translate([tSide/2, tRadius*sin(30), pillarHeight+ barH + railingH]) 
      rotate([0, 0, 60]) 
      handRailBar(ladderW/cos(30)); 
    
    railDelta = (ladderW/cos(30))*sin(30);
    translate([tSide/2 - (platformL + railDelta)/2 - barW*2, tRadius*sin(30) + ladderW + barW, pillarHeight+ barH + railingH]) 
      rotate([0, 0, 0]) 
      handRailBar(platformL + railDelta + barW*2); 

    // центральные перила
    translate([tSide/2 - platformL - (pillarHeight + barH), tRadius*sin(30) + barW - 1, pillarHeight+ barH + railingH]) 
      rotate([0, 0, 0]) 
      handRailBar(pillarHeight + barH); 
      
    // левое ограждение
    backLeftL = tSide - (platformL * 2 + pillarHeight + barH - barW) + 1;  
    translate([-tSide/2, tRadius*sin(30) + barW - 1, pillarHeight+ barH + railingH]) 
      rotate([0, 0, 0]) 
      handRailBar(backLeftL);  
      
    // ограждение 2-й площадки
    translate([-tSide/2+backLeftL - barW - barW/2, tRadius*sin(30) + barW - smallCornerW- 1, pillarHeight+ barH + railingH]) 
      rotate([0, 0, 90]) 
      handRailBar(ladderW - smallCornerW);  
      
    translate([-tSide/2+backLeftL - barW/2, tRadius*sin(30) + barW*2 + ladderW - smallCornerW- 1, pillarHeight+ barH + railingH]) 
      rotate([0, 0, 0]) 
      handRailBar(platformL);     
  }  
}


// Заднее ограждение 2-го этажа 
module back2RailingBars(time) {
  if ($t >= time+0/100) {  
  // Заднее ограждение 2-го этажа 
    rail3Len = platformL + pillarHeight + barH;  
    translate([tSide/2 - rail3Len, tRadius*sin(30), (pillarHeight+ barH)*2 + railingH]) 
      rotate([0, 0, 0]) 
      railBar(rail3Len);     
    
    translate([-tSide/2 - (ladderW/cos(30))*sin(30), tRadius*sin(30) + ladderW - barH/2, (pillarHeight+ barH)*2 + railingH]) 
      rotate([0, 0, 0]) 
      railBar(tSide - rail3Len + (ladderW/cos(30))*sin(30));   

    translate([-tSide/2 + barW, tRadius*sin(30) - barH/2, (pillarHeight+ barH)*2 + railingH]) 
      rotate([0, 0, 120]) 
      railBar(ladderW/cos(30));
  }
}
