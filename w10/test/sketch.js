const colours = ['#FF885B', '#FFE5CF', '#557C56', '#33372C'];

let snow = [];

function setup() {
  createCanvas(600, 400);
  for (let idx = 0; idx < 100; idx++) {
    const rad = random(5, 20);
    const newSnow = new Ball(
      random(rad + 5, width - rad - 5),
      random(rad + 5, height - rad - 5),
      random(1, 10),
      rad,
      colours[int(random(colours.length))]
    );
    snow.push(newSnow);
  }
}

function draw() {
  background(255);
  for (let idx = 0; idx < snow.length; idx++) {
    snow[idx].update();
    snow[idx].bound();
    snow[idx].display();
  }
}

class Ball {
  constructor(x, y, speed, rad, colours) {
    this.x = x;
    this.y = y;
    let deg = random(360);
    this.vx = speed * cos(radians(deg)); // randians -> radians
    this.vy = speed * sin(radians(deg));
    this.rad = rad;
    this.colours = colours;
  }

  update() {
    this.x += this.vx;
    this.y += this.vy;
  }

  bound() {
    if (this.x < this.rad || this.x > width - this.rad) {
      this.vx *= -1; // * = -> *=
    }
    if (this.y < this.rad || this.y > height - this.rad) {
      this.vy *= -1; // * = -> *=
    }
  }

  display() {
    noStroke(); // noStroke() 위치 확인
    fill(this.colours);
    circle(this.x, this.y, 2 * this.rad);
  }
}
