StringList promptList;
String selectedPrompt = "";

int fontScale = 50;

PImage screenshot;

void LoadPromptsList() {
  promptList = new StringList();

  promptList.append("árbol");
  promptList.append("miguel");
  promptList.append("casa");
  promptList.append("estruch");
}

void RandomPrompt(){
    selectedPrompt = promptList.get(floor(random(0, promptList.size())));
    background(0);
    Screenshot();
}

void DisplayPrompt() {
  
  fill(255);
  textSize(fontScale);
  text(selectedPrompt,width/2,fontScale);
}

void Screenshot(){
  saveFrame("data/screenshot.png");
  println("screenshot");
}

void DisplayScreenshot(){
  screenshot = loadImage("screenshot.png");
  image(screenshot,0,0,width,height);
}
