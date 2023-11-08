import geomerative.*;

String word = "DSHL";
RFont font;
ArrayList<Particle> particles;

void setup() {
  size(800, 600, P2D);
  RG.init(this);
  font = new RFont("Consolas.ttf", 300, CENTER);
  
  particles = new ArrayList<Particle>();
  
  RGroup grp = font.toGroup(word);
  grp = grp.toPolygonGroup();
  
  RPoint[] pnts = grp.getPoints();
  
  for (RPoint p : pnts) {
    particles.add(new Particle(p.x + width/2, p.y + height/2));
  }
}

void draw() {
  background(255);
  
 if (frameCount <= 10) {
    for (Particle particle : particles) {
      particle.update();
      particle.display();
    }
    
    if (frameCount == 10) {
     // save("output.png");
      noLoop();
    }
  }
}

class Particle {
  PVector position;
  PVector velocity;
  
  Particle(float x, float y) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(random(2));
  }
  
  void update() {
    position.add(velocity);
    
    if (position.x < 0 || position.x > width) {
      velocity.x *= -1;
    }
    
    if (position.y < 0 || position.y > height) {
      velocity.y *= -1;
    }
  }
  
  void display() {
    noStroke();
    fill(random(255), random(255), random(255), random(50,100));
    ellipse(position.x, position.y, random(20,30), random(20,30));
  }
}
