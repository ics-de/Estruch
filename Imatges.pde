void LoadImageList() {
  imageList = new StringList();

  imageList.append("A.png");
  imageList.append("B.jpg");
  imageList.append("C.jpg");
  imageList.append("D.jpg");
  /*
  imageList.append("E.jpg");
  imageList.append("F.jpg");
  imageList.append("G.jpg");
  imageList.append("H.jpg");
  */
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
    SetDrawMode(2);
  }
}
