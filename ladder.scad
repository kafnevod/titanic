// tSide = 460;
// tRadius = (tSide /2) / cos(30);
// pillarHeight = 200;
// barW = 5;
// barH = 15;  
// floorW = 3;
// floorGap = 2;
// 
// include <cornerBar.scad>;

ladderW = 50; // Ширина лестницы
level2H = pillarHeight*2 + barH;
// Опорные уголки

module ladder() {
  angle = atan((pillarHeight*2 + barH)/tSide);
  echo ("angle=", angle);
//Дальный выносной поддерживающий уголок второго этажа
  translate([-tRadius*sin(30)*cos(30), -tRadius*sin(30)*sin(30), level2H])
    rotate([90, 0, 120])
    cornerBar(tSide/2 + ladderW/cos(30), 5);
  
//Правый уголок верхней площадки
  translate([-(tSide/2+ladderW*sin(30)), tRadius*sin(30)+ladderW, level2H])
    rotate([90, 0, 0])
    cornerBar(ladderW*sin(30), 5);   
    
// Ближний выносной поддерживающий уголок второго этажа
  barLen = ladderW;
  translate([-(tSide/2), 
            (tRadius*sin(30)+ladderW-(barLen)),
             level2H
            ])
    rotate([0, 0, 90])
    cornerBar(barLen, 5);  

  //Спуск со 2-го этажа
  // Левый  
  translate([(tSide/2) , tRadius*sin(30)+barW/2, 0])
    rotate([-90, -(180-angle), 0])
    cornerBar((pillarHeight*2+barH)/sin(angle), 5);  
  // Правый   
  deltaHyp = (pillarHeight*2+barH)/sin(angle) + (ladderW*sin(30))/(cos(30)*cos(angle));
  translate([(tSide/2) , tRadius*sin(30)++ladderW+barW/2, 0])
    rotate([-90, -(180-angle), 0])
    cornerBar(deltaHyp, 5);  
  deltaH =  deltaHyp * sin(angle);   
    
//   translate([platform1X , tRadius*sin(30)+ladderW, platform1Z])
//     rotate([-180, -135, 0])
//     cornerBar((pillarHeight+floorW+barH)/sin(45), 5); 
    
//   //Левый уголок нижней площадки
//   translate([platform1X, tRadius*sin(30)+barW/2+1, platform1Z])
//     rotate([0, 0, 0])
//     cornerBar(ladderEntryW, 5);   
//     
//   //Правый уголок нижней площадки
//   translate([platform1X, tRadius*sin(30)+ladderW+1, platform1Z])
//     rotate([90, 0, 0])
//     cornerBar(ladderEntryW, 5);  
// 
//   //Спуск со 1-го этажа
//   platform0X = platform1X+pillarHeight+ladderEntryW;
//   translate([platform0X , tRadius*sin(30)+barW/2, 0])
//     rotate([-90, -135, 0])
//     cornerBar((pillarHeight)/sin(45), 5);   
//   translate([platform0X , tRadius*sin(30)+ladderW, 0])
//     rotate([-180, -135, 0])
//     cornerBar((pillarHeight)/sin(45), 5); 
    
}

// ladder();
