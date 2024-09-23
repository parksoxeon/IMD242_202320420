void setup() {
size(640,480);
background(109,125,194);
}
void draw() {
//stroke(255);
fill(254,218,69);
circle(320, 240, 200);
fill(255);
circle(270, 240, 70);  
stroke(0);
strokeWeight(5);
point(270,240); 
strokeWeight(1);
circle(370, 240, 70);
strokeWeight(5);
point(370,240);
strokeWeight(1);
circle(320, 280, 15); 
line(270,300,370,300);
}

void mousePressed() {
  circle(320, 280, 35);
  
}
