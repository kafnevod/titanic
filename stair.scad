include <cornerBar.scad>;
ladderW = 80; // Ширина лестницы
smallCornerW = 3;
stairW = 22;

bigCornerW = 5;

module stair() {
  // Ближний нижний уголок  
  translate([0, 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW-bigCornerW, smallCornerW);
    
  // Дальний нижний уголок  
  translate([-(stairW-smallCornerW), 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW-bigCornerW, smallCornerW); 

  // Левый уголок    
  translate([-(stairW), bigCornerW, 1])
    rotate([0, 0, 0])
    cornerBar(stairW, smallCornerW); 

  // Правый уголок    
  translate([-(stairW), ladderW-bigCornerW-bigCornerW, 2])
    rotate([90, 0, 0])
    cornerBar(stairW, smallCornerW); 

  translate([-1, bigCornerW+smallCornerW, 1])
    rotate([0, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2-bigCornerW, smallCornerW);    

  translate([-stairW, bigCornerW+smallCornerW, 1])
    rotate([90, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2-bigCornerW, smallCornerW);     
    
}   

//  stair();
