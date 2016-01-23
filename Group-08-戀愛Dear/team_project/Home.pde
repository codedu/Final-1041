class Home {

  int t, T, i, x;
  PImage interrupt1, interrupt2, talk1, talk2, like, wash, bubble1;
  int scene;
  int numFrame=2;
  int numFrame2= 2;
  PImage [] images= new PImage[numFrame];
  PImage [] interrupt = new PImage[numFrame2];
  int currentFrame, currentFrameB;
  final int TALKING=0;
  final int SAYLIKE=1;
  final int FAIL=2;

  //initialization

  Home() {

    T = 0;
    scene=TALKING;
    currentFrame=0;//talk 
    for (int i = 0; i <2; i++) {
      images[i]=loadImage("img/stage 4/Home/IMG_63"+(i+18)+".PNG");
    }


    bubble1=loadImage("img/stage 4/Seaside/talk/seaside_bubble.png");
    like=  loadImage("img/stage 4/Home/talk/home_bubble1.png");
    wash=  loadImage("img/stage 4/Home/talk/home_bubble2.png");

    currentFrameB=0;// interrupt
    for (int x = 0; x < 2; x ++) {
      interrupt[x]=loadImage("img/stage 4/Home/"+"IMG_63"+(x+20)+".PNG");
    }
    // frameRate(2);
  }


  void display() {
    t = T/30;
    //println(t);
    switch(scene) {
    case TALKING:

      //talk keep talking all the time
      if (T%30==0) {
        i =floor( (currentFrame++)%numFrame);
      }
      image(images[i], 0, 0);

      if (t>5) {
        nextTime.display();
        proposal.display();
      }
      break;

    case SAYLIKE://SHOW LIKE AND SHOW END
      if (T%30==0)
        i =floor( (currentFrame++)%numFrame);
      image(images[i], 0, 0);

      if (t>3 && t<=8) {
        image(like, 0, 0);
      } else if (t>8 && t<=15) {

        //show dad come out
        background(255);
        if (T%30==0) 
          x = (currentFrameB++)%numFrame2;

        image(interrupt[x], 0, 0);
      } else if (t>15) {
        image(wash, 0, 0);
        if (t>20) {
          textSize(15);
          fill(255, 0, 0);
          textAlign(CENTER);
          text("press enter to the next stage", 250, 80);
          isStop_4 = true;
        }//show end pic
      }

      break;
      //case FAIL:

      //  break;
    }
    T++;
  }
}