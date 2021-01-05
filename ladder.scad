// tSide = 460;
// tRadius = (tSide /2) / cos(30);
// pillarHeight = 200;
// barW = 5;
// barH = 15;  
// floorW = 3;
// floorGap = 2;
// 
// include <cornerBar.scad>;
// include <stair.scad>;
// 

ladderW = 80; // Ширина лестницы
bigCornerW = 5;
platformL = 60;

level2H = (pillarHeight + barH) * 2;
level1H = pillarHeight + barH;

delta3Ladder = (ladderW/cos(30))*sin(30);

// Опорные уголки

module platform1(time) {
  if ($t >= time+0/100) {       
    translate([
        (tSide/2),
        tRadius * sin(30) + bigCornerW/2,
        pillarHeight + barH - 1
        ]
      )  
    _platform1();
  }  
  if ($t >= time+1/100) {         
    //Floor 
    RDx = tSide/2 + barW + bigCornerW;
    RDy = tRadius * sin(30) + bigCornerW/2;
    points = [
      [RDx, RDy],
      [RDx + (ladderW/cos(30))*sin(30), RDy + ladderW - bigCornerW],
      [RDx - (platformL+ barW + bigCornerW), RDy + ladderW - bigCornerW],
      [RDx - (platformL+ barW + bigCornerW), RDy]
    ];
  //   echo ("POINTS=", points);    
    translate([0, 0, pillarHeight + barH +1])
    linear_extrude(floorW)
      color("LightYellow") 
      polygon(points=points,
      paths = [[0,1,2,3]],
      convexity = 10
    );
  }
}

module _platform1() {
  // Дальний нижний уголок  
  translate([-platformL + bigCornerW, 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW-bigCornerW, smallCornerW);
  // Левый уголок    
  translate([-(platformL), 0, 1])
    rotate([0, 0, 0])
    cornerBar(platformL+barW+bigCornerW, smallCornerW); 

  // Правый уголок    
  translate([-(platformL), ladderW-bigCornerW-bigCornerW+bigCornerW, 2])
    rotate([90, 0, 0])
    cornerBar(platformL+barW+delta3Ladder, smallCornerW);    

  translate([-platformL, 0, 1])
    rotate([90, 0, 90])
    cornerBar(ladderW-(bigCornerW)-bigCornerW+barW, smallCornerW);   
}

module platform2(time) {
  if ($t >= time+0/100) {       
    translate([
        (tSide/2) - platformL - (pillarHeight + barH)  + 2*smallCornerW ,
        tRadius * sin(30) + bigCornerW/2,
        pillarHeight + barH - 1
        ]
      )  
    _platform2();
  }
  if ($t >= time+1/100) {       
    //Floor 
    RDx = (tSide/2) - platformL - (pillarHeight + barH)  + 2*smallCornerW  - 1;
    RDy = tRadius * sin(30) + bigCornerW/2 +1;
    points = [
      [RDx, RDy],
      [RDx, RDy + ladderW - bigCornerW -2],
      [RDx - (platformL-2), RDy + ladderW - bigCornerW -2],
      [RDx - (platformL-2), RDy]
    ];
  //   echo ("POINTS=", points);    
    translate([0, 0, pillarHeight + barH +1])
    linear_extrude(floorW)
      color("LightYellow") 
      polygon(points=points,
      paths = [[0,1,2,3]],
      convexity = 10
    );   
  }
}

module _platform2() {
  
