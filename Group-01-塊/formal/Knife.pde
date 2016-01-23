class Knife{
float x;
float y;
PImage img;
int timer;
boolean kt;
int xSpeed;
int ySpeed;
boolean isSetDirection = false;

Knife(){
  x=width/2;
  y=35;
  img=loadImage("knife.png");
}

void setDirection(int xSpeed,int ySpeed)
{
  this.xSpeed = xSpeed;
  this.ySpeed = ySpeed;
  isSetDirection = true;
}
  
void display(){
   image(img,x,y); 
  }


void moveForward(){
  this.x+= xSpeed;
  this.y+= ySpeed;
  }  

void  border(){
  
  
   if( knife.y>600){
       knife.x=width/2;
       knife.y=40;
       isSetDirection = false;
       knifeIsPlaying=false;
    }
    if(knife.x<120 || knife.x>520){
      
      knife.y=601;
      isSetDirection = false;
      knifeIsPlaying=false;
    }
    
    if(knife.x<308){
     knife.y=601; 
     isSetDirection = false;
     knifeIsPlaying=false;
    }
    if(knife.x>360 && knife.y>240){
     knife.y=601;   
     isSetDirection = false;
     knifeIsPlaying=false;
    }
    if(knife.x>400 && knife.y>240 ){
     knife.y=601;  
     isSetDirection = false;
     knifeIsPlaying=false;
    }
    if(knife.x>375 && knife.y>105 && knife.y<140){
     knife.y=601;  
     isSetDirection = false;
     knifeIsPlaying=false;
    }
   if(knife.x>470 && knife.y>300){
     knife.y=601;  
     isSetDirection = false;
     knifeIsPlaying=false;
    }
  
  }
}