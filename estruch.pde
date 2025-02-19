
float speed = 20;
int lastMousePos = 0;

color col;

int x;
int y;

void setup(){
  size(1920,1080);
  fullScreen();
  noCursor();
  background(0);
  col = (255);
  midiBus.list();
}

void draw(){
  background(0);
  //Linies();
  QuadratMouse();
  //Strobo();
}

void Linies(){
  translate(0,random(0,height));
  fill(col);
  rect(0,height/2,width,height);
}

void QuadratMouse(){
  fill(col);
  rect(x,y,500,500);
  
  delay(5);
}

void Strobo(){
  background(random(0,255));
}
