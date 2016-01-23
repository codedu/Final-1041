class Box_Poison extends Box{
  Box_Poison(float x, float y, int life, int boxWidth, int boxHeight){
    super(x,y,1,50,50);
    super.boxImg=loadImage("img/1_poison.png");
  }
  void Fuction(){
  if (isHit(this.x, this.y, this.boxWidth, this.boxHeight, fighter.x-25, fighter.y-25, 51, 51)==true) {
      fighter.hp-=30;
    }
  }
  void MusicPlay(){poisonMusic.trigger();}
}