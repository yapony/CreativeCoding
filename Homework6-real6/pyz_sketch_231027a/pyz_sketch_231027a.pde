import processing.svg.*;

boolean record;
float t;

void setup() {
  size(400, 400);
  noFill();
}

void draw() {
  if (record) {
    // Note that #### will be replaced with the frame number. Fancy!
    beginRecord(SVG, "frame-####.svg");
  }
  
  background(230,230,230);
  
  t += 0.005;
  
  for (int i = 0; i < 3; i++) { // 只画三条线
    float x = width / 4 * (i + 1); // 确定每条线的x坐标
    for (int y = 0; y <= height; y += 3) {
      float angle = noise(x * 0.005, y * 0.005, t) * TWO_PI;
      float len = noise(x * 0.01, y * 0.01, t) * 100;
      
      // 根据y的位置在两种颜色之间插值
      color c1 = color(236, 131, 183); // 红色
      color c2 = color(48, 112, 120); // 绿色
      float amt = noise(x * 0.01, y * 0.01, t);
      stroke(lerpColor(c1, c2, amt));
      
      // 改变每个小段的绘制方式：以中点为基点，绕x轴旋转一个角度
      float x1 = x - cos(angle) * len / 2;
      float y1 = y - sin(angle) * len / 2;
      float x2 = x + cos(angle) * len / 2;
      float y2 = y + sin(angle) * len / 2;
      
      pushMatrix();
      translate((x1 + x2) / 2, (y1 + y2) / 2);
      rotate(angle);
      ellipse(0, 0, len, len / 2);
      popMatrix();
    }
  }
  if (record) {
    endRecord();
    record = false;
  }
}

void mousePressed(){
  record = true;
}
