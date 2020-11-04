int[] px = new int[4];
int[] py = new int[4];
int x = 100;
int y = 50;
boolean pressed[] = new boolean[4];
void setup() {
  size(800, 800);
  background(153);
  
  for(int i = 0; i < 4; i++){
    px[i] = x;
    py[i] = y;
    x+=100;
    y+=75;
  }
}
void draw() {
  background(153);
  for(int i = 0; i<4; i++){
    if(pressed[i] == true){
    px[i] = mouseX;
    py[i] = mouseY;
    }
  }
  
  for(int i=0; i<4; i++){
    circle(px[i],py[i],20);
  }
  
  for(int i=0; i<3;i++){
    line(px[i],py[i],px[i+1],py[i+1]);
  }
  
  beginShape(LINES);
  for(float i=0; i<1; i+=0.01){
    float x;
    float y;
    x = (px[0] * pow(1-i,3)) + (px[1] * 3 * (pow(1-i, 2) * i) + (px[2] * 3 * (1-i) * pow(i,2)) + (px[3] * pow(i,3)));
    y = (py[0] * pow(1-i,3)) + (py[1] * 3 * (pow(1-i, 2) * i) + (py[2] * 3 * (1-i) * pow(i,2)) + (py[3] * pow(i,3)));
    vertex(x,y);
  }
  endShape();
}

void mouseDragged(){
  for(int i=0;i<4;i++){
    if(sqrt(pow(mouseX-px[i],2)+pow(mouseY-py[i],2)) <20){
    pressed[i] = true;
  }
  }
 
}

void mouseReleased(){
  for(int i=0;i<4;i++)
    pressed[i] = false;
}
