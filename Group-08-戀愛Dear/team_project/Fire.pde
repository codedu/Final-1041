class Fire {
  int t, T, a;
  int [] c = new int [9];
  float [] x = new float [9];
  float [] y = new float [9];
  int fireworksNum=9;
  int currentSit, currentPro, currentFire;
  int sceneFire;
  final int SIT=0, PROPOSING=1, FIREWORK=2, AGAIN=3;
  PImage shock1, shock2, shock3, sitting1, sitting2;
  PImage bub1, bub2, bub3, bub4;
  PImage [] fireworks = new PImage[fireworksNum];
  PImage [] sit = new PImage[2];
  PImage [] prop = new PImage[2];

  Fire() {
    T = 0;
    bub1=loadImage("img/stage 4/Fireworks/talk/fireworks_bubble1.png");
    bub2=loadImage("img/stage 4/Fireworks/talk/fireworks_bubble2.png");
    bub3=loadImage("img/stage 4/Fireworks/talk/fireworks_bubble3.png");
    bub4=loadImage("img/stage 4/Fireworks/talk/fireworks_bubble4.png");
    prop[0]=loadImage("img/stage 4/Fireworks/proposal1.PNG");
    prop[1]=loadImage("img/stage 4/Fireworks/proposal2.PNG");
    shock1=loadImage("img/stage 4/Fireworks/shock1.PNG");
    shock2=loadImage("img/stage 4/Fireworks/shock2.PNG");
    shock3=loadImage("img/stage 4/Fireworks/shock3.PNG");
    currentSit=0;
    currentFire=0;
    for (int a = 0; a < 2; a ++) {
      sit[a]=loadImage("img/stage 4/Fireworks/sitting"+(a+1)+".PNG");
    }

    for (int i = 0; i < 9; i++) {
      fireworks[i]=loadImage("img/stage 4/Fireworks/fireworks pictures/fireworks "+(i+1)+".png");
    }
    // frameRate(2);
  }


  void display() {
    t = T/30;
    //println(t);
    switch(sceneFire) {
    case SIT://show sitting1,2,;show button;to choose from

      if (T%30==0) 
        a =floor( (currentSit++)%2);

      image(sit[a], 0, 0);

      if (t>5) {
        nextTime.display();
        proposal.display();
      }

      break;

    case PROPOSING://show like,and switch to fireworks

      if (T%30==0)
        a =floor( (currentSit++)%2);
      image(prop[a], 0, 0);
      if (t>5 && t<=11) {
        image(bub1, 0, 0);
      } else if (t>11 && t<=15) {
        image(bub2, 0, 0);
      } else if (t>15 && t<=20) {
        image(bub3, 0, 0);
      } else if (t>20 && t<=23) {
        image(bub4, 0, 0);
      } else if (t>23) {
        sceneFire=FIREWORK;
        T = 0;
      }

      break;

    case FIREWORK://show fireworks;shock1,2,3,; show choice again
      if (t<=5) {
        image(shock1, 0, 0);
      } else if (t>5 && t<=15) {
        image(shock2, 0, 0);
      } else if (t>15) {
        image(shock3, 0, 0);
        textSize(15);
        fill(255, 0, 0);
        textAlign(CENTER);
        text("press enter to the next stage", 250, 80);
        isStop_4 = true;
      }
      // if (frameCount%2!=0) {


      for (int b=0; b<fireworksNum; b++) {
        if (T%25==0) {
          c[b] = floor(random(2));
          x[b] = random(-100, 500);
          y[b] = random(-50, 150);
        }
        if (c[b]==1)
          image(fireworks[b], x[b], y[b]);
      }

      break;
    }
    T++;
  }
}