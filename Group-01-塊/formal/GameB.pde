
class GameB{

float powerX;
PImage game,bg,tip;
int timer,timerB,gX,gY;
PFont power;
int tDraw=20;

GameB(){
     game=loadImage("bg/game2.png");
     bg=loadImage("bg/game2bg.png");
     tip=loadImage("tips/fight1.png");
     powerX=0;
     timerB=0;
     
     gX=-10;
     gY=0;
    // frameRate(60);
    power = createFont("Chiller", 24);
    frameRate(60);
    
 }
void draw(){
    talk1.pause();
    talk2.pause();
    talk3.pause();
    talk4.pause();
    talk5.pause();
    talk6.pause();
    image(bg,0,0);
    image(game,gX,gY);
    image(tip,0,0);
    fill(255,255,0);
    rect(220,423,powerX,17);
    image(five.hp,210,420);
    fill(0,230,230);
    textFont(power, 60);
    textAlign(LEFT);
  //  text("Press Your Mouse ", 175, 390);
    text("TIME:"+tDraw,245,340);
    
    timerB++;
    if(timerB%30==2){
      gX+=5;
    }else if(timerB%30==5){
      gX-=5;
    }
    timer++;
    if(timer%60==0){
       tDraw-=1;
      }
      if(tDraw<=0){
       tDraw=0;
      }
 
    if(powerX == 40){
     gY=-40; 
    }
    if(powerX == 80){
     gY=-80; 
    }
    if(powerX == 120){
     gY=-120; 
    }
    if(powerX == 160){
     gY=-160; 
    }
    if(powerX == 200){
     gY=-190; 
    }
    if(gY<=-190){
      gY=-190;
    }
    if( powerX>=200){
      powerX=200;
    }
  }
  void mouseClicked(){
    powerX+=2;
  }
}


   