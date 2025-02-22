StringList promptList;
String selectedPrompt = "";

int fontScale = 50;

PImage screenshot;

void LoadPromptsList() {
  promptList = new StringList();

  promptList.append("Una pizza recién horneada");
  promptList.append("Un árbol en otoño");
  promptList.append("Una taza de café");
  promptList.append("La Dignidad");
  promptList.append("Un coche deportivo rojo");
  promptList.append("Un piano de cola");
  promptList.append("Un plato de sushi");
}

void GeneratePrompt() {
  println("generate prompt");
  selectedPrompt = promptList.get(floor(random(0, promptList.size())));
  Clear();
  //oscSendClear();
}

void DisplayPrompt() {
  fill(255);
  textSize(fontScale);
  text(selectedPrompt, width/2, fontScale);
}

void Screenshot() {
  saveFrame("data/screenshot.png");
  println("screenshot");
}

void DisplayScreenshot() {
  screenshot = loadImage("screenshot.png");
  image(screenshot, 0, 0, width, height);
}

void Clear(){
  println("clear");
  background(0);
  Screenshot();
}
