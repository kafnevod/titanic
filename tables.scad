// tSide = 460;
// tRadius = (tSide /2) / cos(30);

gapSize = 1;
tableH = 2;
// Секция стола
module tableSubSegment() {
  l = tSide / 8;
  polygon(points=[
    [0, 0],
    [0, l * cos(30)],
    [l * sin(30), l * cos(30)],
  ]);
}

module tableInvertSegment(folded) {
  color("White") 
     linear_extrude(tableH) 
      tableSubSegment();
   if (!folded) {   
     translate([ gapSize*sin(30), -gapSize*cos(30), 0]) color("White") linear_extrude(tableH) rotate([0, 180, -60]) tableSubSegment();
   }	
  color("White") 
     linear_extrude(tableH) 
      rotate([0, 180, 0]) 
      tableSubSegment();
   if (!folded) {   
      translate([-gapSize*sin(30), -gapSize*cos(30), 0])
       color("White") linear_extrude(tableH) rotate([0, 0, 60]) tableSubSegment();
   }
}


module tableSegment(folded) {
    l = tSide / 8;
    r = tRadius / 8; 
    if (folded) {
      translate([0, -r*sin(30) , 0]) 
        translate([0, 0, -l*cos(30)]) 
        rotate([90, 0, 0])  
        tableInvertSegment(folded);
    } else { 
      translate([0, -(r*sin(30)+l*cos(30)) , 0]) 
        tableInvertSegment(folded);
    }
}

// Стол
module table(folded) {
  tableSegment(folded);
  rotate([0, 0, 120])  
    tableSegment(folded);
  rotate([0, 0, 240])  
    tableSegment(folded);
}


tableW = 40;

module leftrightTable() {
    polygon(points=[
      [0, 0],
      [tableW * (cos(30) / sin(30)), tableW],
      [tSide/2 - tableW * cos(30) / sin(30), tableW],
      [tSide/2, 0]
    ]);
}

module rightTable(folded) {
  if (folded) {
    rotate([-90, 0, 60])
    color("White") linear_extrude(tableH)
    leftrightTable();      
  } else {
    rotate([0, 0, 60])
      color("White") linear_extrude(tableH)
      leftrightTable();
  }
}

module leftTable(folded) {
  if (folded) {
    rotate([-90, 0, 120])
    color("White") linear_extrude(tableH)
    leftrightTable();      
  } else {
    rotate([180, 0, 120])
    color("White") linear_extrude(tableH)
    leftrightTable();
  }
}
// tableSubSegment();
// tableInvertSegment();
//tableSegment();
//table();
// rightTable(true);
// leftTable(false);
