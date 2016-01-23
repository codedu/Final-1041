class GameState
{
  static final int START = 0;
  static final int INTRO = 1;
  static final int NAME = 2;
  static final int STAGE_1 = 3;
  static final int STAGE_2 = 4;
  static final int STAGE_3 = 5;
  static final int STAGE_4 = 6;
  static final int END = 7;
}

class Direction
{
  static final int LEFT = 0;
  static final int RIGHT = 1;
  static final int UP = 2;
  static final int DOWN = 3;
}

/* 3 */
Car [] car = new Car[10];
int [] road=new int[100];
couple gee;
int c=1;
int wait=0, walk=0, win=0;
PImage imgboom;
PImage s3_text, s3;
PImage wait1, wait2, walk1, walk2, win1, win2;//couple
PImage cimg1, cimg2, cimg3, cimg4, cimg5, cimg6;
float peoplex, peopley;

/* 2 */
int numFrames=5;
int bnumFrames=4;
int currentFrame;
PImage [] images = new PImage[numFrames];
PImage [] bimages = new PImage[bnumFrames];
PImage s2, s2_text;
PImage burp, rude;
PImage girle1, girle2, girlm1, girlm2;
int i, x, count=0;
int mad=0, girle=0, girlm=0, bur=0;
boolean isStop_2 = false;

/* 4 */
Fire fire;
Sea sea;
Home home;
final int  S4_CHOOSE=0, S4_FIRE=1, S4_SEA=2, S4_HOME=3;
int s4_state = S4_CHOOSE;
PImage s4, s4_text;
Button nextTime, proposal, tryAgain, firework, seaside, gfhome;
boolean isStop_4 = false;
boolean isWin4 = false;

/* comment */
PImage one, two, three, four;

/* 1 */
PImage title_img, intro_img, name_img; //START
PImage s1, s1_text;
boolean isWin1 = false;
Mailgirl mailgirl;
Line line;
Button [] mail = new Button[5];


boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;
boolean mailClick = false;

int state = GameState.START, s = 0;

int timeWait = 3000;
int time;

Boy boy;
Score score;

String name = "", Girl = "Amy";
Button gameStart, intro;


