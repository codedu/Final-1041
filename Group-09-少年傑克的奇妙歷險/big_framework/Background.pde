class Background {
  int playingBgY;
  int bgMax;
  int count;
  float giantY=0;

  PImage start1;
  PImage start2;
  PImage intro1;
  PImage intro2;

  PImage background;
  PImage castle1;
  PImage castle2;
  PImage lose1;
  PImage lose2;

  PImage introThree1;
  PImage introThree2;
  PImage third;
  PImage thirdblack;
  PImage foot;
  PImage loseThree1;
  PImage loseThree2;

  PImage win1;
  PImage win2;

  boolean canPlay;
  Background() {

    this.start1 = loadImage("img/start1.jpg");
    this.start2 = loadImage("img/start2.jpg");
    this.intro1 = loadImage("img/intro1.jpg");
    this.intro2 = loadImage("img/intro2.jpg");
    this.lose1 = loadImage("img/lose1.jpg");
    this.lose2 = loadImage("img/lose2.jpg");

    this.background = loadImage("img/background.jpg");
    this.castle1 = loadImage("img/castle1.jpg");
    this.castle2 = loadImage("img/castle1.jpg");

    this.introThree1= loadImage("img3/intro1.jpg");
    this.introThree2= loadImage("img3/intro2.jpg");
    this.third= loadImage("img3/third.jpg");
    this.thirdblack= loadImage("img3/thirdblack.jpg");
    this.foot= loadImage("img3/foot.png");

    this.win1= loadImage("img3/win1.jpg");
    this.win2= loadImage("img3/win2.jpg");
    this.loseThree1= loadImage("img3/lose1.jpg");
    this.loseThree2= loadImage("img3/lose2.jpg");

    this.playingBgY = -background.height/2;
    this.bgMax = playingBgY;
    this.canPlay = false;
  }


  void draw() {
    if (state == GameState.START) {
      if (second() % 2 == 1 ) {
        image(start1, 0, 0);
      } else {
        image(start2, 0, 0);
      }
    } else if  (state == GameState.PLAYINGone) {
      image(background, 0, playingBgY);
    }
    if (state == GameState.LOSEone) {
      if (second() % 2 == 1 ) {
        image(lose1, 0, 0);
      } else {
        image(lose2, 0, 0);
      }
    }
    if (state == GameState.PLAYINGthree) {
      if (canPlay==false) {
        if (second() % 2 == 1 ) { 
          image(introThree1, 0, 0);
        } else {
          image(introThree2, 0, 0);
        }
      } else {
        image(third, 0, 0+(int)giantY);
        image(foot, 320-40, 0);
        //if ( mousePressed ) {
        //image( thirdblack, 0 , 0+(int)giantY );
        //}
      }
    }
    if (state == GameState.LOSEthree) {
      if (musicLevel3.isPlaying()) {
        musicLevel3.pause();
        musicLoseAll.play(0);
      }
      if (second() % 2 == 1 ) {
        image(loseThree1, 0, 0);
      } else {
        image(loseThree2, 0, 0);
      }/*
      if ( mousePressed ) {
       
       canPlay=false;
       giantY=0;
       crow.changeXY();
       jackThree.pX=320;
       jackThree.pY=80;
       state = GameState.PLAYINGthree;
       }*/
    }
    if (state == GameState.END) {
      if (musicLevel3.isPlaying()) {
        musicLevel3.pause();
        musicFinalWin3.play(0);
      }
      if (second() % 2 == 1 ) {
        image(win1, 0, 0);
      } else {
        image(win2, 0, 0);
      }
    }
  }

  void drawCastle() { 
    if (second() % 2 == 1 ) {
      image(castle1, 0, 0);
    } else {
      image(castle2, 0, 0);
    }
  }

  void drawIntro() {
    if (second() % 2 == 1 ) {
      image(intro1, 0, 0);
    } else {
      image(intro2, 0, 0);
    }
  }

  void move() {
    if  (state == GameState.PLAYINGone) {
      if (playingBgY<bgMax) {
        playingBgY+=dropbean.speed;
      }
    }
    if  (state == GameState.PLAYINGthree) {
      giantY-=0.5f;
    }
  }
  //////CODE END PLACE
}