  // Ближний нижний уголок  
  translate([0, 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW-bigCornerW, smallCornerW);
    
  // Левый уголок    
  translate([-(platformL), 0, 1])
    rotate([0, 0, 0])
    cornerBar(platformL, smallCornerW); 

  // Правый уголок    
  translate([-(platformL), ladderW-bigCornerW-bigCornerW+bigCornerW, 2])
    rotate([90, 0, 0])
    cornerBar(platformL, smallCornerW); 

  translate([-1, bigCornerW+smallCornerW, 1])
    rotate([0, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2-bigCornerW+barW, smallCornerW);    

  translate([-platformL, 0, 1])
    rotate([90, 0, 90])
    cornerBar(ladderW-(bigCornerW)-bigCornerW+barW, smallCornerW);   
}


ladder3X = (platformL + pillarHeight + barH) - tSide/2;
ladder3L = tSide/2 -ladder3X + barH;

module platform3(time) {
  if ($t >= time+0/100) {       
    translate([
        (tSide/2) - platformL - (pillarHeight + barH) + 2*smallCornerW,
        tRadius * sin(30) + bigCornerW/2,
        2*(pillarHeight+barH) - 1
        ]
      ) 
    _platform3();
  }
  if ($t >= time+1/100) {       
    //Floor 
    RDx = (tSide/2) - platformL - (pillarHeight + barH)  + 2*smallCornerW  - 1;
    RDy = tRadius * sin(30) + bigCornerW/2 +1;
    points = [
      [RDx, RDy],
      [RDx, RDy + ladderW - bigCornerW -2],
      [RDx - (ladder3L+bigCornerW-8)-(ladderW/cos(30))*sin(30), RDy + ladderW - bigCornerW -2],
      [RDx - (ladder3L+bigCornerW-4), RDy]
    ];
    echo ("POINTS=", points);    
    translate([0, 0, 2*(pillarHeight+barH) + 1])
    linear_extrude(floorW)
      color("LightYellow") 
      polygon(points=points,
      paths = [[0,1,2,3]],
      convexity = 10
    );   
  }
}

module _platform3() {
    
  // Ближний нижний уголок  
  translate([0, 0, 0])
    rotate([-90, 0, 90])
    cornerBar(ladderW-bigCornerW, smallCornerW);
    
  // Левый уголок    
  translate([-ladder3L, 0, 2])
    rotate([0, 0, 0])
    cornerBar(ladder3L, smallCornerW); 

  // Правый уголок   
   translate([-ladder3L-delta3Ladder, ladderW-bigCornerW-bigCornerW+bigCornerW, 2])
    rotate([0, 0, 0])
    cornerBar(ladder3L + delta3Ladder, smallCornerW);    
//   translate([-(tSide/2 - platformL)  - (ladderW/cos(30)) * sin(30), ladderW-bigCornerW-bigCornerW+bigCornerW, 2])
//     rotate([90, 0, 0])
//     cornerBar(tSide/2 - platformL + (ladderW/cos(30)) * sin(30), bigCornerW); 

  translate([-1, bigCornerW+smallCornerW, 1])
    rotate([0, 0, 90])
    cornerBar(ladderW-(bigCornerW+smallCornerW)*2-bigCornerW+barW, smallCornerW);    
}


module support1(time) {
  if ($t >= time+0/100) {    
    // Выносной поддерживающий уголок первого этажа
    translate([tRadius*sin(30)*cos(30) + barW*cos(30)+2, -tRadius*sin(30)*sin(30)+1 + barW*sin(30), level1H])
      rotate([180, 0, 60])
      cornerBar(tSide/2 + ladderW/cos(30), bigCornerW);  

    // Дальняя передняя стойка
    translate([(tSide/2)-platformL, tRadius*sin(30)+ladderW-barW/2, 0])
      rotate([0, -90, 0])
      cornerBar(pillarHeight+barH+railingH, 5);  

    // Ближняя передняя стойка
    translate([(tSide/2)-platformL, tRadius*sin(30)+barW/2, 0])
      rotate([0, -90, 0])
      cornerBar(pillarHeight+barH+railingH, 5); 

    RDx = (tSide/2) - platformL - (pillarHeight + barH)  + 2*smallCornerW;
    // Дальняя задняя стойка
    translate([RDx, tRadius*sin(30)+ladderW-barW/2+1, pillarHeight + barH])
      rotate([0, -90, 0])
      cornerBar(pillarHeight+barH+railingH, 5); 
      
    // Дальняя задняя стойка II
    translate([RDx - platformL, tRadius*sin(30)+ladderW-barW/2+1, pillarHeight + barH])
      rotate([0, -90, 0])
      cornerBar(pillarHeight+barH+railingH, 5);     

    // Дальняя передняя стойка
    translate([RDx, tRadius*sin(30)+barW/2, pillarHeight + barH])
      rotate([0, -90, 0])
      cornerBar(pillarHeight+barH+railingH, 5);     
  }
}

module support2(time) {
  if ($t >= time+0/100) {  
    //Дальный выносной поддерживающий уголок второго этажа
  /*  translate([-(tRadius)*sin(30)*cos(30)+ barW*cos(30)+1, -tRadius*sin(30)*sin(30)+1, level2H]) */
    translate([-tRadius*sin(30)*cos(30) - barW*cos(30) - 1, -tRadius*sin(30)*sin(30)+1 + barW*sin(30), level2H])
      rotate([-90, 0, 120])
      cornerBar(tSide/2 + ladderW/cos(30), 5); 
  } 
}

module ladder(time) {
//   angle = atan((pillarHeight*2 + barH)/tSide);
  angle = 45;
//   echo ("angle=", angle);
  //Спуск с этажа
  if ($t >= time+0/100) {    
    // Левый  
    translate([(tSide/2)-platformL+barH , tRadius*sin(30)+barW/2, -barH])
      rotate([0, -(180-angle), 0])
      cornerBar((pillarHeight+barH*2)/sin(angle), bigCornerW); 
  }
  if ($t >= time+1/100) {    
    // Левый задний  
    translate([(tSide/2)-platformL+barH-stairW+bigCornerW-2, tRadius*sin(30)+barW/2, -barH])
      rotate([0, -(180-angle), 0])
      cornerBar((pillarHeight+barH*2)/sin(angle), bigCornerW);
  }
  if ($t >= time+2/100) {      
    // Правый   
    translate([(tSide/2)-platformL+barH , tRadius*sin(30)+ladderW-barW/2, -barH])
      rotate([90, -(180-angle), 0])
      cornerBar((pillarHeight+barH*2)/sin(angle), bigCornerW); 
  }
  if ($t >= time+3/100) {         
    // Правый задний  
    translate([(tSide/2)-platformL+barH-stairW+bigCornerW-2 , tRadius*sin(30)+ladderW-barW/2, -barH])
      rotate([90, -(180-angle), 0])
      cornerBar((pillarHeight+barH*2)/sin(angle), bigCornerW);  
      
    // Ступеньки
  }
  if ($t >= time+4/100) {  
    H = pillarHeight + barH;
    W = H;
    nStairs = 11;
    for (n = [1:nStairs-1]) {
      x = (tSide/2) - platformL - (W/nStairs) * n + 2 + smallCornerW;
      y = tRadius * sin(30) + bigCornerW/2;
      z = (H/nStairs) * n -1;
      if ($t >= time+4/100 + 2/1000 * n) {  
        translate([x, y , z])
          stair();
      }
    }    
  }
  if ($t >= time+6/100) {         
    // Левые перила
    translate([(tSide/2)-platformL , tRadius*sin(30)+barW/2, railingH])
      rotate([0, -(180-angle), 0])
      cornerBar((pillarHeight+barH)/sin(angle), bigCornerW); 
  }
  if ($t >= time+7/100) {        
    translate([(tSide/2)-platformL , tRadius*sin(30)+barW*1.5-1,   railingH])
      rotate([90, -(180-angle), 0])
      handRailBar((pillarHeight+barH)/sin(angle)/*, bigCornerW*/); 
      
  }
  if ($t >= time+8/100) {        
    // Правые перила   
    translate([(tSide/2)-platformL , tRadius*sin(30)+ladderW+barW/2,   railingH])
      rotate([90, -(180-angle), 0])
      cornerBar((pillarHeight+barH)/sin(angle), bigCornerW);
  }
  if ($t >= time+9/100) {        
    translate([(tSide/2)-platformL , tRadius*sin(30)+ladderW+barW/2,   railingH])
      rotate([90, -(180-angle), 0])
      handRailBar((pillarHeight+barH)/sin(angle)/*, bigCornerW*/);   
  }
}


//platform2();
// ladder();
