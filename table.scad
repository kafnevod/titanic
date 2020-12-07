// Секция стола
module tableSegment() {
  l = tSide / 16;
    color([1,1,1]) polygon(points=[
      [l, 0],
      [l*(1+sin(30)), l+cos(30)],
      [0, l*cos(30)/sin(30)],
      [-l*(1+sin(30)), l+cos(30)],
      [-l, 0]
    ]);
}

// Стол
module table() {
    rotate(180, 0, 0)  translate([0, (tSide/16)*(sin(30)/cos(30)), hTable]) tableSegment();
    rotate(60, 0, 0)  translate([0, (tSide/16)*(sin(30)/cos(30)), hTable]) tableSegment();
    rotate(-60, 0, 0)  translate([0, (tSide/16)*(sin(30)/cos(30)), hTable]) tableSegment();
}
