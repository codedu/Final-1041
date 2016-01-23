class Enemy{
  PImage enemyImg;
  float a;
  AudioPlayer enemySFX;
  
  Enemy(int number){
  enemyImg = loadImage("img/enemy"+number+".png");
  enemySFX = minim.loadFile("audio/enemy.wav");
  }
  
  void draw(){
    pushMatrix();
    translate(320, 900);
    rotate(radians(a));
    imageMode(CORNER);
    image(enemyImg,510, 0-enemyImg.height/2);
    a-=2;
    popMatrix();
  }
  
  boolean isCollideWithPlayer(){
    if(-100<this.a && this.a<-90){
    if(player.y+320+player.playerImg1.width/2 >= 320+player.playerImg1.width/2-this.enemyImg.width){
      return true;
    }else return false;
    } return false;
  }
   
}