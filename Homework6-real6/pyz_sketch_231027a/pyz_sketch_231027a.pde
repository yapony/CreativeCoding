import processing.svg.*;

boolean record;
float t;
int size = 50;

void setup() {
  size(800, 800);
}

void draw() {
  if (record) {
    //#### will be replaced with the frame number.
    beginRecord(SVG, "frame-####.svg");
  }
  
  background(230,230,230);
  
  t += 0.005;
  
  for (int i = 0; i < 3; i++) { // 画三条管道
    float x = width / 4 * (i + 1); // 确定每条管道的x坐标
    for (int y = 0; y <= height; y += 3) {
      float angle = noise(x * 0.005, y * 0.005, t) * TWO_PI;
      float len = noise(x * 0.01, y * 0.01, t) * size;
      
      // 根据y的位置在两种颜色之间插值
      color c1 = color(236, 131, 183); 
      color c2 = color(48, 112, 120); 
      float amt = noise(x * 0.01, y * 0.01, t);
      stroke(lerpColor(c1, c2, amt));
      
      // 每个小椭圆会旋转一定角度     
      pushMatrix();
      translate(x, y);
      rotate(angle);
      noFill();
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
  size += 50;
  if(size>=500){
     size = 50;
  }
}
