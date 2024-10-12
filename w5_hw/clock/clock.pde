void setup() {
  size(800, 800);
}

void draw () { 
  background(212);
  translate(width / 2, height / 2);
  noFill();
  stroke(255);
  strokeWeight(8);
  ellipse(0,0,700,700);
  
  for (int i = 0; i<60; i++) {
    float angle = TWO_PI / 60 *i;
    float x1 = cos(angle) * 300;
    float y1 = sin(angle) * 300;
    float x2 = cos(angle) * 350;
    float y2 = sin(angle) * 350;
    
    if (i % 5 == 0) {
      strokeWeight(4);
    } else {
      strokeWeight(1);
    }
    
    line(x1,y1,x2,y2);
  }
  
  int h = hour()%12;
  int m = minute();
  int s = second();
  
  float hourAngle = map(h + m / 60.0, 0, 12, 0, TWO_PI) - HALF_PI;
  float minuteAngle = map(m + s / 60.0, 0, 60, 0, TWO_PI) - HALF_PI;
  float secondAngle = map(s,0,60,0, TWO_PI)- HALF_PI;
  
  strokeWeight(8);
  stroke(255);
  line(0,0,cos(hourAngle)* 150, sin(hourAngle)*150);
  
  strokeWeight(6);
  stroke(255);
  line(0, 0, cos(minuteAngle)* 200, sin(minuteAngle)*200);
  
  strokeWeight(3);
  stroke(255,0,0);
  line(0 ,0, cos(secondAngle)* 250, sin(secondAngle)*250);
  
  fill(255,0,0);
  noStroke();
  ellipse(0,0,20,20)
 ;
}
  
  
      
