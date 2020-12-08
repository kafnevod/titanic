tSide = 460;
tRadius = (tSide /2) / cos(30);

firHeight = 800;
firDiam =  10;

pillarDiam = 10;
pillarHeight = 200;
footSize = 20;

barW = 5;
barH = 20;  

floorW = 3;
floorGap = 2;

hTable=70;

railingH = 100;

include <sauna.scad>;
include <fir.scad>;
include <pillars.scad>;
include <bars.scad>;
include <table.scad>;
include <floors.scad>;
include <railingBars.scad>;
include <level.scad>;
// Баня
sauna();
// Ёлка
fir();
// Опорные стойки
pillars();
// Первый уровень
translate([0, 0, pillarHeight]) level();
translate([0, 0, pillarHeight+barH+railingH])
    railingBars();
// Второй уровень    
translate([0, 0, 2*pillarHeight+barH]) level();
translate([0, 0, 2*pillarHeight+2*barH+railingH])
    railingBars();
// Задние опорные брусья 
pillarBars();





