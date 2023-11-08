import geomerative.*;

RFont font;
String text = "DSHB";  // The string to be drawn

void setup() {
  size(800, 800);
  smooth();
  noStroke();

  RG.init(this);
  font = new RFont("Consolas.ttf", 300, CENTER);
}

void draw() {
  background(0);
  
  PVector center = new PVector(width/8, 0);  // Center of the canvas
  translate(width/2, height/2);  // Move to the center of the canvas
  
  for (int k = 0; k < text.length(); k++) {
    char c = text.charAt(k);
    RPolygon polygon = font.toPolygon(c);
    
    pushMatrix();  // Save the current transformation matrix
    translate(k * 200 - (text.length() - 1) * 105, 0);  // Adjust the position of each character
    
    for (int i = 0; i < polygon.contours.length; i++) {
      RContour contour = polygon.contours[i];
      
      for (int j = 0; j < contour.points.length; j++) {
        // Randomly select 70% of the points
        if (random(1) < 0.7) {
          RPoint point = contour.points[j];
          
          if (i==0) {  // Outer contour
            stroke(255, 255, 255, 150);  // 外轮廓连线颜色
          } else {  // Inner contour
            stroke(241, 255, 0, 150);  // 内轮廓连线颜色
          }
          line(center.x, center.y, point.x, point.y);
        }
      }
    }
    
    popMatrix(); 
  }
  save("DSHB.png");
  noLoop();
}
