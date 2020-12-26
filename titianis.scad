tSide = 460;
tRadius = (tSide /2) / cos(30);

firHeight = 800;
firDiam =  10;

pillarDiam = 10;
pillarHeight = 200;
footSize = 20;

barW = 5;
barH = 15;  

floorW = 3;
floorGap = 2;

hTable=70;

railingH = 100;

time = 0;

// $vpf = [0, 200, 300];
$vpr = [90 - $t * 80 , 0, $t * 1800];
$vpd = 600*$t + 1800 ;
include <sauna.scad>;
include <fir.scad>;
include <pillars.scad>;
include <bars.scad>;
include <tables.scad>;
include <floors.scad>;
include <railingBars.scad>;
include <level.scad>;
include <cornerBar.scad>;
include <ladder.scad>;
include <stair.scad>;
include <tableSupport.scad>;
include <crossBarsSupport.scad>;
include <lamp.scad>;
include <man.scad>;

// Баня
//sauna();
// Ёлка
fir();
// Опорные стойки
pillars1(2/100);
// Первый уровень
level1(10/100);
// Второй уровень 
level2(35/100);

if ($t >= 1) {


  // Заднее ограждение 1-го этажа     
  back1RailingBars();    

  // Заднее ограждение 2-го этажа     
  back2RailingBars(); 

  // Задние опорные брусья 
  pillarBars();
  //Лестница
  ladder();
  translate([0,0,pillarHeight+barH])
    ladder();
    
  platform1();
  platform2();
  platform3();

  support();

  translate([0, -tRadius/1.6, (pillarHeight+barH) ])
    man();

  translate([0, -tRadius/2, (pillarHeight+barH)*2 ])
    man();

  stepX = (pillarHeight + barH) / 9;  
  translate([tSide/2 - platformL - stepX, tRadius*sin(30) + ladderW/2,  stepX])
    rotate([0, 0, 90])
    manN();
}
