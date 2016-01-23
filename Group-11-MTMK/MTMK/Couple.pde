class Couple{

  int x,y;
  float speed;
  PImage img;
  boolean isDragged;
  boolean isPut;
  float throwingspeed;
  boolean fly=false;

  
  Couple(String filename){
    speed=random(0,4);
    x=floor(random(400,640));
    y=floor(random(320,400));
    img = loadImage(filename);
    isDragged=false;
    isPut=false;
    fly=false;
  
    throwingspeed = 0.05;
    
  }
 
  void move(){
    x-=speed;
    if(x+img.width<=0){
    x=640;    
    }
  }
  void display(){
    image(img,x,y);
  }
  void put(){
  if(isDragged == false && x+img.width>550 && x<608 && y<307 && y+img.height>240){
  isPut=true;
  }
  }
  
}