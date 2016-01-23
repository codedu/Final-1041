
class GameState
{
  static final int START = 0;
  static final int PLAYINGone = 1;
  static final int PLAYINGtwo = 2;
  static final int PLAYINGthree = 3;
  static final int END = 4;
  static final int LOSEone = 5;
  static final int LOSEthree =6;
}
class Direction
{
  static final int LEFT = 0;
  static final int RIGHT = 1;
  static final int UP = 2;
  static final int DOWN = 3;
}

static int spaceWidth = 640/5;
int state = GameState.START;
int g=0;
Background bg;
Dropbean dropbean;
Jack jack;
HPDisplay hpDisplay;
JackThree jackThree;
Level2 level2;
Crow crow;

boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;

//music
import ddf.minim.*;
Minim minim;
AudioPlayer musicStart;
AudioPlayer musicLevel1;
AudioPlayer musicLevel2;
AudioPlayer musicLevel3;
AudioPlayer musicWaitAll;
AudioPlayer musicWinAll;
AudioPlayer musicLoseAll;
AudioSample musicClickAll;
AudioSample musicCatch1;
AudioSample musicPowerDown1;
AudioSample musicClay2;
AudioSample musicGoldEgg2;
AudioPlayer musicRustle3;
AudioPlayer musicGiant3;
AudioPlayer musicFinalWin3;
AudioPlayer musicCrowVoice3;

void setup () {
  size(640, 480, P2D);
  bg = new Background();
  dropbean = new Dropbean();
  jack = new Jack(320-83, 480-115);
  hpDisplay = new HPDisplay();
  jackThree = new JackThree(320, 0+80);
  level2 = new Level2();
  crow = new Crow();
  dropbean.changeDrop();

  //music
  minim = new Minim(this);
  musicStart = minim.loadFile("musicStart.mp3");
  musicLevel1 = minim.loadFile("musicLevel1.mp3");
  musicLevel2 = minim.loadFile("musicLevel2.mp3");
  musicLevel3 = minim.loadFile("musicLevel3.mp3"); 
  musicWaitAll = minim.loadFile("musicWaitAll.mp3");
  musicWinAll = minim.loadFile("musicWinAll.mp3");
  musicLoseAll = minim.loadFile("musicLoseAll.mp3");
  musicClickAll = minim.loadSample("musicClickAll.mp3");
  musicCatch1 = minim.loadSample("musicCatch1.mp3");
  musicPowerDown1 = minim.loadSample("musicPowerDown1.mp3");
  musicClay2 = minim.loadSample("musicClay2.mp3");
  musicGoldEgg2 = minim.loadSample("musicGoldEgg2.mp3"); 
  musicRustle3 = minim.loadFile("musicRustle3.mp3");  
  musicGiant3 = minim.loadFile("musicGiant3.mp3");
  musicFinalWin3 = minim.loadFile("musicFinalWin3.mp3");
  musicCrowVoice3 = minim.loadFile("musicCrowVoice3.mp3");

  musicStart.play(0);
}

