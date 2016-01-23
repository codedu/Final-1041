final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;
final int GAME_END =3;
final int GAME_RUNN = 17;
final int GAME_RUN3 = 18;
int gameState;
int insideGameState;
int minorEnd;
PImage start1,start2,end1,end2;
PFont hint;

import ddf.minim.*;
Minim minim;
AudioPlayer startSong,song1,song2,song3; 

Story story;
MinorStory minorStory;
Five five;
Four four;
Knife knife;
RedLight red;
Black black;
GameB gameB;
GameC gameC;
GameD gameD;
MinorLose minorLose;
MainLose mainLose;
MainLose2 mainLose2;
Move move;
int timer;

boolean knifeIsPlaying=false;
PImage kitchen,livingroom,livingroom1,attention,summary,tip1;
//Song song;
final int A=4;
final int B=5;
final int C=6;
final int D=7;

final int e=8;
final int f=9;
final int g=10;
final int h=11;
final int i=12;
final int j=13;
final int k=14;
final int l=15;
final int m=16;
float turnblack=255;
float turnblack1=255;
int fadein=0;
int fadein1=0;
int startX=0;

float kx;
int ky;
PImage kn; 
PImage red1,red2,red3;
int redtint,redtint1,redtint2;


import processing.video.*;
Movie ED;
White white;
AudioPlayer talk1,talk2,talk3,talk4,talk5,talk6,talk7;
AudioPlayer effect1,effect2,effect3,effect4,effect5,effect6;
AudioPlayer effect7,effect8,effect9,effect10,effect11,effect12;

Medicine MED1;
Medicine MED2;
Medicine MED3;
Poison_50 POI_50_1;
Poison_50 POI_50_2;
Poison_30 POI_30_1;
Poison_30 POI_30_2;
SlowDownDrug Slow_1;
SlowDownDrug Slow_2;

int timerM=0;

void setup(){
  size(640,480);
  background(0);
  start1=loadImage("bg/start1.png");
  start2=loadImage("bg/start2.png");
  end1=loadImage("bg/end1.png");
  end2=loadImage("bg/end2.png");
  
  move= new Move();
 //song
  minim = new Minim(this);
  startSong = minim.loadFile("music/hoshi.mp3");
  song1=minim.loadFile("music/Mail Coach.wav");
  song2=minim.loadFile("music/death.mp3");
  song3=minim.loadFile("music/paradise.mp3");
  
  effect1=minim.loadFile("music/effect/intowater.mp3");
  effect2=minim.loadFile("music/effect/4knife.wav");
  effect3=minim.loadFile("music/effect/belt.mp3");
  effect4=minim.loadFile("music/effect/5red.mp3");
  effect5=minim.loadFile("music/effect/into13.mp3");
  effect6=minim.loadFile("music/effect/13with5.mp3");
  effect7=minim.loadFile("music/effect/5fall.mp3");
  effect8=minim.loadFile("music/effect/tv1.mp3");
  effect9=minim.loadFile("music/effect/4fall.mp3");
  effect10=minim.loadFile("music/effect/4kill5.mp3");
  effect11=minim.loadFile("music/effect/start.mp3");
//  effect12=minim.loadFile("music/effect/intowater.mp3");
  //startSong.play();
  //startSong.loop();
  //song1.play();
  //song1.loop();
  story= new Story();
  minorStory= new MinorStory();
  gameB= new GameB();
  gameC= new GameC();
  gameD= new GameD();
  red= new RedLight();
  black=new Black();
  //game1
  five= new Five();
  four= new Four();
  knife= new Knife();
  minorLose=new MinorLose();
  mainLose=new MainLose();
  mainLose2=new MainLose2(); 
  kitchen=loadImage("bg/kitchen.png");
  livingroom=loadImage("bg/livingroom.png");
  livingroom1=loadImage("bg/livingroom1.png");
  attention=loadImage("bg/attention.png");
  summary=loadImage("OPENING/summary.png");
  tip1=loadImage("tips/knife.png");
  hint = createFont("Chiller", 24);
  
  kn=loadImage("knife.png");
  kx=340;
  ky=35;
  red1=loadImage("fivewin/red.png");
  red2=loadImage("fivewin/red.png");
  red3=loadImage("fivewin/red.png");
  redtint=0;
  redtint1=0;
  redtint2=0;
  white=new White();
  talk1=minim.loadFile("music/warusi.mp3");
  talk2=minim.loadFile("music/sinyou.mp3");
  talk3=minim.loadFile("music/dark.mp3");
  talk4=minim.loadFile("music/akuma.mp3");
  talk5=minim.loadFile("music/creepy.mp3");
  talk6=minim.loadFile("music/syodai.mp3");
  talk7=minim.loadFile("music/syodai.mp3");
  MED1=new Medicine(370,150);
  MED2=new Medicine(420,40);
  MED3=new Medicine(450,400);
  POI_50_1=new Poison_50(width/2,300);
  POI_50_2=new Poison_50(140,420);
  POI_30_1=new Poison_30(130,270);
  POI_30_2=new Poison_30(370,430);
  Slow_1=new SlowDownDrug(490,height/2);
  Slow_2=new SlowDownDrug(135,160);

   ED = new Movie(this, "ED.mp4");
}