void setup () {
  size(500, 500);
  boy = new Boy();
  mailgirl = new Mailgirl();
  score = new Score();
  line = new Line();
  title_img = loadImage("img/開頭/title.png");
  intro_img = loadImage("img/開頭/intro.png");
  name_img = loadImage("img/開頭/enter_name.png");
  s1 = loadImage("img/stage 1/stage1.png");
  s1_text = loadImage("img/stage 1/stage1_text.png");
  gameStart = new Button("img/開頭/start_button", 300, 380);
  intro = new Button("img/開頭/intro_button", 100, 380);
  for (int a=0; a<5; a++)
    mail[a] = new Button("img/stage 1/letter", 85+a*75, 220);

  one = loadImage("img/評語/comment_01.png");
  two = loadImage("img/評語/comment_2.png");
  three = loadImage("img/評語/comment_3.png");
  four = loadImage("img/評語/comment_45.png");

  frameRate(60);

  /* 2 */
  s2 = loadImage ("img/stage 2/stage2.png");
  s2_text = loadImage ("img/stage 2/stage2_text.png");
  burp = loadImage ("img/stage 2/burp.PNG");
  rude = loadImage ("img/stage 2/rude.PNG");
  girle1 = loadImage ("img/stage 2/gfEating1.PNG");
  girle2 = loadImage ("img/stage 2/gfEating2.PNG");
  girlm1 = loadImage ("img/stage 2/gfMad1.PNG");
  girlm2 = loadImage ("img/stage 2/gfMad2.PNG");
  currentFrame = 0;
  for (int i=0; i<numFrames; i++) {
    images[i] = loadImage("img/stage 2/bfBurp" + (i*2+1) + ".PNG");
  }
  for (int i=0; i<bnumFrames; i++) {
    bimages[i] = loadImage("img/stage 2/bfBurp" + (i*2+2) + ".PNG");
  }
  frameRate(60);

  /* 3 */
  s3_text = loadImage ("img/stage 3/stage3_text.png");
  s3 = loadImage ("img/stage 3/stage3.png");
  imgboom = loadImage ("img/stage 3/blood.png");
  wait1 = loadImage ("img/stage 3/waiting1.PNG");
  wait2 = loadImage ("img/stage 3/waiting2.PNG");
  win1 = loadImage ("img/stage 3/win1.PNG");
  win2 = loadImage ("img/stage 3/win2.PNG");
  walk1 = loadImage ("img/stage 3/walking1.PNG");
  walk2 = loadImage ("img/stage 3/walking2.PNG");
  cimg1 = loadImage("img/stage 3/car1.PNG");
  cimg2 = loadImage("img/stage 3/car2.PNG");
  cimg3 = loadImage("img/stage 3/car3.PNG");
  cimg4 = loadImage("img/stage 3/car4.PNG");
  cimg5 = loadImage("img/stage 3/car5.PNG");
  cimg6 = loadImage("img/stage 3/car6.PNG");
  car[0]=new Car(-20, 0, 1, cimg1, 560);
  car[1]=new Car(530, 0, -5, cimg2, -40);
  car[2]=new Car(530, 0, -3, cimg3, -40);
  car[3]=new Car(-20, 0, 2, cimg4, 550);
  car[4]=new Car(522, 0, -4, cimg5, -50);
  car[5]=new Car(-10, 0, 5, cimg6, 550);
  gee = new couple(width/2, 85);
  for (int i=0; i<6; i++) {
    road[i]=0;
  }

  /* 4 */
  fire = new Fire();
  home = new Home();
  sea= new Sea();
  s4=loadImage("img/stage 4/stage4.png");
  s4_text=loadImage("img/stage 4/stage4_text.png");
  nextTime = new Button("img/stage 4/button_nexttime", 150, 100);
  proposal = new Button("img/stage 4/button_proposal", 250, 100);
  tryAgain = new Button("img/通用文字、按鈕/button_tryagain", 150, 100);
  firework = new Button("img/stage 4/stage4_button1", width/4-50, height/2);
  seaside = new Button("img/stage 4/stage4_button2", width/2-50, height/2);
  gfhome = new Button("img/stage 4/stage4_button3", width*3/4-50, height/2);
}

