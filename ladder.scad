// tSide = 460;
// tRadius = (tSide /2) / cos(30);
// pillarHeight = 200;
// barW = 5;
// barH = 15;  
// floorW = 3;
// floorGap = 2;
// 
// include <cornerBar.scad>;

ladderW = 80; // Ширина лестницы
bigCornerW = 5;

level2H = pillarHeight*2 + barH;
level1H = pillarHeight + barH;
// Опорные уголки

module ladder() {
  angle = atan((pillarHeight*2 + barH)/tSide);
  echo ("angle=", angle);
//Дальный выносной поддерживающий уголок второго этажа
  translate([-tRadius*sin(30)*cos(30), -tRadius*sin(30)*sin(30), level2H])
    rotate([90, 0, 120])
    cornerBar(tSide/2 + ladderW/cos(30), bigCornerW);
  
//Правый уголок верхней площадки
  translate([-(tSide/2+ladderW*sin(30)), tRadius*sin(30)+ladderW, level2H])
    rotate([90, 0, 0])
    cornerBar(ladderW*sin(30), bigCornerW);   
    
// Ближний выносной поддерживающий уголок второго этажа
  barLen = ladderW;
  translate([-(tSide/2), 
            (tRadius*sin(30)+ladderW-(barLen)),
             level2H
            ])
    rotate([0, 0, 90])
    cornerBar(barLen, bigCornerW);  

 // Выносной поддерживающий уголок первого этажа
   translate([bigCornerW/2, tRadius/8-barW/2, pillarHeight])
     rotate([180, 0, 90])
    cornerBar((tSide/4)*cos(30)  + ladderW, bigCornerW);    
    
  //Спуск со 2-го этажа
  // Левый  
  translate([(tSide/2) , tRadius*sin(30)+barW/2, 0])
    rotate([-90, -(180-angle), 0])
    cornerBar((pillarHeight*2+barH)/sin(angle), bigCornerW);  
  // Правый   
  rightRailingsLen = (pillarHeight*2+barH)/sin(angle) + (ladderW*sin(30))/(cos(30)*cos(angle));
  translate([(tSide/2) , tRadius*sin(30)++ladderW-barW/2, 0])
    rotate([180, -(180-angle), 0])
    cornerBar(rightRailingsLen, bigCornerW);  
  // Правые перила   
  translate([(tSide/2) , tRadius*sin(30)+ladderW-barW/2, railingH])
    rotate([180, -(180-angle), 0])
    cornerBar(rightRailingsLen, bigCornerW); 

    
  // Подпорки правых перил
  // Нижняя  
  translate([(tSide/2) , tRadius*sin(30)+ladderW-barW/2, 0])
    rotate([180, -90, 0])
    cornerBar(railingH, bigCornerW); 
  // Средняя      
  translate([0 , tRadius*sin(30)+ladderW-barW/2, pillarHeight+barW/2+bigCornerW/2])
    rotate([180, -90, 0])
    cornerBar(railingH, bigCornerW);
  // Верхняя
  translate([tSide/2 - rightRailingsLen*cos(angle) , tRadius*sin(30)+ladderW-barW/2, rightRailingsLen*sin(angle)])
    rotate([180, -90, 0])
    cornerBar(railingH, bigCornerW);
    
  // Ступеньки
  H = pillarHeight*2 + barH;
  W = tSide;
  nStairs = 18;
  for (n = [1:nStairs]) {
    echo ("n=", n);
    x = tSide/2 - (W/nStairs) * n + bigCornerW;
    y = tRadius * sin(30) + bigCornerW/2;
    z = (H/nStairs) * n + bigCornerW;
    echo ("x=",x, " y=",y, " z=", z);
    translate([x, y , z])
      stair();
  }
    
}

// ladder();