void movieEvent(Movie m) {
  m.read();
}

void draw(){
  switch(gameState){
     case GAME_START:
     background(0);
      if(!startSong.isLooping()){startSong.loop();}
     //startSong.loop();
     image(start1,startX,0);
   //  tint(255,turnblack);
     
     if (mouseX>210 && mouseX<430 && mouseY>290 && mouseY<330){        
      if(mousePressed){
        //click
       // turnblack-=10;
        // minim.stop();
          startSong.pause();
          if(!effect11.isPlaying()){effect11.play();} 
          gameState=GAME_RUN;
      }else{
        image(start2,startX,0);
      }
     } 
  
     break;
     
     case GAME_RUN:
     imageMode(CORNER);
     effect11.pause();
     tint(turnblack,255);
     image(attention,0,0);
     turnblack-=0.5; //1
     if(turnblack<=0){
         turnblack=0;
         if(!talk1.isLooping()){talk1.loop();} 
         tint(turnblack1,255);
         image(summary,0,0);
         turnblack1-=0.3; 
          if(turnblack1<=0){
           tint(255,fadein);
           image(livingroom1,0,0);
           fadein+=3;} //3
            if(fadein>=255){
              story.stkp=true;
              story.draw();
            }}
     //story.stkp=true;
     minorStory.stkp=false;
     minorLose.stkp=false;
     mainLose.stkp=false;
     mainLose2.stkp=false;

      if(story.currentImage==39){
       story.stkp=false;
       if(!effect2.isPlaying()){effect2.play();} 
       image(story.images[39], 0, 0);        
       image(kn,kx,ky);      

       kx--;
       ky+=13;
   
       if(ky>300){
       ky=600;
       effect2.pause();
       story.stkp=true;

       story.draw();}
     }
    
     if(story.currentImage==41){
       talk2.pause();
       insideGameState=A;
   
       story.stop();
     }
     switch(insideGameState){
       case A:
          effect3.pause();
          talk1.pause();
          talk2.pause();
          talk3.pause();
          talk4.pause();
          talk5.pause();
          talk6.pause();
         if(!song1.isLooping()){song1.loop();}        
        // song1.loop();
         image(kitchen,0,0);
         image(tip1,90,150);
        /* fill(255);
         textFont(hint,32);
         textAlign(LEFT);
         text("Avoid the flying knives", 125, 170);
         text("and reach your enemy",125,195);  */   
         MED1.draw();
         MED2.draw();
         MED3.draw();
         POI_50_1.draw();
         POI_50_2.draw();
         POI_30_1.draw();
         POI_30_2.draw();
         Slow_1.draw();
         Slow_2.draw();
         five.display();
         five.hp();
         five.border();
         four.display();
         knife.display();
         knife.border();
         
          timer++;           
          if(timer % 60==0){
            knifeIsPlaying=true;
              }
           if(knifeIsPlaying==true){                 
              if(five.x>120 && five.x<200){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(-2,5);}
                
                //timer=0;
                timer++;
             //   kt=false;
                }
                
               if(five.x>120 && five.x<200 && five.y<height/2){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(-2,3);}
                
                //timer=0;
                timer++;
               }
                
                if(five.x>width/2 && five.x<500 && five.y<120){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(3,1);}
                
                //timer=0;
                timer++;
                
                
               //  kt=false;
             }
              if(five.x>=200 && five.x<280){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(-2,5);}
                
                //timer=0;
                timer++;
              //   kt=false;
            }
               if(five.x>=280 && five.x<360){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(0,5);}
                 
                //timer=0;
                timer++;
              //  kt=false;
            }
               if(five.x>=360 && five.x<440){
               if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(2,5);}
                 
               //timer=0;
                timer++;
             //   kt=false;
            }
                if(five.x>=360 && five.x<440 && five.y<height/2){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(2,3);}
                  
                 //timer=0;
                timer++;
               // knife.y+=10;
               //  kt=false;
               }
               if(five.x>=440 && five.x<520){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(4,5);}
                
                 //timer=0;
                timer++;
              //   kt=false;
            }
               if(five.x>=440 && five.x<520 && five.y<height/2){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(4,3);}
                
                // timer=0;
                timer++;
              //   kt=false;
            }
               if(five.x>=390 && five.x<520 && five.y<130){
                if(knife.isSetDirection){knife.moveForward();}
                else{knife.setDirection(6,-1);}
                 
                 //timer=0;
                timer++;
              //   kt=false;
            }
               }else{knife.y=601;} 
          if(isHit(five.x,five.y,32,45,knife.x,knife.y,32,32)){
            //timer=0;
            timer++;
             five.hpDecrease(40);
             knife.y=601;
             }
          if(five.hpx<=0){  
            
           //  insideGameState = k;
          //    background(255);
             five.hpx=0;
             song1.pause();
             imageMode(CORNER);
             red.draw();
             if(!effect10.isPlaying()){effect10.play();} 
          
               if(red.tintR>=255){
                 effect10.pause();
               gameState =GAME_RUNN ;
               
            }   }
         
          //five win
          if(isHit(five.x,five.y,25,30,four.x,four.y,25,30)){
             song1.pause();     
             five.hpDecrease(-200);  
             five.speed-=five.speed;
             imageMode(CORNER);        
             story.stkp=true;
             story.draw();
             insideGameState = B;
                    
            }
          
           
              break;
              
          case B:
         song1.pause();  
          if(story.currentImage==71){
             story.stop();
             red.draw();
             if(!effect4.isPlaying()){effect4.play();} 
             if(red.tintR>=255){
               effect4.pause();
              story.stkp=true;
              story.draw();
             }
           }
           if(story.currentImage==82){
            gameB.draw();
            if(!song2.isLooping()){song2.loop();}
            
            story.stop();
             if(gameB.tDraw>0 && gameB.powerX>=200){
                gameB.tDraw++;
                song2.pause();
                story.stkp=true;
                insideGameState = C;}
             if(gameB.tDraw<=0 ) {
                 gameB.tDraw=0;
                 song2.pause();
               if(!effect4.isPlaying()){effect4.play();} 
                  redtint1+=51;
                  tint(redtint1,255);
                  image(red2,0,0);
                  if(redtint1>=255){
                    effect4.pause();
                     insideGameState = f;
                  }
               
                 }
               }
     
           
            break;
          
          case C:
             story.draw();
            if(story.currentImage==86){
                  gameC.draw();
                  song2.play();
                  story.stop();}
            if(gameC.tDraw>0 && gameC.k==true){
                song2.pause();
                story.stkp=true;
                story.draw();}
            if(gameC.tDraw<=0){
              song2.pause();
               if(!effect4.isPlaying()){effect4.play();} 
                  redtint2+=51;
                  tint(redtint2,255);
                  image(red3,0,0);
                  if(redtint2>=255){
                    effect4.pause();
                    insideGameState =g ;
            }}    
              if(story.currentImage==89){
                  story.stop(); 
                  
                  redtint+=51;
                  tint(redtint,255);
                  image(red1,0,0);
                  if(!effect5.isPlaying()){effect5.play();} 
                   if(redtint>=255){
                     redtint=255;
                     effect5.pause();
                     story.stkp=true;                 
                     story.draw(); 
                  }}
                 if(story.currentImage==97){
                   story.stop();
                //  background(255);
                   white.draw();
                   if(white.whitetint>=255){
                  //   white.whitetint=255;
                    story.stkp=true;                 
                    story.draw();  
                 }}
                 
                  if(story.currentImage==126){
                    story.stop();                
                    story.stkp=true;                 
                    story.draw();  
                 }   
              if(story.currentImage==149){ 
             //   story.stop();
               image(ED, 0, 0, width, height);
                ED.play();
                float t =ED.time();
                if(t>97.079){
                restartGame();                
              }
              }
              
            break;
          
            
          case e: 
             story.stkp=true;
             //  story. curImagee=7;
             background(255);
             imageMode(CORNER);
             story.draw();
             //  story.fadeInFadeOut();
             if(story.currentImage==20){
               insideGameState = C;
               //story.isCurrentFadeInOut = false;
              // story. currentImage=0;
               story.stop();
             }
            break;
          case f: 
           
              mainLose.stkp=true;
              mainLose.draw();
            
            
            if(mainLose.currentImage==3){
              gameState=GAME_OVER;
              mainLose.stop();
            }
            break;
          case g:
              story.stop();
              mainLose2.stkp=true;
              mainLose2.draw();
            
                             
           if(mainLose2.currentImage==7){
                gameState=GAME_OVER;
                mainLose2.stop();
              }            
               
            break;        
          
            }
          break;
     
     case GAME_OVER:
     imageMode(CORNER);
     image(end1,0,0);
     if (mouseX>210 && mouseX<430 && mouseY>260 && mouseY<300){        
      if( mousePressed){
        //click
        background(0);
        restartGame();
       
      }else{
        image(end2,0,0);
      }
     }
     
     break;
    case GAME_RUNN:       
       
        minorLose.stkp=false;
        minorStory.stkp=true;
        minorStory.draw();
       
        if(minorStory.curImage==4){
          minorStory.stop();
          gameD.draw();
          if(!song3.isLooping()){song3.loop();}

        
       if(gameD.tDraw>0 && gameD.d1==true && gameD.d2==true && gameD.d3==true && gameD.d4==true){
         gameD.tDraw++;
         song3.pause();
         minorStory.stkp=true;
         minorStory.draw();  
       }}
       if(minorStory.curImage==11){         
          gameState=GAME_OVER;
          minorStory.stop();}
          
        if(gameD.tDraw<=0){
          song3.pause();
          minorEnd=m;
           
        }
        switch(minorEnd){
           case m: 
           song3.pause();
           if(!talk7.isLooping()){talk7.loop();} 
           minorLose.stkp=true;
           minorLose.draw();
          if(minorLose.currentImage==7){
         
            gameState=GAME_OVER;
            minorLose.stop();}
           break; 
                    
        }
       
       break;
    case GAME_RUN3:
          if(!effect4.isPlaying()){effect4.play();} 
          redtint2+=51;
          tint(redtint2,255);
          image(red1,0,0);
            if(redtint2>=255){
             // story.stop();
              effect4.pause();  
              mainLose2.stkp=true;
              mainLose2.draw();
            }
                             
           if(mainLose2.currentImage==7){
                gameState=GAME_OVER;
                mainLose2.stop();
              }
    
      break;
  }//gamestate
}//draw