void draw() {
  background(255);
  switch(state) {
  case GameState.START:
    image(title_img, 20, 70);
    gameStart.display();
    intro.display();
    break;

  case GameState.INTRO:
    image(intro_img, 70, 150);
    textSize(15);
    fill(255, 0, 0);
    textAlign(CENTER);
    text("press enter back to title", 250, 450);
    break;

  case GameState.NAME:
    image(name_img, 80, 80);
    if (name!=null) {
      textSize(50); 
      fill(0);
      textAlign(CENTER);
      text(name, 250, 182);
    }
    if (Girl!=null) {
      textSize(50); 
      fill(0);
      textAlign(CENTER);
      text(Girl, 250, 375);
    }
    break;

  case GameState.STAGE_1:
    if (millis()-time <= timeWait) {
      image(s1_text, 140, 190);
      textSize(25); 
      fill(0);
    } else {
      line.draw();
      line.redLine();
      if (!mailClick) {
        for (int a=0; a<5; a++)
          mail[a].display();
      }
      boy.draw();
      mailgirl.draw();
      score.draw();
      if (mailClick)
        line.move();
      break;
    }
    break;

  case GameState.STAGE_2:
    if (millis()-time <= timeWait) {
      image(s2_text, 80, 170);
      textSize(20); 
      fill(0);
    } else {
      if (!isStop_2) {
        image(s2, 0, 0);
        if (girle==0&& mad==0 ) {
          image(girle1, 300, 300);
          if (frameCount % 20 ==0) {
            girle++;
          }
        } else if (girle==1&& mad==0 ) {
          image(girle2, 300, 300);
          if (frameCount % 20 ==0 ) {
            girle--;
          }
        } else if (girlm==0 && mad==1 ) {
          image(girlm1, 300, 300);
          image(rude, 300, 250);
          if (frameCount % 20 ==0) {
            girlm++;
          }
        } else if (girlm==1&& mad==1 ) {
          image(girlm2, 300, 300);
          image(rude, 300, 250);
          if (frameCount % 20 ==0 ) {
            girlm--;
          }
        }

        if (frameCount % (30) == 0) {
          i = (currentFrame ++) % numFrames;
        } 
        if (bur==0||(bur==1&&i==4))
          image(images[i], 100, 300);
        else if (bur==1&&i==0)
          image(bimages[0], 100, 300);
        else if (bur==1&&i==1)
          image(bimages[1], 100, 300);
        else if (bur==1&&i==2)
          image(bimages[2], 100, 300);
        else if (bur==1&&i==3)
          image(bimages[3], 100, 300);
      } else {
        if (girle==0&& mad==0 ) {
          image(girle1, 300, 300);
        } else if (girle==0&& mad==0 ) {
          girle++;
        } else if (girle==1&& mad==0 ) {
          image(girle2, 300, 300);
        } else if (girle==1&& mad==0 ) {
          girle--;
        } else if (girlm==0 && mad==1 ) {
          image(girlm1, 300, 300);
          image(rude, 300, 250);
        } else if (girlm==0&& mad==1 ) {
          girlm++;
        } else if (girlm==1&& mad==1 ) {
          image(girlm2, 300, 300);
          image(rude, 300, 250);
        } else if (girlm==1&& mad==1 ) {
          girlm--;
        }


        if (bur==0||(bur==1&&i==4))
          image(images[i], 100, 300);
        else if (bur==1&&i==0)
          image(bimages[0], 100, 300);
        else if (bur==1&&i==1)
          image(bimages[1], 100, 300);
        else if (bur==1&&i==2)
          image(bimages[2], 100, 300);
        else if (bur==1&&i==3)
          image(bimages[3], 100, 300);

        if (frameCount % 30 !=0 && bur==1 && i!=0 ) {
          image(burp, 180, 300);
          mad=0;
        } else if (frameCount % 30 !=0 && bur==1 && i==0 )
        {
          image(burp, 180, 300);
          mad=1;
        } else {
          bur=0;
        }
        textSize(15);
        fill(255, 0, 0);
        textAlign(CENTER);
        text("press enter to the next stage", 250, 80);
        if (count>=10) {
          textSize(30);
          textAlign(CENTER);
          fill(0);
          text("So disgusting!! Hate!!", 250, 200);
          mad = 1;
        }
      }
    }
    score.draw();
    break;

  case GameState.STAGE_3:
    if (gee.x>=450)
    {
      gee.x=450;
    } else if (gee.x<=0)
    {
      gee.x=0;
    } else if (gee.y>=440)
    {
      gee.y=440;
    } else if (gee.y<=50)
    {
      gee.y=50;
    }
    if (millis()-time <= timeWait) {
      image(s3_text, 60, 190);
      textSize(20); 
      fill(0);
    } else {
      stroke(0);
      strokeWeight(5);
      line(0, 420, 500, 420);
      line(0, 148, 500, 148);

      image(s3, 0, 0);
      /*line(0, 70, 500, 70);
       line(0, 145, 500, 145);
       line(0, 220, 500, 220);
       line(0, 295, 500, 295);
       line(0, 370, 500, 370);*/

      if (gee.y==85 && wait==0) {
        image(wait1, gee.x, gee.y);
        if (frameCount % 30 ==0 ) {
          wait++;
        }
      } else if ( gee.y==85 && wait==1) {
        image(wait2, gee.x, gee.y);
        if (frameCount % 30 ==0) {
          wait--;
        }
      } else if ( gee.y<420  && walk==0) {
        image(walk1, gee.x, gee.y);
        if (frameCount % 20 ==0 ) {
          walk++;
        }
      } else if ( gee.y<420 && walk==1) {
        image(walk2, gee.x, gee.y);
        if (frameCount % 20 ==0) {
          walk--;
        }
      } else if ( gee.y>=420 && win==0) {
        image(win1, gee.x, gee.y);
        if (frameCount % 30 ==0) {
          win++;
        }
      } else if (gee.y>=420 && win==1) {
        image(win2, gee.x, gee.y);
        if (frameCount % 30 ==0 ) {
          win--;
        }
      }
      if (gee.y>=420) {
        textSize(15);
        fill(255, 0, 0);
        textAlign(CENTER);
        text("press enter to the next stage", 250, 80);
      }

      for (int i=0; i<6; i++)
      {
        if (car[i].running==0)
        {
          for (int a=0; a<4; a++)
          {
            if (road[a]==0) {
              car[i].y=150+a*70;
              car[i].road=a;
              road[a]=1;
              car[i].running=1;
              break;
            }
          }
        } else
        {
          car[i].display();
          car[i].moveForward();
        }
        if (car[i].x==car[i].finish)
        {
          car[i].reset();
          road[car[i].road]=0;
        }
        if (isHit(gee.x, gee.y, 50, 60, car[i].x, car[i].y, car[i].img.width, car[i].img.height)) {
          c=0;
          peoplex=gee.x; 
          peopley=gee.y;
          gee.reset();
        }

        if (frameCount % 30 !=0 && c==0) {
          image(imgboom, peoplex, peopley);
        } else {
          c++;
        }
      }
    }
    score.draw();
    break;

  case GameState.STAGE_4:
    if (millis()-time <= timeWait) {
      image(s4_text, 90, 160);
      textSize(20); 
      fill(0);
    } else {
      image(s4, 0, 0);
      switch(s4_state) {
      case S4_CHOOSE:
        firework.display();
        seaside.display();
        gfhome.display();
        break;
      case S4_FIRE:
        fire.display();
        break;
      case S4_SEA:
        sea.display();
        break;
      case S4_HOME:
        home.display();
        break;
      }
    }
    score.draw();
    break;

  case GameState.END:
    if (millis()-time <= 10000) {
      textSize(30);
      textAlign(CENTER);
      fill(0);
      text("Ni yee way ni der min zi", 250, 200);
      text("boo huay jai chu shen ler mi??", 250, 300);
    } else if (millis()-time <= 13000) {
      textSize(60); 
      fill(0);
      text(name+"!!!!!", 250, 250);
    } else {
      if (score.value==1)
        image(one, 0, 0);
      else if (score.value==2)
        image(two, 0, 0);
      else if (score.value==3)
        image(three, 0, 0);
      else if (score.value==4||score.value==5)
        image(four, 0, 0);
      //score.draw();
    }
    break;
  }
}

