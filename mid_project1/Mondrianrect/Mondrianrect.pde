// 챗지피치에게 직사각형을 생성할 때 충돌을 피하는 방법과 화면 크기를 넘지 않도록 하는 방법 및 검에 대해 질문함 
ArrayList<MondrianRect> rects;
color[] colors;

void setup() {
  fullScreen();
  rects = new ArrayList<MondrianRect>();
  
  // 몬드리안 스타일의 색상 설정 (빨강, 파랑, 노랑, 흰색)
  colors = new color[]{color(255, 0, 0), color(0, 0, 255), color(255, 255, 0), color(255)};
  generateRects();
}

void draw() {
  background(255);   
  // 직사각형 그리기
  for (MondrianRect r : rects) {
    r.display();
  }

  // 현재 ArrayList 크기를 화면 좌측 상단에 표시
  fill(0);
  textSize(20);
  text("Rectangles: " + rects.size(), 10, 30);
}

void mousePressed() {
  generateRects(); // 마우스를 클릭하면 새로운 직사각형 생성
}

void generateRects() {
  rects.clear(); // 기존 직사각형 제거
  int rectCount = int(random(5, 20)); //5~20개의 직사각형 생성

  for (int i = 0; i < rectCount; i++) { //직사각형을 랜덤으로 반복 생성
    boolean isValid = false; // 새로운 사각형이 유효한지 검사. false로 설정하여 유효하지 않다고 가정 
    int attempts = 0; //직사각형 생성 시도 횟수

    while (!isValid && attempts < 100) { // 최대 100번 시도
      // 직사각형의 랜덤한 값 설정 
      float x = random(0, width);
      float y = random(0, height);
      float w = random(50, 200); 
      float h = random(50, 200); 

// 챗지피티에게 화면을 넘어가지 않고 충돌을 피하는 방법을 질문함
      // 화면을 넘어가지 않도록 크기 보정
      if (x + w > width) w = width - x; // 직사각형이 화면 오른쪽을 넘지 않도록 너비를 조정 
      if (y + h > height) h = height - y; // 직사각형이 화면 아래쪽을 넘지 않도록 높이 조정 
      
      //랜덤 색상을 이용해 객체 생성 
      MondrianRect newRect = new MondrianRect(x, y, w, h, colors[int(random(colors.length))]);

      // 다른 직사각형과 충돌하는지 확인
      isValid = true; // 유효하다고 판단되면 true 
      for (MondrianRect r : rects) {  // 기존 직사각형들과 충돌하는지 확인 
        if (newRect.isOverlapping(r)) {  
          isValid = false;
          break;
        }
      }

      if (isValid) {
        rects.add(newRect); // 겹치지 않으면 추가
      }

      attempts++;
    }
  }
}
