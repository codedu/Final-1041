class Crow {
  PImage crowimage;
  int x,y;
  int speed;
  
  Crow(){
    this.speed=3;
    this.y=floor(random(40,480-90-240-120));
    crowimage=loadImage("img3/black-crow-hi.png");
  }
  void draw(){    
    image(crowimage,x,y);
  }
  void move(){ 
    this.x+=speed;
  }
  void changeXY(){
      this.x=-71;
      this.y=floor(random(40,480-80));
  }
}