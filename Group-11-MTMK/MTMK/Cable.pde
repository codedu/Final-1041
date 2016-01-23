class Cable{
PImage cablebg;
PImage cable;
float cableX,cableY;
float cableAddWidth,cableAddHeight;

  Cable(){
  cablebg  = loadImage("cable/cablebg.png");
  cable = loadImage("cable/cable.png");
  cableX = -100;
  cableY = 415;
  cableAddWidth = 16.3;
  cableAddHeight = 28.2;
  }

  void display(){
  imageMode(CENTER);
  image(cablebg,320,240);
  image(cable,cableX,cableY,163-50+cableAddWidth,282-86.5+cableAddHeight);

  }
  
  void move(){
  cableX+=3.3;
  cableY--; 
  
  cableAddWidth+=0.4075;
  cableAddHeight+=0.705;
  }
}