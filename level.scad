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
module level(folded) {
    bars(1);
    rotate([0, 0, 180]) bars(2);
    bars(4);
    rotate([0, 0, 180]) bars(8); 
    translate([tRadius*cos(30)/2, tRadius*sin(30)/2])
      rotate([0, 0, 180]) bars(4);
    translate([-tRadius*cos(30)/2, tRadius*sin(30)/2])
      rotate([0, 0, 180]) bars(4);
    translate([0, -tRadius/2])
      rotate([0, 0, 180]) bars(4);      
    floorWithHole();
    translate([0, -tRadius/2, 0]) 
      rotate([0, 0, 180]) floor();
    translate([-tSide/4, tRadius/4, 0]) 
      rotate([0, 0, 60]) floor();    
    translate([tSide/4, tRadius/4, 0]) 
      rotate([0, 0, 300]) floor();
    translate([0, 0, hTable])     
      table(folded);
    translate([0, -tRadius, hTable])     
      rightTable(folded);
    translate([0, -tRadius, hTable])     
      leftTable(folded);
      tableSupport();
}

// level(false);
