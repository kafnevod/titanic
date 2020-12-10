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
level1H = pillarHeight + barH;
ladderEntryW = 50; // Ширина площадки входа
// Опорные уголки

module ladder() {
//Дальный выносной поддерживающий уголок второго этажа
  translate([-tRadius*sin(30)*cos(30), -tRadius*sin(30)*sin(30), level2H])
    rotate([90, 0, 120])
    cornerBar(tSide/2 + ladderW/cos(30), 5);
  
//Левый уголок верхней площадки
  translate([-tSide/2, tRadius*sin(30)+barW/2, level2H])
    rotate([0, 0, 0])
    cornerBar(ladderEntryW, 5);
//Правый уголок верхней площадки
  translate([-(tSide/2+ladderW*sin(30)), tRadius*sin(30)+ladderW, level2H])
    rotate([90, 0, 0])
    cornerBar(ladderEntryW+ladderW*sin(30), 5);   
// Ближний выносной поддерживающий уголок второго этажа
  barLen = tSide*cos(30)*(ladderEntryW/(tSide/2))+ladderW;
  translate([-(tSide/2-ladderEntryW), 
            (tRadius*sin(30)+ladderW-(barLen)),
             level2H
            ])
    rotate([0, 0, 90])
    cornerBar(barLen, 5);  

  //Спуск со 2-го этажа
  platform1X = -(tSide/2-ladderEntryW-pillarHeight-barH);
  platform1Z = level1H-floorW-barH+5/2;
  translate([platform1X , tRadius*sin(30)+barW/2, platform1Z])
    rotate([-90, -135, 0])
    cornerBar((pillarHeight+floorW+barH)/sin(45), 5);   
  translate([platform1X , tRadius*sin(30)+ladderW, platform1Z])
    rotate([-180, -135, 0])
    cornerBar((pillarHeight+floorW+barH)/sin(45), 5); 
    
  //Левый уголок нижней площадки
  translate([platform1X, tRadius*sin(30)+barW/2+1, platform1Z])
    rotate([0, 0, 0])
    cornerBar(ladderEntryW, 5);   
    
  //Правый уголок нижней площадки
  translate([platform1X, tRadius*sin(30)+ladderW+1, platform1Z])
    rotate([90, 0, 0])
    cornerBar(ladderEntryW, 5);  

  //Спуск со 1-го этажа
  platform0X = platform1X+pillarHeight+ladderEntryW;
  translate([platform0X , tRadius*sin(30)+barW/2, 0])
    rotate([-90, -135, 0])
    cornerBar((pillarHeight)/sin(45), 5);   
  translate([platform0X , tRadius*sin(30)+ladderW, 0])
    rotate([-180, -135, 0])
    cornerBar((pillarHeight)/sin(45), 5); 
    
}

// ladder();
