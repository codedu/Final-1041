class Medicine{
  int x, y;
  PImage medImg;
  int hp=-150;
  int speeddown=0;
  Medicine(int mX, int mY){
   medImg=loadImage("bg/med2.png");
   this.x=mX;
   this.y=mY;
 }
 
void draw(){
  image(medImg,this.x,this.y);
  if(isHit(five.x,five.y,32,45,this.x,this.y,27,30)){
    five.hpDecrease(hp);
    five.Slow(speeddown);
    this.x=1000;
  }
  
}
}