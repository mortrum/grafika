
int pontdb = 8;
int[] px = new int[pontdb];
int[] py = new int[pontdb];
int x = 100;
int y = 50;
boolean pressed[] = new boolean[pontdb];
void setup() {
  size(800, 800);
  background(153);
  
  for(int i = 0; i < pontdb; i++){
    px[i] = x;
    py[i] = y;
    x+=100;
    y+=75;
  }
}
void draw() {
  background(153);
  for(int i = 0; i<pontdb; i++){
    if(pressed[i] == true){
    px[i] = mouseX;
    py[i] = mouseY;
    }
  }
  
  for(int i=0; i<pontdb; i++){
    circle(px[i],py[i],20);
  }
  
  for(int i=0; i<pontdb-1;i++){
    line(px[i],py[i],px[i+1],py[i+1]);
  }
  
  beginShape(LINES);
  for(float i=0; i<1; i+=0.01){
    float x=0;
    float y=0;
    for(int j = 0; j<pontdb; j++){
      x+= (px[j] * B(pontdb-1, j, i));
      y+= (py[j] * B(pontdb-1, j, i));
    }
    vertex(x,y);
  }
  endShape();
}



float B(int n, int i, float t){
  float res = nAlattAK(n,i) * pow(t, i) * pow (1-t, n-i);
  return res;
}

int nAlattAK(int n, int k){
  int res=0;
  
  res = fact(n) / (fact(k) * fact(n - k));
  
  return res;
}

int fact(int x){
  int res=1;
  for(int i=1; i<=x; i++)
    res *= i;
  return res;
}

void mouseDragged(){
  for(int i=0;i<pontdb;i++){
    if(sqrt(pow(mouseX-px[i],2)+pow(mouseY-py[i],2)) <20){
    pressed[i] = true;
  }
  }
 
}

void mouseReleased(){
  for(int i=0;i<pontdb;i++)
    pressed[i] = false;
}
