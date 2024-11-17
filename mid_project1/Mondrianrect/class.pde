// 직사각형을 표현하는 클래스
class MondrianRect {
  float x, y, w, h; // 직사각형의 위치와 크기
  color col; // 직사각형 색상
  // 직사각형 생성 
  MondrianRect(float x, float y, float w, float h, color col) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.col = col;
  }

  void display() {
    fill(col);
    stroke(0); // 검은 테두리
    strokeWeight(3); // 테두리 두께
    rect(x, y, w, h); // 직사각형 그리기
  }
//챗지피티에게 화면을 넘어가지 않고 충돌을 피하는 방법을 질문함
  // 충돌 여부 확인 함수
  boolean isOverlapping(MondrianRect other) { // 직사각형이 겹치는지 확인 
    return !(x + w <= other.x || other.x + other.w <= x || 
             y + h <= other.y || other.y + other.h <= y);
  }
}