void keyReleased() {
  five.endMove();
  story.keyPressed();
  minorStory.keyPressed();
  minorLose.keyPressed();
  mainLose.keyPressed();
  mainLose2.keyPressed();
  gameC.keyPressed();
}

void keyPressed() {
  if (key == CODED ) {
    switch(keyCode) {
    case UP:   
       five.moveUp();
      break;
    case DOWN:     
      five.moveDown();
      break;
    case LEFT:   
      five.moveLeft();  
     break;
    case RIGHT:   
      five.moveRight();    
      break;
    }
  }
}
void mousePressed(){ 
    gameD.mousePressed();  
  }
void mouseClicked(){
          gameB.mouseClicked();

}

boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
  return (
    ax+aw > bx       &&
    ax    < bx + bw  &&
    ay+ah > by       &&
    ay    < by + bh  );
}


void restartGame(){
 gameState=0;
insideGameState=0;
minorEnd = 0;
start1 =null;
start2 =null;
end1 =null;
end2 =null;
hint  =null;
minim=null;
startSong=null;
song1=null;
song2=null;
song3=null;
effect1=null;

story=null;
minorStory=null;
five=null;
four=null;
knife=null;
red=null;
black=null;
gameB=null;
gameC=null;
gameD=null;
minorLose=null;
mainLose=null;
mainLose2=null;
move=null;
timer = 0;

knifeIsPlaying=false;
kitchen=null;
livingroom=null;
livingroom1=null;
attention=null;
summary=null;
tip1=null;

turnblack=255;
fadein=0;
startX=0;
kx=340;;
ky=35;
kn=null; 
red1=null;
red2=null;
red3=null;
redtint=0;
redtint1=0;
redtint2=0;

ED=null;
white=null;

talk1=null;
talk2=null;
talk3=null;
talk4=null;
talk5=null;
talk6=null;
talk7=null;

effect1=null;
effect2=null;
effect3=null;
effect4=null;
effect5=null;
effect6=null;
effect7=null;
effect8=null;
effect9=null;
effect10=null;
effect11=null;
effect12=null;

MED1=null;
MED2=null;
MED3=null;
POI_50_1=null;
POI_50_2=null;
POI_30_1=null;
POI_30_2=null;
Slow_1=null;
Slow_2=null;
setup();
}