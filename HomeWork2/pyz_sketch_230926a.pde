/* 
  CreativeCoding 2023 Fall
  Homework2
  2023/09/27
*/ 
 
int frameCount = 0; // 用于计数帧数

void setup() 
{ 
  size(800, 600); 
  ellipseMode(CENTER); 
  noFill(); 
  background(0); 
  stroke(255); 
  frameRate(30); // 帧率为30
} 
 
void draw() 
{ 
  float x = random(50,width);
  float y = random(50,height - 50);
  float r = random(50,500);
  stroke(random(30,255),random(30,255),random(30,255));
  strokeWeight(random(1,4));
  ellipse(x, y, r, r); 

  saveFrame("frame-######.png"); // 每一帧都保存一个图片
}
