int tileNum;
float noiseMult = 1;

void setup() {
  size(600, 600);
  background(0);
}

void draw() {
  noiseSeed(0);
  background(0);
  tileNum = int(map(mouseX, 0, width, 3, 16));
  noiseMult = pow(10, map(mouseY, 0, height, -1, -4));
  float tileSize = width / float(tileNum);

  for (int row = 0; row<tileNum; row++) {
    for (int col = 0; col < tileNum; col++) {
      float rectX = tileSize * col;
      float rectY = tileSize * row;
      float centerX = rectX + tileSize * 0.5;
      float centerY = rectY + tileSize * 0.5;
      float noiseVal = noise( centerX * noiseMult, centerY * noiseMult);
      
      noFill();
      stroke(255);
      strokeWeight(2);
      circle(centerX, centerY, tileSize);
      
      pushMatrix();
      translate(centerX, centerY);
      rotate(radians (360 * noiseVal));
      stroke(255);
      line(0, 0, tileSize * 0.4, 0);
      
      fill(255);
      noStroke();
      circle(tileSize * 0.4, 0, 8);
      popMatrix();
    }
  }
}
      
      
      
