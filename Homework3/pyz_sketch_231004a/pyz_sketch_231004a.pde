int MAX_VERTEX_CNT = 30, MIN_VERTEX_CNT = 3;//设置顶点的最大量和最小量
int vertexCnt,objCnt = 6; //设置常量：形成图形的顶点的个数，以及图形的个数
int radius; //图形们分布的半径
int[] Colors = {#ffea00, #ffffff, #ff0000, #ffffff, #0000ff, #000000};

void setup(){
  size(900,900);
}

void draw(){
  background(210,206,206);
  int centerX = width / 2;
  int centerY = height / 2;
  
  updateCntByMouse();
  
  //渲染每一个图形
  for(int ci = 0; ci < objCnt ; ci ++){
    float angle = map(ci, 0, 6, 0, TWO_PI);
    float circleCenter_x = centerX + cos(angle) * radius;
    float circleCenter_y = centerY + sin(angle) * radius;
    
    //绘制每一个图形的所有顶点
    stroke(0);
    strokeWeight(10);
    fill(Colors[ci]);
    beginShape();
    for(int vi = 0 ; vi < vertexCnt ; vi ++){
      float thetaV = map(vi, 0, vertexCnt, 0, TAU);
      float x = circleCenter_x + cos(thetaV) * 200;
      float y = circleCenter_y + sin(thetaV) * 200;
      vertex(x, y);
    }
    endShape(CLOSE);
  }
}

//根据鼠标的y轴位置更新图形的顶点个数
void updateCntByMouse(){
  float xoffset = abs(mouseX - width / 2) ,yoffset = abs(mouseY - height / 2);
  vertexCnt = int(map(yoffset, 0, height / 2, MAX_VERTEX_CNT, MIN_VERTEX_CNT));
  radius = int(map(xoffset, 0, width / 2, 0, 250));
}
