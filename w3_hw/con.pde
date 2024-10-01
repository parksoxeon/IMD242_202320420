void setup() {
  size(600, 480);
}

void draw() {
  background(0);
  stroke(255);
  fill(175);
  rectMode(CENTER);
  
  if (mouseX > 200) {
    line(250, 130, 350, 220);
  } else if (mouseX <400) {
    square(300, 180, 100);
  } else {
      circle(300, 180, 100);
      
      stroke(127);
      strokeWeight(4);
      line(100,0,100,height);
      line(200,0,200,height);
      line(300,0,300,height);
      
      
