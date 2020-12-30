
module sauna(time) {
  if ($t >= time) {  
    translate([-tSide/2, 273, 0]) color("Gray", 0.2)  
      cube([500, 300, 220], false); 
  }
}
