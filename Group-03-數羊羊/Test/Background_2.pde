class Background_2{
  PImage bg1,bg2,grass1,grass2;
  float x1,x2;
  float y1,y2;
  float grassX_1,grassY_1,grassX_2,grassY_2;
  float speedX,speedY;
  
    //level 2
 Background_2(){
    bg1=loadImage("bg2_1.png");
    bg2=loadImage("bg2_2.png");
    grass1=loadImage("grass1.png");
    grass2=loadImage("grass2.png");
    x2=0;
    y2=-480;
    x1=640;
    y1=-480;
    grassX_1=0;
    grassY_1=400;
    grassX_2=640;
    grassY_2=400;
    speedX=3;
    speedY=1;
  }
  void display(){
    image(bg1,x1,y1);
    image(bg2,x2,y2);
    image(grass1,grassX_1,grassY_1);
    image(grass2,grassX_2,grassY_2);
    x1-= speedX;
    x2-= speedX;
    grassX_1-=speedX;
    grassX_2-=speedX;
    y1+= speedY;
    y2+= speedY;
    
    if(x1<-640){
      x1=640;
      x1-= speedX;
    }
    if(x2<-640){
      x2=640;
      x2-= speedX;
    }
    if(grassX_1<-640){
      grassX_1=640;
      grassX_1-= speedX;
    }
    if(grassX_2<-640){
      grassX_2=640;
      grassX_2-= speedX;
    }
    
    if(y1>=0 || y2>=0){
      speedY=0;
    }
  }
}