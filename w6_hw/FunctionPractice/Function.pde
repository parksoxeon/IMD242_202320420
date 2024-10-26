int randomSeed = 0;
void setup() {
  size(800, 800);
}

void mousePressed () {
  randomSeed = int(random(10000000));
  println(randomSeed);
}

void draw() {
  randomSeed(randomSeed);
  background(255);

  for (int n=0; n< 5; n++) {
   house(random(width),
      random(1/3.0 * height, 2 / 3.0 * height),
      random(100, 200));
  }
}
void house(float x, float y, float size) {
  pushMatrix();
  translate(x, y);
  
  fill (random(255), random(255), random (255)); 
  rectMode (CENTER) ;
rect(0, 0, size, size) ;

fill (random (255), random (255), random (255)) ;
triangle(-size / 2,-size /2, 0,-size, size/ 2, -size / 2);

fill (random (255), random(255), random (255));
rect(0, size / 4, size / 5, size / 3);

fill (random (255), random (255), random (255)) ;
rect(-size / 4, -size / 4, size / 5, size / 5);
rect(size / 4, -size / 4, size / 5, size / 5);
  
 popMatrix() ;
}
  
  
