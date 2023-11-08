import geomerative.*;

String word = "D S";
RFont font;

void setup() {
  size(800, 600, P2D);
  RG.init(this);
  font = new RFont("Consolas.ttf", 300, CENTER);
  
  background(0); // Set the background color to black
  translate(width/2, height/2); // Move the origin to the center of the screen
  
  RGroup grp = font.toGroup(word);
  grp = grp.toPolygonGroup();
  
  RPoint[] pnts = grp.getPoints();
  
  noFill(); // Don't fill the circles
  stroke(255); // Set the stroke color to white
  strokeWeight(1);
  
  for (RPoint p : pnts) {
    ellipse(p.x, p.y, 40, 40); // Draw a circle at each point
  }
  
}
