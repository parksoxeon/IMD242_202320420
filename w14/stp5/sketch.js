let canvasContainer = document.querySelector('#canvas-container');
let size slider

function setup() {
  createCanvas(400, 400).parent(canvasContainer);
}

function draw() {
  background(220);
  circle(mouseX, mouseY, 50);
}
