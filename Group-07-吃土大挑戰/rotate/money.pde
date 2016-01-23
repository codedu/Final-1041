class Money{
PImage moneyImg;
float a;
AudioPlayer moneySFX;

Money(){
moneyImg=loadImage("img/money.png");
moneySFX = minim.loadFile("audio/money.wav");
}


void draw(){
 pushMatrix();
translate(320, 900);
rotate(radians(a));
imageMode(CORNER);
image(moneyImg,700,0-moneyImg.height/2);
a-=2;
popMatrix();
 }
 
     boolean isCollideWithPlayer(){
    if(-98<this.a && this.a<-90){
    if(player.y+320-player.playerImg1.width/2 <= 200+this.moneyImg.width){
      return true;
    }else return false;
    } return false;
  }
 
}