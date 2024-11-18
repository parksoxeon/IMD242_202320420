let colours = ['#257180', '#F2E5BF', '#FD8B51', '#CB6040'];
let gravity = [0, 0.1];
let friction = 0.99;
let cnt = 0;
let mouse = [0, 0];
let confetties = [];

function setup() {
  createCanvas(800, 800);
}

function gen(x, y, n) {
  for (let idx = 0; idx < n; idx++) {
    let randomW = random(4, 20);
    let randomH = random(4, 20);
    let randomForce = random(1, 10);
    let randomAngForce = random(-30, 30);
    let newConfetti = new Confetti(
      x,
      y,
      randomW,
      randomH,
      colours[int(random(colours.length))],
      randomForce,
      randomAngForce
    );
    confetties.push(newConfetti);
  }
}

function mousePressed() {
  cnt = 0;
  mouse[0] = mouseX;
  mouse[1] = mouseY;
}

function mouseReleased() {
  console.log('gen: ' + cnt);
  gen(mouse[0], mouse[1], cnt);
}

function keyPressed() {
  if (key === 'p' || key === 'P') {
    console.log('confetties: ' + confetties.length);
  }
}

function draw() {
  if (mouseIsPressed) {
    cnt++;
  }
  background(255);
  for (let idx = confetties.length - 1; idx >= 0; idx--) {
    let aConfetti = confetties[idx];
    aConfetti.update(gravity, friction);
    if (aConfetti.isOutOfScreen()) {
      confetties.splice(idx, 1);
    }
  }
  for (let idx = 0; idx < confetties.length; idx++) {
    confetties[idx].display();
  }
}

// Confetti 클래스 정의
class Confetti {
  constructor(x, y, w, h, col, force, angForce) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = col;
    this.force = force;
    this.angForce = angForce;
    this.vx = random(-force, force);
    this.vy = random(-force, force);
    this.angle = 0;
    this.angularVelocity = angForce;
  }

  update(gravity, friction) {
    this.vx *= friction;
    this.vy = this.vy * friction + gravity[1];
    this.x += this.vx;
    this.y += this.vy;
    this.angle += this.angularVelocity;
  }

  isOutOfScreen() {
    return (
      this.x + this.w < 0 ||
      this.x - this.w > width ||
      this.y + this.h < 0 ||
      this.y - this.h > height
    );
  }

  display() {
    push();
    translate(this.x, this.y);
    rotate(radians(this.angle));
    noStroke();
    fill(this.col);
    rectMode(CENTER);
    rect(0, 0, this.w, this.h);
    pop();
  }
}
