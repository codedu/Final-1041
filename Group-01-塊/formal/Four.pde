class Four{
  int x;
  int y;
  PImage img ;
 
  
  Four(){
    img = loadImage("fo1.png") ;
    x=width/2;
    y=35;
  }
  
  void display(){  
    imageMode(CENTER);
    image(img,x,y);
  }
  
  
}