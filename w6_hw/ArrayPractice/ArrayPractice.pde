int[] fruitAmts;
String[] fruitNames;

void setup() {
  size(800, 480);

 
  fruitAmts = new int[6];
  for (int n = 0; n < 6; n++) {
    if (n == 0) {
      fruitAmts[n] = 50;
    } else {
      fruitAmts[n] = int(random(5, 100));
    }
  }

  
  fruitNames = new String[6];
  fruitNames[0] = "apple";
  fruitNames[1] = "banana";
  fruitNames[2] = "mango";
  fruitNames[3] = "kiwi";
  fruitNames[4] = "peach";
  fruitNames[5] = "orange";
}

float barGap = 120;
float barwidth = 24;
float x = 80;

void draw() {
  background(0);

  int totalAmount = 0;
  strokeWeight(barwidth);

  for (int n = 0; n < 6; n++) {
    stroke(255);
    strokeCap(SQUARE);
    textAlign(CENTER);
    textSize(24);
    fill(255, 0, 0);

    
    line(x + barGap * n, height * 0.5, x + barGap * n, height * 0.5 - 2 * fruitAmts[n]);

    text(fruitNames[n], x + barGap * n, height * 0.5 + 30);
    text(fruitAmts[n], x + barGap * n, height * 0.5 - 2 * fruitAmts[n] - 20);

   
    println("Fruit: " + fruitNames[n] + ", Amount: " + fruitAmts[n]);

   
    totalAmount += fruitAmts[n];
  }

 
  fill(255);
  textSize(24);
  text("Total Amount: " + totalAmount, width * 0.5, height - 40);
}