void keyPressed() {
  if (state == GameState.STAGE_3) {
    if (key == CODED ) {
      switch(keyCode) {
      case UP:
        gee.moveUp();
        break;
      case DOWN:
        gee.moveDown();
        break;
      case LEFT:
        gee.moveLeft();
        break;
      case RIGHT:
        gee.moveRight();
        break;
      }
    }
  }
  switch(keyCode) {
  case UP : 
    isMovingUp = true ;
    break ;
  case DOWN : 
    isMovingDown = true ; 
    break ;
  case LEFT : 
    isMovingLeft = true ; 
    break ;
  case RIGHT : 
    isMovingRight = true ; 
    break ;
  default :
    break ;
  }
}
void keyReleased() {
  switch(keyCode) {
  case UP : 
    isMovingUp = false ;
    gee.moveUp();
    break ;
  case DOWN : 
    isMovingDown = false ; 
    break ;
  case LEFT : 
    isMovingLeft = false ; 
    break ;
  case RIGHT : 
    isMovingRight = false ; 
    break ;
  default :
    break ;
  }
  if (key == ' ') {
    if (state == GameState.STAGE_2) {
      bur = 1;
      count++;
      isStop_2 = true;
    }
  }
  if (key == ENTER) {
    switch(state) {
    case GameState.NAME:
      time = millis();
      state = GameState.STAGE_1;
      break;
    case GameState.INTRO:
    case GameState.END:
      if (state==GameState.INTRO || millis()-time>=15000) {
        for (int a=0; a<4; a++) {
          score.gameWin[a] = 0;
        }
        name = "";
        line.lineY = 0;
        line.choice = 0;
        line.isEnd = false;
        isWin1 = false;
        isWin4 = false;
        mailClick = false;
        isStop_2 = false;
        mad = 0;
        count = 0;
        gee.x = width/2;
        gee.y = 85;
        win = 0;
        isStop_4 = false;
        fire.sceneFire = 0;
        sea.stageProposal = 0;
        home.scene = 0;
        s4_state = 0;
        state = GameState.START;
      }
      break;
    case GameState.STAGE_1:
      if (line.isEnd) {
        state = GameState.STAGE_2;
        time = millis();
      }
      break;
    case GameState.STAGE_2:
      if (isStop_2) {
        state = GameState.STAGE_3;
        time = millis();
      }
      break;
    case GameState.STAGE_3:
      if (gee.y>=420) {
        state = GameState.STAGE_4;
        time = millis();
      }
      break;    
    case GameState.STAGE_4:
      if (isStop_4==true) {
        state = GameState.END;
        time = millis();
      }
      break;
    default : 
      break ;
    }
  }
  if (key == DELETE) {
    name = name.substring(0, name.length()-1);
  }
}