void draw()
{
  //test
  if ( keyPressed )
  {
    if ( key == 'q' )
    {
      bg.count++;

      if ( bg.count > 6 )
        bg.count = 6;
    }
  }

  if (state == GameState.START) {
    bg.draw();        
    //background(0);
    if (mouseX>510 & mouseX<590 & mouseY>370 & mouseY<435) {
      if (mousePressed) {
        musicClickAll.trigger();  
        if (musicStart.isPlaying()) {
          musicStart.pause();
      
      }
        state = GameState.PLAYINGone;    //ForTest  >>> one ;
      }
    }
  }

  if (state == GameState.PLAYINGone && bg.count<6) {      //  one

    if( bg.canPlay == false )
    {
      bg.drawIntro();
      if(musicWaitAll.isPlaying() == false)
      {
        musicWaitAll.play(0);        
      }            
      if (mouseX>235 & mouseX<410 & mouseY>400 & mouseY<460) {
        if (mousePressed) {
          musicClickAll.trigger();        
          if (musicWaitAll.isPlaying()) {
            musicWaitAll.pause();
          } 
          if(musicLevel1.isPlaying() == false)
          {
            musicLevel1.loop(0);
          }    
          bg.canPlay=true;
        }
      }
    }
    
    if (bg.canPlay) {
      bg.draw();
      jack.draw();
      hpDisplay.updateWithFighterHP(jack.hp);
      dropbean.move();
      bg.move();

      if (dropbean.isGet(jack.x, jack.y)) {      //get the right bean.
        bg.bgMax+=(bg.background.height/10);
        dropbean.changeDrop();
        bg.count++;
        musicCatch1.trigger();
      }

      for (int i=0; i<5; i++) {                   //get the wrong thing.
        if (dropbean.isSmash(jack.x, jack.y, i)) {
          jack.damage();
          dropbean.changeDrop();
          if (jack.hp<0) {
            musicLoseAll.play(0);
            if (musicLevel1.isPlaying()) {
              musicLevel1.pause();
            }
            state = GameState.LOSEone;
          }
          hpDisplay.updateWithFighterHP(jack.hp);
        }
      }

      if (dropbean.dropY==-150 || dropbean.dropY>height) {
        dropbean.changeDrop();
      }
      dropbean.draw();
    }
  } else if (state == GameState.PLAYINGone && bg.count==6) {
    bg.drawCastle();//畫城堡

      musicWinAll.play();
    
      if (musicLevel1.isPlaying()) {
        musicLevel1.pause();
      }


    if (mouseX>460 & mouseX<610 & mouseY>390 & mouseY<455) {
      if (mousePressed) {
        musicClickAll.trigger();
        bg.canPlay=false;
        level2.gameState = 0;
        fill(0);
        textSize(50);
        if ( musicWinAll.isPlaying()) {
          musicWinAll.pause();
        }        
        musicWaitAll.play(0);
        state = GameState.PLAYINGtwo;////////////////two--three
        //  go to PLAYINGtwo;
      }
    }
  }

  if (state == GameState.PLAYINGtwo) {      //  PLAYING two
    level2.draw();
    level2.mousePressed();
  }

  //第三關
  if (state == GameState.PLAYINGthree) {        //PLAYING three
    bg.draw();
    //println( musicWaitAll.isPlaying() );
    if(musicWaitAll.isPlaying() == false)
    {
      musicWaitAll.play(0);
    }
    
    if (bg.canPlay == false) {
      if (mouseX>235 & mouseX<410 & mouseY>400 & mouseY<460) {
        if (mousePressed) {
          musicClickAll.trigger();
          bg.canPlay=true;    // for intro
          
        }
      }
    } else//開始玩
      if (bg.canPlay) {
        if (musicWaitAll.isPlaying()==true) {
         musicWaitAll.pause();                     
        }
        
        if(musicLevel3.isPlaying() == false)
        {
          musicLevel3.loop(0);     
        }
        bg.move();
        jackThree.draw();
        jackThree.keyMove();
        crow.draw();
        crow.move();
        if (crow.x>width+71) {
          crow.changeXY();
          musicCrowVoice3.play(0);
        }
      }
  }

  if (state == GameState.LOSEone) {          //LOSE one
    bg.draw();
    if (musicLevel3.isPlaying()) {
          musicLevel3.pause();
        }
    if (mouseX>230 & mouseX<415 & mouseY>45 & mouseY<105) {
      if (mousePressed) {
        bg.canPlay=false;
        bg.count=0;
        jack.hp=100;
        jack.x=320-83;
        jack.y=480-115+40;
        state = GameState.PLAYINGone;
      }
    }
  }
  if (state == GameState.LOSEthree) {        //LOSE three
    bg.draw();
    if ( mousePressed ) {
      if (mouseX>47 & mouseX<222 & mouseY>396 & mouseY<455) {
        bg.canPlay=false;
        bg.giantY=0;
        crow.changeXY();
        jackThree.pX=320;
        jackThree.pY=80;
        state = GameState.PLAYINGthree;
      }
    }
  }
  if (state == GameState.END) {         //  END win
    bg.draw();
    if ( mousePressed ) {
      if (mouseX>31 & mouseX<205 & mouseY>398 & mouseY<456) {
        musicFinalWin3.pause();
        bg.canPlay=false;
        bg.count=0;
        jack.hp=100;
        jack.x=320-83;
        jack.y=480-115+40;
        bg.playingBgY=-bg.background.height/2;
        bg.bgMax = bg.playingBgY;
        state=GameState.PLAYINGone;
      }
    }
  }
}

void keyPressed() {
  switch(keyCode) {
  case UP : 
    isMovingUp = true ;
    break ;
  case DOWN : 
    isMovingDown = true ; 
    break ;
  case LEFT : 
    isMovingLeft = true ; 
    if (state == GameState.PLAYINGthree) {
      //  jackThree.moveTo( jackThree.pX-jackThree.speed, jackThree.pY );
    }
    break ;
  case RIGHT : 
    isMovingRight = true ; 
    if (state == GameState.PLAYINGthree) {
      //  jackThree.moveTo( jackThree.pX+jackThree.speed, jackThree.pY );
    }
    break ;
  default :
    break ;
  }
}
void keyReleased() {
  switch(keyCode) {
  case UP : 
    isMovingUp = false ;
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
}