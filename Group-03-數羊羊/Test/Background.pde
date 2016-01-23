class Background{
  PImage bg1,bg2;
  float x1,x2;
  float y1,y2;
  float speedX;
  
  //level 1 & level 3
  Background(String filename1,String filename2){
    bg1=loadImage(filename1);
    bg2=loadImage(filename2);
    x2=0;
    y2=0;
    x1=640;
    y1=0;
    speedX=3;
  }
  void display(){
    image(bg1,x1,y1);
    image(bg2,x2,y2);
    x1-= speedX;
    x2-= speedX;
    if(x1<-640){
      x1=640;
      x1-= speedX;
    }
    if(x2<-640){
      x2=640;
      x2-= speedX;
    }
  }
}