void keyTyped() {
  if (state == GameState.NAME) {
    if (key == DELETE||key == BACKSPACE) {
      if (name.length()!=0)
        name = name.substring(0, name.length()-1);
    } else if (key == ENTER) {
      state = GameState.STAGE_1;
      time = millis();
    } else
      name += char(key);
  }
}

void mousePressed() {
  if (state == GameState.START) {
    if (mouseX > gameStart.x && mouseY > gameStart.y &&
      mouseX < gameStart.x+gameStart.w && mouseY < gameStart.y+gameStart.h) {
      // hit start
      state = GameState.NAME;
    }
    if (mouseX > intro.x && mouseY > intro.y &&
      mouseX < intro.x+intro.w && mouseY < intro.y+intro.h) {
      // hit intro
      state = GameState.INTRO;
    }
  }
  if (state == GameState.STAGE_1) {
    for (int a=0; a<5; a++) {
      if (mouseX > mail[a].x && mouseY > mail[a].y &&
        mouseX < mail[a].x+mail[a].w && mouseY < mail[a].y+mail[a].h) {
        // hit start
        mailClick = true;
        line.choice = a+1;
      }
    }
  }
  if (state == GameState.STAGE_4) {
    if (s4_state==S4_CHOOSE) {
      if (mousePressed) {
        if (mouseX > firework.x && mouseY > firework.y &&
          mouseX < firework.x+firework.w && mouseY < firework.y+firework.h) {
          s4_state = S4_FIRE;
        } else if (mouseX > seaside.x && mouseY > seaside.y &&
          mouseX < seaside.x+seaside.w && mouseY < seaside.y+seaside.h) {
          s4_state = S4_SEA;
        } else if (mouseX > gfhome.x && mouseY > gfhome.y &&
          mouseX < gfhome.x+gfhome.w && mouseY < gfhome.y+gfhome.h) {
          s4_state = S4_HOME;
        }
      }
    }
    if (fire.sceneFire == fire.SIT && fire.t>5) {
      if (mouseX > nextTime.x && mouseY > nextTime.y &&
        mouseX < nextTime.x+nextTime.w && mouseY < nextTime.y+nextTime.h) {
        state++;
      } else if (mouseX > proposal.x && mouseY > proposal.y &&
        mouseX < proposal.x+proposal.w && mouseY < proposal.y+proposal.h) {
        fire.T = 0;
        fire.sceneFire = fire.PROPOSING;
      }
    }
    if (home.scene == home.TALKING && home.t>5) {
      if (mouseX > nextTime.x && mouseY > nextTime.y &&
        mouseX < nextTime.x+nextTime.w && mouseY < nextTime.y+nextTime.h) {
        time = millis();
        state++;
      } else if (mouseX > proposal.x && mouseY > proposal.y &&
        mouseX < proposal.x+proposal.w && mouseY < proposal.y+proposal.h) {
        home.T = 0;
        home.scene = home.SAYLIKE;
      }
    }
    if (sea.stageProposal == sea.SIT && sea.t>5) {
      if (mouseX > nextTime.x && mouseY > nextTime.y &&
        mouseX < nextTime.x+nextTime.w && mouseY < nextTime.y+nextTime.h) {
        time = millis();
        state++;
      } else if (mouseX > proposal.x && mouseY > proposal.y &&
        mouseX < proposal.x+proposal.w && mouseY < proposal.y+proposal.h) {
        sea.T = 0;
        sea.stageProposal = sea.PROPOSE;
      }
    }
  }
}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return (
    ax+aw > bx       &&
    ax    < bx + bw  &&
    ay+ah > by       &&
    ay    < by + bh  );
}