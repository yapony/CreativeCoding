PImage img;
float noiseScale = 0.02; // 控制Perlin噪声的缩放比例

void setup() {
  size(800, 800);
  img = loadImage("woman2.jpg"); // 请将 "your_image.jpg" 替换为您的图片文件名
  img.resize(width, height); // 将图片大小调整为与画布大小相同
  noStroke();
}

void draw() {
  background(255);
  
  int gridSize = 5; // 将图像划分为5行5列的网格
  int cellSize = width / gridSize; // 每个网格单元的大小
  
  // 遍历每个网格单元
  for (int i = 0; i < gridSize; i++) {
    for (int j = 0; j < gridSize; j++) {
      // 计算网格单元的位置和大小
      int x = i * cellSize;
      int y = j * cellSize;
      
      // 使用随机值来决定绘制方式
      float noiseValue = random(0,1);
      
      if (noiseValue < 0.33) {
        // 绘制圆形
        drawCircles(x, y, cellSize);
      } else if (noiseValue < 0.66) {
        // 绘制正方形
        drawSquares(x, y, cellSize);
      } else {
        // 绘制线段
        drawLines(x, y, cellSize);
      }
    }
  }
  
  noLoop(); // 只绘制一次
}

// 在指定的网格单元中绘制圆形
void drawCircles(int x, int y, int size) {
  for (int i = x; i < x + size; i += size/10) {
    for (int j = y; j < y + size; j += size/10) {
      color c = img.get(i, j);
      float brightness = brightness(c);
      float radius = map(brightness, 0, 255, size/20, size/10);
      fill(c);
      ellipse(i, j, radius*2, radius*2);
    }
  }
}

// 在指定的网格单元中绘制正方形
void drawSquares(int x, int y, int size) {
  for (int i = x; i < x + size; i += size/10) {
    for (int j = y; j < y + size; j += size/10) {
      color c = img.get(i, j);
      float brightness = brightness(c);
      float sideLength = map(brightness, 0, 255, size/20, size/10); // 根据亮度映射正方形的边长
      fill(c);
      rect(i-sideLength/2, j-sideLength/2, sideLength, sideLength);
    }
  }
}

// 在指定的网格单元中绘制线段
void drawLines(int x, int y, int size) {
  for (int i = x; i < x + size; i += 15) {
    for (int j = y; j < y + size; j += 15) {
      color c = img.get(i, j);
      float brightness = brightness(c);
      int numLines = int(map(brightness, 0, 255, 10, 1)); // 根据亮度映射线段的数量，亮度越大，线段越少
      stroke(c);
      for (int k = 0; k < numLines; k++) { // 根据亮度绘制多条等长的小线段
        line(i-size/20+k*size/(20*numLines), j-size/20+k*size/(20*numLines),
             i+size/20-k*size/(20*numLines), j+size/20-k*size/(20*numLines));
      }
    }
  }
}
