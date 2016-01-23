
class RedLight{
int tintR;
PImage red;

RedLight(){
    red=loadImage("fivewin/red.png");  
    tintR=0;
}

void draw(){
   // background(0);
  //  tintR=0;
    tintR+=51;
    tint(tintR,255);
    image(red,0,0);
   if(tintR>=255){
       tintR=255;  
      }
    }
void reset(){
   tintR=0;
}
             
}