class Meat
{
  float x,y,gDegree;
  PImage meatRaw,meatOK1,meatOK2,meatOut1,meatOut2;
  Meat()
  {
    gDegree = 0;
    meatRaw = loadImage("img/meat01.png");
    meatOK1 = loadImage("img/meat02_1.png");
    meatOK2 = loadImage("img/meat02_2.png");
    meatOut1 = loadImage("img/meat03_1.png");
    meatOut2 = loadImage("img/meat03_2.png");
  }
  
  void show(PImage imgName)
  {
    image(imgName, x, y, 97, 138);
  }
  
  void showOK(PImage imgName)
  {
    image(imgName, x-5, y-81, 104, 222);
  }
  

}