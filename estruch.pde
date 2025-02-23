
//Parameters
int posX = 0;
int posY = 0;

float rotation = 0;

int scaleX = 0;
int scaleY = 0;

int colorR = 255;
int colorG = 255;
int colorB = 255;
int colorA = 255;

float bevel = 0;
int densityX = 1;  //quantes shapes dibuixades alhora
int densityY = 1;  //quantes shapes dibuixades alhora
int spacingX = 0;  //pixel spacing
int spacingY = 0;  //pixel spacing

//Imatges
PImage image;
StringList imageList;
int currentImage = 0;

//Efectes
float filterBlur = 0;
float filterThreshold = 0;

boolean backgroundBleed = true;

int drawMode = 0;  //0 = quadrat, 1 = ellipse, 2 = imatge
boolean isMain = true;  //ordinador principal



void setup() {
  size(1920, 1080);
  fullScreen(2);
  noCursor();
  background(0);

  midiBus.list();
  midiCreateBus();
  oscSetUp();

  //crear llista d'imatges a utilitzar
  LoadImageList();
  PreloadImatge();
  LoadPromptsList();
  Screenshot();
  
  //audioSetup();
}

void draw() {
  if (backgroundBleed)
  {
    background(0, 50);
  } else
  {
    background(0);
  }
  DisplayScreenshot();
  
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

  if (isMain) {
    DisplayPrompt();
  }
  if(audioEnabled){
  //audioPlay();
  }
}



void Quadrat() {
  //int bevelQ = int(lerp(0, scaleX/2, bevel));
  noStroke();
  fill(colorR, colorG, colorB, colorA);
  for (int x = 0; x < densityX; x++) {
    for (int y = 0; y < densityY; y++) {
        //rotate(rotation);

      rect(posX+(scaleX+spacingX)*x, posY+(scaleY+spacingY)*y, scaleX, scaleY, bevel);
    }
  }
}

void Ellipse() {
  //rotate(rotation);
  noStroke();
  fill(colorR, colorG, colorB, colorA);
  ellipseMode(CORNER);
  for (int x = 0; x < densityX; x++) {
    for (int y = 0; y < densityY; y++) {
      ellipse(posX+(scaleX+spacingX)*x, posY+(scaleY+spacingY)*y, scaleX, scaleY);
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



void keyPressed() {
  if (key == ' ') {
    if (isMain)
    {
      GeneratePrompt();
    }
  }
  if (key == 'p') {
    Screenshot();
    if(isMain){
      oscSendScreenshot();
    }
  }
  if (key == 'o') {
    Clear();
  }
  if (key == 'a') {
    ToggleAudio();
  }
}

void SetDrawMode(int mode){
  drawMode = mode;
  println("drawMode: " + drawMode);
}
