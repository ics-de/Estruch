void LoadImageList() {
  imageList = new StringList();

  imageList.append("A.png");
  imageList.append("B.jpg");
  imageList.append("C.jpg");
  imageList.append("D.jpg");
}

void PreloadImatge(){
  image = loadImage(imageList.get(0));
}

void SetImatge(int currImg)
{
  if (imageList.get(currentImage) != null)
  {
    currentImage = currImg;
    image = loadImage(imageList.get(currentImage));
    println("set image to " + imageList.get(currentImage));
    drawMode = 2;
  }
}
