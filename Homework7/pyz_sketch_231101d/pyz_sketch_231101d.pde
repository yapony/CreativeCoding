import geomerative.*;

RFont font;
RPolygon polygon;
char c = 'B';

void setup() {
  size(600, 400);
  smooth();

  RG.init(this);
  font = new RFont("Consolas.ttf", 200, CENTER);
  polygon = font.toPolygon(c);
}

void draw() {
  background(255);
  
  translate(width/2, height/2);  // 移到画布中间
  
  for (int i = 0; i < polygon.contours.length; i++) {
    RContour contour = polygon.contours[i];
    
    for (int j = 0; j < contour.points.length; j++) {
      // Randomly select some points
      if (random(1) < 0.7) {   //取该轮廓上百分之七十的点进行绘制
        RPoint point = contour.points[j];
        
        if (i == 0) {  // 外轮廓
          stroke(0);  
          noFill();  
          strokeWeight(3);
          float angle = noise(frameCount * 0.01, point.x * 0.01, point.y * 0.01) * TWO_PI;
          float endX = point.x + cos(angle) * 10;  
          float endY = point.y + sin(angle) * 10;
          line(point.x, point.y, endX, endY);
        } else {  // 内轮廓
          fill(0);  
          noStroke();  
          ellipse(point.x, point.y, 8,8);  
        }
      }
    }
  }
  noLoop();
}
