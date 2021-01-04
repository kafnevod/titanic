
// Пол-треугольник вокруг Ёлки 
module floorWithHole() {
  tradius =  tRadius - floorGap; 
  translate([0, 0, barH])
    linear_extrude(floorW)
    color("LightYellow") polygon(points=[
      [0, tradius/2],
      [-tSide/4 , -tradius/4],    
      [ tSide/4, -tradius/4],
      [0, tRadius/8],
      [-tSide/16, -tRadius/16],    
      [ tSide/16, -tRadius/16],
    ],
    paths = [[0,1,2], [3,4,5]],
    convexity = 10
  );
}

// Пол-треугольник
module floor() {
  tradius =  tRadius - 10; 
  translate([0, 0, barH])
  linear_extrude(floorW)
    color("BurlyWood") polygon(points=[
      [0, tradius/2],
      [-tSide/4, -tradius/4],    
      [ tSide/4, -tradius/4]
    ],
    paths = [[0,1,2]],
    convexity = 10
  );
}
