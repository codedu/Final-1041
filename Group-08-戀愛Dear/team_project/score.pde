class Score {
  PImage haogandoImg, heart;
  int textX = 200, textY = 10;
  int img = 0;
  int value = 1;
  int time;
  int [] gameWin = {0, 0, 0, 0};

  Score() {
    haogandoImg = loadImage("img/通用文字、按鈕/heart_text.png");
    heart = loadImage("img/素材包/heart1.png");
  }

  void draw() {
    image(haogandoImg, textX, textY);

    if (isWin1==true) {
      gameWin[0] = 1;
    } else {
      gameWin[0] = 0;
    }
    if (isStop_2 && mad==0) {
      gameWin[1] = 1;
    } else {
      gameWin[1] = 0;
    }
    if (gee.y>=420) {
      gameWin[2] = 1;
    } else {
      gameWin[2] = 0;
    }
    if (isWin4==true) {
      gameWin[3] = 1;
    } else {
      gameWin[3] = 0;
    }

    value = 1+gameWin[0]+gameWin[1]+gameWin[2]+gameWin[3];

    for (int a=0; a<value; a++) {
      image(heart, textX+110+35*a, textY+12);
    }
  }
}