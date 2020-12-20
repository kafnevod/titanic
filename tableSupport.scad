// tSide = 460;
// tRadius = (tSide /2) / cos(30);
// hTable=70;
smallCornerW = 3;

include <cornerBar.scad>;
module upDowntableSupport() {
  // Нижный уголок    
  translate([-tSide/16, -tRadius/16 , 0])
    cornerBar(tSide/8, smallCornerW); 

  // Левый уголок    
  translate([-tSide/16, -tRadius/16 , 0])
    rotate([90, 0, 60])
    cornerBar(tSide/8, smallCornerW); 

  // Правый уголок    
  translate([tSide/16, -tRadius/16 , 0])
    rotate([0, 0, 120])
    cornerBar(tSide/8, smallCornerW); 
}


module tableSupport() {
  upDowntableSupport();

  translate([0, 0, hTable])
    rotate([0, 180, 0])
    upDowntableSupport();

  translate([-tSide/16, -tRadius/16 , 0])
    rotate([0, -90, -90])
    cornerBar(hTable, smallCornerW); 

  translate([tSide/16, -tRadius/16 , 0])
    rotate([0, -90, 0])
    cornerBar(hTable, smallCornerW);

  translate([0/16, tRadius/8 , 0])
    rotate([0, -90, 120])
    cornerBar(hTable, smallCornerW);
}
