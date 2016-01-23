class Sea {
  int t, T, a;
  PImage propose1, propose2, sit1, sit2, talk1;
  final int PROPOSE=1, SIT=0, SUCCESS=2;
  int currentSit, currentP, currentS;
  PImage [] sit = new PImage [2] ;
  PImage [] propose = new PImage [2] ;
  PImage [] success = new PImage [5] ;
  int stageProposal;
  Sea() {
    T = 0;
    //propose
    for (int b = 0; b < 2; b ++) {
      propose[b]=loadImage("img/stage 4/Seaside/propose"+(b+1)+".PNG");
    }

    //success

    for (int s = 0; s < 4; s ++) {
      success[s]=loadImage("img/stage 4/Seaside/success"+(s+1)+".PNG");
    }

    //propose1=loadImage("img/stage 4/Seaside/propose1.PNG");
    //propose2=loadImage("img/stage 4/Seaside/propose2.PNG");

    //success1=loadImage("img/stage 4/Seaside/success1.PNG");
    //success2=loadImage("img/stage 4/Seaside/success2.PNG");
    //success3=loadImage("img/stage 4/Seaside/success3.PNG");
    //success4=loadImage("img/stage 4/Seaside/success4.PNG");
    talk1=loadImage("img/stage 4/Seaside/talk/seaside_bubble.png");

    for (int a = 0; a < 2; a ++) {
      sit[a]=loadImage("img/stage 4/Seaside/sit"+(a+1)+".PNG");
    }
    //frameRate(2);
  }

  void display() {
    t = T/30;
    switch(stageProposal) {

    case SIT:
      if (T%30==0) 
        a = floor((currentSit++)%2);

      image(sit[a], 0, 0);

      if (t>5) {
        nextTime.display();
        proposal.display();
      }
      break;

    case PROPOSE:
      background(255);
      if (T%30==0)
        a = floor((currentP++)%2);
      image(propose[a], 0, 0);

      if (t>5) {
        image(talk1, 0, 0);
        if (t>15) {
          stageProposal=SUCCESS;
          T = 0;
        }
      }



      break;

    case SUCCESS:
      background(255);


      isWin4 = true;
      if (t<10) {
        if (T%30==0)
          a = floor((currentP++)%2);
        image(success[a], 0, 0);
      } else if (t>=10) {
        if (T%30==0)
          a = floor((currentP++)%2);
        image(success[a+2], 0, 0);
        if (t>=15) {
          textSize(15);
          fill(255, 0, 0);
          textAlign(CENTER);
          text("press enter to the next stage", 250, 80);
          isStop_4 = true;
          //show end pic
        }
      }
      break;
    }
    T++;
  }
}