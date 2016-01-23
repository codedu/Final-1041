class Black{
int tintB=255;
PImage black;

Black(){
    black=loadImage("fivewin/black.png");  
}

void draw(){
    tintB-=51;
    tint(tintB,255);
    image(black,0,0);
    if(tintB<=0){
       tintB=0;  
      } 
    }
    
}