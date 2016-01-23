class Bossenemy{
  PImage principal, jumpshoes;
  float a;
  AudioPlayer shoeSFX, bossSFX;
  boolean hit;
  
Bossenemy(){
principal = loadImage("img/principal.png");
jumpshoes = loadImage("img/jumpshoes.png");
shoeSFX = minim.loadFile("audio/shoe.wav");
bossSFX = minim.loadFile("audio/boss.wav");

}
  void draw(){
    a-=1;
    if(jumpshoes!=null){
    pushMatrix();
    translate(320, 900);
    rotate(radians(a));
    imageMode(CORNER);
    image(jumpshoes,700, 0-jumpshoes.height/2);
    popMatrix();}
    
    pushMatrix();
    translate(320, 900);
    rotate(radians(a+45));//principal will exist after jumpshoes
    imageMode(CORNER);
    image(principal,510, 0-principal.height/2);
    popMatrix();
  }
  
    boolean treasureIsCollideWithPlayer(){
      if(jumpshoes!=null){
    if(-100<this.a && this.a<-90){
    if(player.y+320-player.playerImg1.width/2 <= 200+this.jumpshoes.width){
      return true;
    }else return false;
    } return false;
  }return false;}
  
  boolean enemyIsCollideWithPlayer(){
    if(-145<this.a && this.a<-140){
    if(player.y+320+player.playerImg1.width/2 >= 320+player.playerImg1.width/2-this.principal.width){
      return true;
    }else return false;
    } return false;
  }
   
}