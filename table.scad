// tSide = 460;
// tRadius = (tSide /2) / cos(30);

// Секция стола
module tableSubSegment() {
  l = tSide / 8;
  polygon(points=[
    [0, 0],
    [0, l * cos(30)],
    [l * sin(30), l * cos(30)],
  ]);
}

module tableInvertSegment() {
  color("White") 
     linear_extrude(1) 
      tableSubSegment();
   translate([gapSize*sin(30), -gapSize*cos(30), 0]) color("White") linear_extrude(1) rotate([0, 180, -60]) tableSubSegment();

  color("White") 
     linear_extrude(1) 
      rotate([0, 180, 0]) 
      tableSubSegment();
   translate([-gapSize*sin(30), -gapSize*cos(30), 0])
       color("White") linear_extrude(1) rotate([0, 0, 60]) tableSubSegment();
}

module tableSegment(folded) {
    l = tSide / 8;
    r = tRadius / 8; 
    if (folded) {
    translate([0, -r*sin(30) , 0]) 
    translate([0, 0, -l*cos(30)]) 
      rotate([90, 0, 0])  
//          translate([0, -(r*sin(30)+l*cos(30)) , 0]) 
        tableInvertSegment();
    } else { 
      translate([0, -(r*sin(30)+l*cos(30)) , 0]) 
        tableInvertSegment();
    }
}

// Стол
module table(folded) {
  translate([0, 0, hTable])     
    tableSegment(folded);
  rotate([0, 0, 120])  
    translate([0, 0, hTable]) 
    tableSegment(folded);
  rotate([0, 0, 240])  
    translate([0, 0, hTable]) 
    tableSegment(folded);
}
//tableSubSegment();
// tableInvertSegment();
//tableSegment();
//table();
