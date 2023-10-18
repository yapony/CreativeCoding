int rectWidth = 9; // 矩形宽度
int rectHeight = 595; // 矩形高度
int spacing = 3; // 矩形间隔
PImage img;//背景猫图片

ArrayList<Rectangle> rectangles = new ArrayList<Rectangle>(); // 存储矩形的数组列表

void setup() {
  size(842, 595); // 画布大小
  smooth();
  frameRate(60); // 帧率（每秒60帧）
  img = loadImage("cat2.jpg");

  int numRectangles = width / (rectWidth + spacing) + 1; // 计算所需矩形数量
  for (int i = numRectangles-1; i >= 0; i--) {
    Rectangle rectangle = new Rectangle(i * (rectWidth + spacing), 0); // 创建矩形对象
    rectangles.add(rectangle); // 加入矩形数组列表
  }
}

void draw() {
  background(255); // 清空画布
  image(img, 0, 0, width, height);

  // 绘制和移动矩形
  for (int i = 0; i < rectangles.size(); i++) {
    Rectangle rectangle = rectangles.get(i);
    rectangle.display(); // 绘制矩形
    rectangle.move(); // 移动矩形
  }
  
  // 创建新的矩形并加入矩形数组列表
  Rectangle lastRectangle = rectangles.get(rectangles.size() - 1);
  if (lastRectangle.x > 5) {
    Rectangle newRectangle = new Rectangle(lastRectangle.x - rectWidth - spacing, 0);
    rectangles.add(newRectangle);
  }

  // 删除超出画布的矩形
  Rectangle firstRectangle = rectangles.get(0);
  if (firstRectangle.x + rectWidth > width +5) {
    rectangles.remove(0);
  }
}

class Rectangle {
  float x, y;
  
  Rectangle(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void display() {
    rect(x, y, rectWidth, rectHeight);
    fill(0);
  }
  
  void move() {
    x += 0.4; // 移动速度为0.5个单位
  }
}
