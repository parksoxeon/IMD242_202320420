const aspectW = 4;
const aspectH = 3;
const container = document.body.querySelector('.container-canvas');

const density = 'Ñ@#W$9876543210?!abc;:+=-,._          ';

let video;
let asciiDiv;

function setup() {
  const { width: containerW, height: containerH } =
    container.getBoundingClientRect();

  createCanvas(containerW, containerH).parent(container);

  // 웹캠 비디오 설정
  video = createCapture(VIDEO);
  video.size(64, 48); // 아스키 변환을 위한 적절한 크기
  video.hide(); // 비디오 DOM 숨기기

  // 아스키 변환을 위한 div 생성
  asciiDiv = createDiv().style('font-family', 'monospace');
  asciiDiv.style('white-space', 'pre');
  asciiDiv.style('color', 'lime'); // 글자 색상을 초록색으로 설정
  asciiDiv.size(width, height); // 캔버스 크기와 맞춤
  asciiDiv.position(0, 0);
  asciiDiv.style('z-index', '1'); // z-index 설정
  asciiDiv.style('pointer-events', 'none'); // 클릭 이벤트 통과
}

function draw() {
  background(0);

  // 비디오 이미지 가져오기
  video.loadPixels();
  let asciiImage = '';
  for (let j = 0; j < video.height; j++) {
    for (let i = 0; i < video.width; i++) {
      const pixelIndex = (i + j * video.width) * 4;
      const r = video.pixels[pixelIndex + 0];
      const g = video.pixels[pixelIndex + 1];
      const b = video.pixels[pixelIndex + 2];
      const avg = (r + g + b) / 3;
      const len = density.length;
      const charIndex = floor(map(avg, 0, 255, len - 1, 0));
      const c = density.charAt(charIndex);
      asciiImage += c;
    }
    asciiImage += '<br/>';
  }
  asciiDiv.html(asciiImage);
}
