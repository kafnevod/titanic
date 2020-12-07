
// Уровень этажа
module level() {
    bars(1);
    rotate([0, 0, 180]) bars(2);
    bars(4);
    rotate([0, 0, 180]) bars(8); 
    floorWithHole();
    translate([0, -tRadius/2, 0]) 
      rotate(180, 0, 0) floor();
    translate([-tSide/4, tRadius/4, 0]) 
      rotate(60, 0, 0) floor();    
    translate([tSide/4, tRadius/4, 0]) 
      rotate(300, 0, 0) floor();
    table();
}
