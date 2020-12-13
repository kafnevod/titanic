// tSide = 460;
// tRadius = (tSide /2) / cos(30);
// pillarHeight = 200;
// barW = 5;
// barH = 15;  
// floorW = 3;
// floorGap = 2;
// 
// include <cornerBar.scad>;
// include <stair.scad>;
// 

ladderW = 80; // Ширина лестницы
bigCornerW = 5;
platformL = 50;

level2H = (pillarHeight + barH) * 2;
level1H = pillarHeight + barH;
// Опорные уголки


module platform1() {
  // Выносной поддерживающий уголок первого этажа
  translate([tRadius*sin(30)*cos(30) + barW*cos(30)+2, -tRadius*sin(30)*sin(30)+1 + barW*sin(30), level1H])
    rotate([180, 0, 60])
    cornerBar(tSide/2 + ladderW/cos(30), bigCornerW);
}

module platform2() {
  // Ближний нижний уголок  
  translate([0, 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW-bigCornerW, smallCornerW);
  // Левый уголок    
  translate([-(platformL), 0, 1])
    rotate([0, 0, 0])
    cornerBar(platformL, smallCornerW); 

  // Правый уголок    
  translate([-(platformL), ladderW-bigCornerW-bigCornerW+bigCornerW, 2])
    rotate([90, 0, 0])
    cornerBar(platformL, smallCornerW); 

  translate([-1, bigCornerW+smallCornerW, 1])
    rotate([0, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2-bigCornerW+barW, smallCornerW);    

  translate([-platformL, 0, 1])
    rotate([90, 0, 90])
    cornerBar(ladderW-(bigCornerW)-bigCornerW+barW, smallCornerW);   
}

module platform3() {
//Дальный выносной поддерживающий уголок второго этажа
/*  translate([-(tRadius)*sin(30)*cos(30)+ barW*cos(30)+1, -tRadius*sin(30)*sin(30)+1, level2H]) */
  translate([-tRadius*sin(30)*cos(30) - barW*cos(30) - 1, -tRadius*sin(30)*sin(30)+1 + barW*sin(30), level2H])
    rotate([-90, 0, 120])
    cornerBar(tSide/2 + ladderW/cos(30), 5); 
}


module ladder() {
//   angle = atan((pillarHeight*2 + barH)/tSide);
  angle = 45;
//   echo ("angle=", angle);
  //Спуск с этажа
  // Левый  
  translate([(tSide/2)-platformL-barH , tRadius*sin(30)+barW/2, -barH])
    rotate([0, -(180-angle), 0])
    cornerBar((pillarHeight+barH*2)/sin(angle), bigCornerW); 
    
  // Ступеньки
  H = pillarHeight + barH;
  W = H;
  nStairs = 9;
  for (n = [1:nStairs-1]) {
    x = (tSide/2) - platformL - (W/nStairs) * n - stairW - smallCornerW;
    y = tRadius * sin(30) + bigCornerW/2;
    z = (H/nStairs) * n -1;
    translate([x, y , z])
      stair();
  }    
    
  // Правый   
//   rightRailingsLen = (pillarHeight*2+barH)/sin(angle) + (ladderW*sin(30))/(cos(30)*cos(angle));
  translate([(tSide/2)-platformL-barH , tRadius*sin(30)+ladderW-barW/2, -barH])
    rotate([90, -(180-angle), 0])
    cornerBar((pillarHeight+barH*2)/sin(angle), bigCornerW); 
      
    
    
//   // Правые перила   
//   translate([(tSide/2) , tRadius*sin(30)+ladderW-barW/2, railingH])
//     rotate([180, -(180-angle), 0])
//     cornerBar(rightRailingsLen, bigCornerW); 
   
}


//platform2();
// ladder();
