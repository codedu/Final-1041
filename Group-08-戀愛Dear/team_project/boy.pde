class Boy {
  PImage boyImg;
  PImage win, lose, play, play_stop;
  PImage [] s2 = new PImage[9];
  int x = 0;
  int y = 0;
  int speed = 5;

  Boy() {
    boyImg = loadImage("img/開頭/boy.png");
    win = loadImage("img/stage 1/bfLetter2.png");
    lose = loadImage("img/stage 1/bfLetter3.png");
    play = loadImage("img/stage 1/bfLetter1.png");
    play_stop = loadImage("img/stage 1/bfLetter4.png");
    for (int a=0; a<9; a++) {
      s2[a] = loadImage("img/stage 2/bfBurp"+(a+1)+".PNG");
    }
  }

  void draw() {
    if (state==GameState.STAGE_1) {
      if (!line.isEnd) {
        if (!mailClick)
          image(play, mouseX-25, 120);
        else
          image(play_stop, mail[line.choice-1].x-10, 120);
      } else {
        if (line.choice==3) 
          image(win, mail[line.choice-1].x-10, 120);
        else
          image(lose, mail[line.choice-1].x-10, 120);
      }
    }

    if (isMovingUp) {
      this.move(Direction.UP);
    }
    if (isMovingDown) {
      this.move(Direction.DOWN);
    }
    if (isMovingLeft) {
      this.move(Direction.LEFT);
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);
    }
  }

  void move(int direct) {
    switch (direct) {
    case Direction.UP:
      if (this.y - speed > 0) {
        this.y-= speed;
      }
      break;
    case Direction.DOWN:
      if (this.y + speed < height - this.boyImg.height) {
        this.y+= speed;
      }
      break;
    case Direction.LEFT:
      if (this.x - speed > 0) {
        this.x-= speed;
      }
      break;
    case Direction.RIGHT:
      if (this.x + speed < width - this.boyImg.width) {
        this.x+= speed;
      }
      break;
    }
  }
}