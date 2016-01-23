
class GameC{
int  timer=0;
PImage game,bg,tip;
boolean k=false;
PFont life;
int tDraw=3;
int timerB,gX;

GameC(){
   game=loadImage("bg/game2.png");
   bg=loadImage("bg/game2bg.png");
   tip=loadImage("tips/press401.png");
   life = createFont("Chiller", 24);
   gX=-10;
   
}

void draw(){
    talk1.pause();
    talk2.pause();
    talk3.pause();
    talk4.pause();
    talk5.pause();
    talk6.pause();
    image(bg,0,0);
    image(game,gX,-190);
    image(tip,0,-10);
    fill(220,0,0);
    textFont(life, 90);
    textAlign(LEFT);
//    text("Press CONTROL ",95,290);
    text("TIME:"+tDraw,200,380);
    
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
     if(tDraw>0 && k==true){
         tDraw++;
        } 
    }

void keyPressed(){
 
  if(key=='4'){
    k=true;
  }else{k=false;}   
 }


}