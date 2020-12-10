
module cornerBar(length, width) {
  color("Silver") 
    linear_extrude(1) 
    square([length, width]);
  color("Silver") 
    rotate([90,0,0])
    linear_extrude(1) 
    square([length, width]);    
}

cornerBar(300, 5);
