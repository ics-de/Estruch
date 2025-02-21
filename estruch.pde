
//Parameters
int posX = 0;
int posY = 0;

int scaleX = 0;
int scaleY = 0;

int colorR = 255;
int colorG = 255;
int colorB = 255;
int colorA = 255;

float bevel = 0;
int density = 1;  //quantes shapes dibuixades alhora
int spacing = 5;  //pixel spacing

//Imatges
PImage image;
StringList imageList;
int currentImage = 0;

//Efectes
float filterBlur = 0;
float filterThreshold = 0;

boolean backgroundBleed = true;

int drawMode = 1;  //0 = quadrat, 1 = ellipse, 2 = imatge

void setup() {
  size(1920, 1080);
  //fullScreen(P2D, 1);
  noCursor();
  background(0);

  midiBus.list();
  midiCreateBus();

  //crear llista d'imatges a utilitzar
  LoadImageList();
}

void draw() {
  if (backgroundBleed)
  {
    background(0, 50);
  } else
  {
    background(0);
  }

  switch(drawMode) {

  case 0:
    Quadrat();
    break;

  case 1:
    Ellipse();
    break;

  case 2:
    Imatge();
    break;
  }
}



void Quadrat() {
  int bevelQ = int(lerp(0, scaleX/2, bevel));

  noStroke();
  fill(colorR, colorG, colorB, colorA);
  for (int x = 0; x < density; x++) {
    for (int y = 0; y < density; y++) {
      rect(posX+(scaleX+spacing)*x, posY+(scaleY+spacing)*y, scaleX, scaleY);
    }
  }
}

void Ellipse() {
  noStroke();
  fill(colorR, colorG, colorB, colorA);
  ellipseMode(CORNER);
  for (int x = 0; x < density; x++) {
    for (int y = 0; y < density; y++) {
      ellipse(posX+scaleX*x, posY+scaleY*y, scaleX, scaleY);
    }
  }
}

void Imatge() {
  tint(colorR, colorG, colorB, colorA);
  image(image, posX, posY, scaleX, scaleY);

  //Efectes

  if (filterThreshold > 0)
  {
    filter(THRESHOLD, filterThreshold);
  }
  if (filterBlur > 0)
  {
    filter(BLUR, filterBlur);
  }
}
