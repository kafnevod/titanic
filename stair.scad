include <cornerBar.scad>;
ladderW = 80; // Ширина лестницы
smallCornerW = 3;
stairW = 22;

bigCornerW = 5;

module stair() {
  translate([0, 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW, smallCornerW);
    
  translate([-(stairW-smallCornerW), 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW, smallCornerW); 
    
  translate([-(stairW), bigCornerW, 1])
    rotate([0, 0, 0])
    cornerBar(stairW, smallCornerW); 

  translate([-(stairW), ladderW-bigCornerW, 2])
    rotate([90, 0, 0])
    cornerBar(stairW, smallCornerW); 

  translate([-1, bigCornerW+smallCornerW, 1])
    rotate([0, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2, smallCornerW);    

  translate([-stairW, bigCornerW+smallCornerW, 1])
    rotate([90, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2, smallCornerW);     
    
}   

stair();
