class HPDisplay {
  PImage hpUI;

  HPDisplay () {
    this.hpUI = loadImage("img/hp.png");
  }

  void updateWithFighterHP(int hp)
  {
    fill (23, 214, 23) ;
    rect(15, 3, hp * 2, 20 ) ;
    image(hpUI, 10, 0);
  }
}