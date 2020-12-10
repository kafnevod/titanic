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
ladderEntryW = 40; // Ширина площадки входа
// Опорные уголки

module ladder() {
//Дальный выносной поддерживающий уголок второго этажа
  translate([-tRadius*sin(30)*cos(30), -tRadius*sin(30)*sin(30), level2H])
    rotate([90, 0, 120])
    cornerBar(tSide/2 + ladderW/cos(30), 5);
  
//Левый уголок верхней площадки
  translate([-tSide/2, tRadius*sin(30)+barW, level2H])
    rotate([0, 0, 0])
    cornerBar(ladderEntryW, 5);
//Правый уголок верхней площадки
  translate([-(tSide/2+ladderW*sin(30)), tRadius*sin(30)+barW+ladderW, level2H])
    rotate([90, 0, 0])
    cornerBar(ladderEntryW+ladderW*sin(30), 5);   
// Ближний выносной поддерживающий уголок второго этажа
  translate([-(tSide/2-ladderEntryW), 
            (tRadius*sin(30)+ladderW-(tSide*cos(30)*(ladderEntryW/(tSide/2))+ladderW)),
             level2H
            ])
    rotate([0, 0, 90])
    cornerBar(tSide*cos(30)*(ladderEntryW/(tSide/2))+ladderW, 5);  
}

// ladder();
