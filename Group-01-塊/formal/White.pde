class White{
PImage white;
int whitetint;
  
White(){
 white=loadImage("fivewin/white.png");
 whitetint=0;   
}
void draw(){
    whitetint+=51;
    tint(whitetint,255);
    image(white,0,0);
   
    }  

 void reset(){
   whitetint=0;

 }
}