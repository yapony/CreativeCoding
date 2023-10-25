PImage img;

void settings() {
  img = loadImage("woman2.jpg");
  size(img.width, img.height); // 将画布大小设置为图片的大小
}

void setup() {
}

void draw() {
  background(255);
  
  int gridSize = 5; // 将图像划分为5行5列的网格
  // 每个网格单元的大小
  int cellSize_height = height / gridSize; 
  int cellSize_width = width / gridSize;
  
  // 遍历每个网格单元
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      // 计算网格单元的位置和大小
      int x = i * cellSize_width + i*9;
      int y = j * cellSize_height + j*9;
      
      // 使用随机值来决定绘制方式
      float noiseValue = random(0,1);
      
      if (noiseValue < 0.33) {
        // 绘制圆形
        drawCircles(x, y, cellSize_width, cellSize_height);
      } else if (noiseValue < 0.66) {
        // 绘制正方形
        drawSquares(x, y, cellSize_width, cellSize_height);
      } else {
        // 绘制线段
        drawLines(x, y, cellSize_width, cellSize_height);
      }
    }
  }
  
  noLoop(); // 只绘制一次
}

// 在指定的网格单元中绘制圆形
void drawCircles(int x, int y, int size_width, int size_height) {
  for (int i = x; i < x + size_width; i += 13) {
    for (int j = y; j < y + size_height; j += 13) {
      color c = img.get(i, j);
      float brightness = brightness(c);
      float radius = map(brightness, 0, 255, 11, 4);
      fill(c);
      noStroke();
      ellipse(i, j, radius*2, radius*2);
    }
  }
}

// 在指定的网格单元中绘制正方形
void drawSquares(int x, int y, int size_width, int size_height) {
  for (int i = x; i < x + size_width; i += 15) {
    for (int j = y; j < y + size_height; j += 15) {
      color c = img.get(i, j);
      float brightness = brightness(c);
      float sideLength = map(brightness, 0, 255, 15, 8); // 根据亮度映射正方形的边长
      fill(c);
      noStroke();
      rect(i-sideLength/2, j-sideLength/2, sideLength, sideLength);
    }
  }
}

// 在指定的网格单元中绘制线段
void drawLines(int x, int y, int size_width, int size_height) {
  for (int i = x; i < x + size_width; i += 15) {
    for (int j = y; j < y + size_height; j += 15) {
      color c = img.get(i, j);
      float brightness = brightness(c);
      float weight = map(brightness, 0, 255, 15, 4); // 根据亮度映射线段的粗度，亮度越大，线段越细
      stroke(c);
      strokeWeight(weight);
      line(i-size_width/20, j-size_height/20,
           i+size_width/20, j+size_height/20);
    }
  }
}
