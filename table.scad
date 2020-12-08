//tSide = 460;
//tRadius = (tSide /2) / cos(30);

// Секция стола
gapSize = 0.2;

// Секция стола
module tableSubSegment() {
  l = tSide / 4;
  r = tRadius / 4;
  polygon(points=[
    [0, 0],
    [0, r * cos(30)],
    [r * sin(30), r * cos(30)],
  ]);
}

module tableInvertSegment() {
  color("White") linear_extrude(1) tableSubSegment();
  translate([gapSize*sin(30), -gapSize*cos(30), 0]) color("White") linear_extrude(1) rotate([0, 180, -60]) tableSubSegment();

  color("White") linear_extrude(1) rotate([0, 180, 0]) tableSubSegment();
  translate([-gapSize*sin(30), -gapSize*cos(30), 0])
      color("White") linear_extrude(1) rotate([0, 0, 60]) tableSubSegment();
}

module tableSegment() {
    translate([0,(tRadius / 4) * cos(30) , 0]) rotate([180, 0, 0]) tableInvertSegment();
}

// Стол
module table() {
    rotate([0, 0, 180])  
        translate([0, (tSide/16)*(sin(30)/cos(30)), hTable]) 
        tableSegment();
    rotate([0, 0, 60])  
        translate([0, (tSide/16)*(sin(30)/cos(30)), hTable]) 
        tableSegment();
    rotate([0, 0, -60])  
        translate([0, (tSide/16)*(sin(30)/cos(30)), hTable]) 
        tableSegment();
}
//table();
