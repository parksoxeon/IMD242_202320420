float squareSize = random(50,150);
float lineWidth = random(4,16);

void setup() {
  size(640,360);
  background(0);
}

void mousePressed() {
  squareSize = random (60, 200);
  lineWidth = random(4,16);
}

  void draw() {
  squareSize  = random(50, 150);
  lineWidth = random(6,20);
  //background(0);
  rectMode(CENTER);
  strokeWeight(lineWidth);
  stroke(14,55,147,70);
  fill(36,69,133,225);
  square(320,180,squareSize);
  }
