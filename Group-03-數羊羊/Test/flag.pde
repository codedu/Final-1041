class Flag{
  PImage flag;
  float x,y;
  
  Flag(){
    flag = loadImage("flag.png");
    x= 10000;
    y= 220;
  }
  void display(){
    image(flag,x,y);
    x-=3;
  }
}