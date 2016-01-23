class JackThree {
  int pX;   // 58/2=29
  int pY;   // 147/2=73
  int hp;
  PImage jackThree;
  int speed=3;

  JackThree(int x, int y) {
    this.pX=x;
    this.pY=y;
    this.hp=100;
    this.jackThree = loadImage("img3/jack.png");
  }
  void draw() {
    image(jackThree, pX-25, pY-40+(int)bg.giantY);
    image(level2.shiny,320-62,1200-160+(int)bg.giantY);
    image(level2.shiny,320-60,1200-160+(int)bg.giantY);
    image(level2.shiny,320-58,1200-160+(int)bg.giantY);
    keyMove();
    if ((pY<(-bg.giantY+50)) || isHit(crow.x, crow.y, 71-30, 88-40, pX-25, pY-50+(int)bg.giantY, 
      jackThree.width, jackThree.height)) {
      state=GameState.LOSEthree;
    }
    if(pY+260>1200 || -bg.giantY>1200-260){  
    state=GameState.END;
    }
  }

  void keyMove() {
    if (isMovingLeft) {
      //this.move(Direction.LEFT);
      moveTo( pX-speed, pY );
      //musicRustle3.play();      
    }
    if (isMovingRight) {
      //this.move(Direction.RIGHT);
      moveTo( pX+speed, pY ); 
      //musicRustle3.play();         
    }
    if (isMovingUp) {
      moveTo( pX, pY-speed );  
      //musicRustle3.play();         
    }
    if (isMovingDown) {
      if (pY+50<height-bg.giantY){
      moveTo( pX, pY+speed );  
      }
      //musicRustle3.play();         
    }
  }

  void moveTo ( int x, int y ) {

    color c = bg.thirdblack.get( x, y );
    float bright = brightness( c );

    if ( bright < 50 && bright>=0 )
    {
      this.pX = x;
      this.pY = y;
    }
  }
  //////CODE END PLACE
}