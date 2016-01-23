class Mailgirl {
  PImage win, lose, play;
  int x = 35;
  int y = 410;
  int speed = 5;

  Mailgirl() {
    win = loadImage("img/stage 1/gfLetter2.png");
    lose = loadImage("img/stage 1/gfLetter3.png");
    play = loadImage("img/stage 1/gfLetter1.png");
  }

  void draw() {
    if (!line.isEnd)
      image(play, this.x, this.y);
    else if (line.isEnd) {
      if (line.choice==3) {
        image(win, this.x, this.y);
        isWin1 = true;
      } else
        image(lose, this.x, this.y);
    }
  }
}

class Line {
  int lineY = 0;
  int choice = 0;
  boolean isEnd = false;
  PImage mail;

  Line() {
    mail = loadImage("img/stage 1/letter.png");
  }

  void draw() {
    stroke(0);
    strokeWeight(5);
    /* ||||| */
    line(100, 230-lineY, 100, 730-lineY);
    line(175, 230-lineY, 175, 730-lineY);
    line(250, 230-lineY, 250, 730-lineY);
    line(325, 230-lineY, 325, 730-lineY);
    line(400, 230-lineY, 400, 730-lineY);
    /* ----- */
    line(100, 260-lineY, 175, 260-lineY);
    line(100, 620-lineY, 175, 620-lineY);
    line(175, 390-lineY, 250, 390-lineY);
    line(175, 550-lineY, 250, 550-lineY);
    line(250, 330-lineY, 325, 330-lineY);
    line(250, 460-lineY, 325, 460-lineY);
    line(250, 700-lineY, 325, 700-lineY);
    line(325, 310-lineY, 400, 310-lineY);
    line(325, 630-lineY, 400, 630-lineY);
    line(325, 670-lineY, 400, 670-lineY);
    fill(255);
    stroke(255);
    rect(0, 0, 500, 220);
  }

  void redLine() {
    stroke(255, 25, 0);
    if (choice==1) {  
      line(100, 230-lineY, 100, 260-lineY);
      line(100, 260-lineY, 175, 260-lineY);
      line(175, 260-lineY, 175, 390-lineY);
      line(175, 390-lineY, 250, 390-lineY);
      line(250, 390-lineY, 250, 460-lineY);
      line(250, 460-lineY, 325, 460-lineY);
      line(325, 460-lineY, 325, 630-lineY);
      line(325, 630-lineY, 400, 630-lineY);
      line(400, 630-lineY, 400, 670-lineY);
      line(325, 670-lineY, 400, 670-lineY);
      line(325, 670-lineY, 325, 700-lineY);
      line(250, 700-lineY, 325, 700-lineY);
      line(250, 700-lineY, 250, 730-lineY);
      image(mail, 250-15, 730-lineY);
    } else if (choice==2) {
      line(175, 230-lineY, 175, 260-lineY);
      line(100, 260-lineY, 175, 260-lineY);
      line(100, 260-lineY, 100, 620-lineY);
      line(100, 620-lineY, 175, 620-lineY);
      line(175, 620-lineY, 175, 730-lineY);
      image(mail, 175-15, 730-lineY);
    } else if (choice==3) {
      line(250, 230-lineY, 250, 330-lineY);
      line(250, 330-lineY, 325, 330-lineY);
      line(325, 330-lineY, 325, 460-lineY);
      line(250, 460-lineY, 325, 460-lineY);
      line(250, 460-lineY, 250, 550-lineY);
      line(175, 550-lineY, 250, 550-lineY);
      line(175, 550-lineY, 175, 620-lineY);
      line(100, 620-lineY, 175, 620-lineY);
      line(100, 620-lineY, 100, 730-lineY);
      image(mail, 100-15, 730-lineY);
    } else if (choice==4) {
      line(325, 230-lineY, 325, 310-lineY);
      line(325, 310-lineY, 400, 310-lineY);
      line(400, 310-lineY, 400, 630-lineY);
      line(325, 630-lineY, 400, 630-lineY);
      line(325, 630-lineY, 325, 670-lineY);
      line(325, 670-lineY, 400, 670-lineY);
      line(400, 670-lineY, 400, 730-lineY);
      image(mail, 400-15, 730-lineY);
    } else if (choice==5) {
      line(400, 230-lineY, 400, 310-lineY);
      line(325, 310-lineY, 400, 310-lineY);
      line(325, 310-lineY, 325, 330-lineY);
      line(250, 330-lineY, 325, 330-lineY);
      line(250, 330-lineY, 250, 390-lineY);
      line(175, 390-lineY, 250, 390-lineY);
      line(175, 390-lineY, 175, 550-lineY);
      line(175, 550-lineY, 250, 550-lineY);
      line(250, 550-lineY, 250, 700-lineY);
      line(250, 700-lineY, 325, 700-lineY);
      line(325, 700-lineY, 325, 730-lineY);
      image(mail, 325-15, 730-lineY);
    }
    fill(255);
    stroke(255);
    rect(0, 0, 500, 220);
    image(s1, 0, 0);
    if (line.isEnd) {
      textSize(15);
      fill(255, 0, 0);
      text("press enter to the next stage", 250, 80);
    }
  }

  void move() {
    if (lineY<260)
      lineY += 1;
    else if (lineY==260)
      isEnd = true;
  }
}