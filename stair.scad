include <cornerBar.scad>;
ladderW = 80; // Ширина лестницы
smallCornerW = 3;
stairW = 24;
floorW = 3;
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

  points = [
      [-1, smallCornerW+2],
      [-1, ladderW-smallCornerW * 2 -5],    
      [(-stairW+1) ,ladderW-smallCornerW*2-5],
      [(-stairW+1),smallCornerW+2] 
    ];
echo (points);    
  translate([0, 0, 1])
  linear_extrude(floorW)
    color("LightYellow") polygon(points=points,
    paths = [[0,1,2,3]],
    convexity = 10
  );    
    
}   


//stair();

