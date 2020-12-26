// tSide = 460;
// tRadius = (tSide /2) / cos(30);
// 
// firHeight = 800;
// firDiam =  10;
// 
// pillarDiam = 10;
// pillarHeight = 200;
// footSize = 20;
// 
// barW = 5;
// barH = 20;  
// 
// floorW = 3;
// floorGap = 2;
// 
// hTable=70;
// 
// railingH = 100;
// include <bars.scad>;
// include <tables.scad>;
// include <floors.scad>;
// Уровень этажа

module level1(time) {
  translate([0, 0, pillarHeight]) 
    level(true, time);
  translate([0, 0, pillarHeight+barH+railingH])
      railingBars(time+20/100);
}

module level2(time) {
  pillars2(time);    
  translate([0, 0, 2*pillarHeight+barH]) level(false, time+1/100);
  translate([0, 0, 2*pillarHeight+2*barH+railingH])
    railingBars(time+21/100);
}

module level(folded, time) {
  if ($t >= time) {
    bars(1);
  }
  if ($t >= time+1/100) {  
    rotate([0, 0, 180]) bars(2);
  }
  if ($t >= time+2/100) { 
    bars(4);
  }
  if ($t >= time+3/100) {     
    rotate([0, 0, 180]) bars(8);
   }
  if ($t >= time+4/100) {    
    translate([tRadius*cos(30)/2, tRadius*sin(30)/2])
      rotate([0, 0, 180]) bars(4);
  }
  if ($t >= time+5/100) {       
    translate([-tRadius*cos(30)/2, tRadius*sin(30)/2])
      rotate([0, 0, 180]) bars(4);
  }
  if ($t >= time+6/100) {       
    translate([0, -tRadius/2])
      rotate([0, 0, 180]) bars(4);  
  }
  if ($t >= time+7/100) {       
    floorWithHole();
  }
  if ($t >= time+8/100) {     
    translate([0, -tRadius/2, 0]) 
      rotate([0, 0, 180]) floor();
  }
  if ($t >= time+9/100) {       
    translate([-tSide/4, tRadius/4, 0]) 
      rotate([0, 0, 60]) floor();
  }
  if ($t >= time+10/100) {       
    translate([tSide/4, tRadius/4, 0]) 
      rotate([0, 0, 300]) floor();
  }
  if ($t >= time+11/100) {       
    translate([0, 0, hTable])     
      table(folded);
  }
  if ($t >= time+12/100) {       
    translate([0, -tRadius, hTable])     
      rightTable(folded);
  }
  if ($t >= time+13/100) {       
    translate([0, -tRadius, hTable])     
      leftTable(folded);
      tableSupport();
  }
  if ($t >= time+14/100) {       
    translate([0, -tRadius, barH])
      rotate([0, 0, 60])
      crossElements(8);
  }
  if ($t >= time+15/100) {       
    translate([0, -tRadius, barH])
      rotate([0, 0, 120])
      crossElements(8);
  }
  if ($t >= time+16/100) {       
    translate([0, -tRadius, railingH + barW + barH])
      rotate([0, 0, 60])
      lampLine();
  }
  if ($t >= time+17/100) {       
    translate([0, -tRadius, railingH + barW + barH])
      rotate([0, 0, 120])
      lampLine(); 
  }
  if ($t >= time+18/100) {       
    translate([0, tRadius/2, railingH + barW + barH])
      lamp();   
  }    
}

