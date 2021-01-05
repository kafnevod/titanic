tSide = 460;
tRadius = (tSide /2) / cos(30);

firHeight = 900;
firDiam =  20;

pillarDiam = 10;
pillarHeight = 240;
footSize = 20;

barW = 5;
barH = 15;  

floorW = 3;
floorGap = 2;

hTable=70;

railingH = 100;

time = 0;

$t = 0.9;
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


// Ёлка
fir();
// Опорные стойки
pillars1(2/100);
// Первый уровень
level1(10/100);

support1(29/100);

// Заднее ограждение 1-го этажа     
back1RailingBars(30/100);   
// Задние опорные брусья первого уровня
pillarBars1(30/100);
platform1(35/100);
platform2(37/100);
//Лестница 1-го этажа
ladder(40/100);


// Второй уровень 
level2(50/100);
support2(69/100);
// Заднее ограждение 2-го этажа     
back2RailingBars(70/100); 
// Задние опорные брусья второго уровня
pillarBars2(72/100);
platform3(75/100);
//Лестница 2-го этажа
translate([0,0,pillarHeight+barH])
  ladder(80/100);

translate([0, -tRadius/1.6, (pillarHeight+barH) ])
  man(88/100);

translate([0, -tRadius/2, (pillarHeight+barH)*2 ])
  man(89/100);

stepX = (pillarHeight + barH) / 9;  
translate([tSide/2 - platformL - stepX, tRadius*sin(30) + ladderW/2,  stepX])
  rotate([0, 0, 90])
  manN(89/100);  

// Баня
sauna(99/100);
