class Treasure{
  PImage treasureImg;
  float a;
  AudioPlayer starSFX;
  float x=1000;
  
  Treasure(){
  treasureImg=loadImage("img/superstar.png");
  starSFX = minim.loadFile("audio/protect.wav");
  }
  
  void draw(){
   pushMatrix();
translate(320, 900);
rotate(radians(a));
imageMode(CORNER);
image(treasureImg,x,0-treasureImg.height/2);
a-=3;
popMatrix();
  }
  
     boolean isCollideWithPlayer(){
    if(-100<this.a && this.a<-90){
    if(player.y+320-player.playerImg1.width/2 <= 135+this.treasureImg.width){
      return true;
    }else return false;
    } return false;
  }

}