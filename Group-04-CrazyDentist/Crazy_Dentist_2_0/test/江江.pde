PImage start1, start2, rule1, mission1bg , rule2 , mission2bg, blank , win , lose , imgLife, imgReceiver, imgReceiver1;
int nbrLife , xReceiver , yReceiver , currentFakeTeeth , nbrTeethCollected;

int gameState ;
final int GAME_START=1 , GAME_RULE1=2 , GAME_MISSION1=3 , GAME_RULE2=4 ,GAME_MISSION2=5 , GAME_LOSE=6 , GAME_WIN=7;

final int receiverSpeed =5 ;
int q=0 ;

boolean leftPressed = false , rightPressed = false, enter = false ;

PImage[] tooth = new PImage[5];
float toothAX , toothAY , toothBX , toothBY , dentureAX , dentureAY , dentureBX , dentureBY , dentureCX , dentureCY;
int tA , tB , toothAFallingSpeed , toothBFallingSpeed;

int dA , dB ,dC , dentureAFallingSpeed , dentureBFallingSpeed , dentureCFallingSpeed ;

PImage[] nbrCollectedPic = new PImage[10];

//denture
int currentDenture;
final int nbrDenture = 120 ;
PImage[] imagesDenture = new PImage[nbrDenture];

//audio
import ddf.minim.*;
Minim minim;
AudioPlayer soundTrack;
AudioPlayer beingHit;
AudioPlayer shootAWorm;

void setup () {
  size(640,480) ; 

  minim = new Minim(this);
  soundTrack = minim.loadFile("soundTrack.mp3");
  soundTrack.play();
  beingHit = minim.loadFile("beingHit.mp3");
  shootAWorm = minim.loadFile("shootAWorm.mp3");
  
  start1 = loadImage("pic/start1.png") ;
  start2 = loadImage("pic/start2.png") ;
  rule1 = loadImage("pic/rule1.png") ;
  rule2 = loadImage("pic/rule2.png") ;
  win = loadImage("pic/win.png") ;
  lose = loadImage("pic/lose.png") ;
  blank = loadImage("pic/blank.png") ;
  
  mission1bg = loadImage("pic/mission1background.png") ;
  mission2bg = loadImage("pic/mission2background.png") ;
  
  imgReceiver = loadImage("pic/receiver.png") ;
  imgReceiver1 = loadImage("pic/receiver1.png") ;
  
  imgLife = loadImage("pic/life.png") ;
  nbrLife = 3;

  for(int i=0;i<5;i++){tooth[i]=loadImage("pic/tooth"+(i+1)+".png");}
  for(int i=0;i<10;i++){nbrCollectedPic[i]=loadImage("pic/collected"+"0"+i+".png");}

  xReceiver = width/2-imgReceiver.width/2 ;  
  yReceiver = 280 ;

//denture
  currentDenture =0;
  for (int i=0;i<nbrDenture;i++){imagesDenture[i]=loadImage("pic/faketeeth"+(i%5+1)+".png");}
  frameRate(60);

  gameState = GAME_START;

  tA =int(random(5)) ;
  toothAX = random(width-tooth[tA].width);
  toothAY = -100 ;
  toothAFallingSpeed = 3 ;
  tB =int(random(5)) ;
  toothBX = random(width-tooth[tB].width);
  toothBY = -180 ;
  toothBFallingSpeed = 5 ;

  dentureAX = random(imagesDenture[dA].width/2,width-imagesDenture[dA].width/2);
  dentureAY = -100 ;
  dentureAFallingSpeed = 6 ;
  dentureBX = random(imagesDenture[dB].width/2,width-imagesDenture[dB].width/2);
  dentureBY = -150 ;
  dentureBFallingSpeed = 7 ;
  dentureCX = random(imagesDenture[dC].width/2,width-imagesDenture[dC].width/2);
  dentureCY = -180 ;
  dentureCFallingSpeed = 8 ;

  nbrTeethCollected=0;

}

void draw() {
    
  switch (gameState){
    
    case GAME_START:   
    if (enter==true){
      image(blank,0,0) ;
      gameState = GAME_RULE1 ;
      enter = false;
      }else{
      image(start1,0,0) ;}
      break ;   
        
    case GAME_RULE1 :
    if (enter==true){
      image(blank,0,0) ;
       gameState = GAME_MISSION1 ;
       enter = false;
      }else{image(rule1,0,0);}      
      break ;

    
    case GAME_MISSION1 :
      image(mission1bg,0,0);
      
      //PUT MISSION1 CODE HERE
      
      if (enter==true){gameState = GAME_RULE2 ;enter=false;}  //CHANGE ENTER INTO WIN CONDITION
      if (rightPressed){gameState = GAME_LOSE ;}  //CHANGE RIGHTPRESSED INTO LOSE CONDITION
      break ;

    case GAME_RULE2 :
    if (enter==true){
       gameState = GAME_MISSION2 ;
       enter = false;
      }else{image(rule2,0,0);}      
      break ;

    case GAME_MISSION2 :
      image(mission2bg,0,0);
      
      if(nbrTeethCollected==10){gameState=GAME_WIN;nbrLife=3;nbrTeethCollected=0;}else{

      image(nbrCollectedPic[nbrTeethCollected],600-nbrCollectedPic[nbrTeethCollected].width,80);        
      //receiver
      if(q>120){q=0; beingHit.rewind();}
      if(q==0){image(imgReceiver,xReceiver,yReceiver);
      }else{image(imgReceiver1,xReceiver,yReceiver);q++; beingHit.play(); }
      if(leftPressed){
        xReceiver -= receiverSpeed;
        if(xReceiver<0)xReceiver = 0;
      }
      if(rightPressed){
        xReceiver += receiverSpeed;
        if(xReceiver>width-imgReceiver.width)xReceiver= width-imgReceiver.width;
      }
      
      //teeth
      if(toothAY < height-tooth[tA].height-10){
      image(tooth[tA],toothAX,toothAY);
      toothAY+= toothAFallingSpeed;
        if(toothAY+tooth[tA].height-yReceiver>=0 && toothAY+tooth[tA].height-yReceiver <= 8 && toothAX >= xReceiver-tooth[tA].width && toothAX <= xReceiver+imgReceiver.width){
        nbrTeethCollected ++ ; toothAX = random(width-tooth[tA].width); toothAY=-100; tA=int(random(5)) ; toothAFallingSpeed = int(random(3,8)) ;}      
      }else{toothAX = random(width-tooth[tA].width); toothAY=-100; tA=int(random(5)) ; toothAFallingSpeed = int(random(3,8)) ; }
            
      if(toothBY < height-tooth[tB].height-10){
      image(tooth[tB],toothBX,toothBY);
      toothBY+= toothBFallingSpeed;
        if(toothBY+tooth[tB].height-yReceiver>=0 && toothBY+tooth[tB].height-yReceiver<=8 && toothBX >= xReceiver-tooth[tB].width && toothBX <= xReceiver+imgReceiver.width){
        nbrTeethCollected ++ ; toothBX = random(width-tooth[tB].width); toothBY=-100; tB=int(random(5)) ; toothBFallingSpeed = int(random(3,8)) ;}   
      }else{toothBX = random(width-tooth[tB].width); toothBY=-100; tB=int(random(5)) ; toothBFallingSpeed = int(random(3,8)) ; }
      
      //denture
      if(dentureAY < height-100){
      int i = (currentDenture++)%nbrDenture;
      imageMode(CENTER);
      image(imagesDenture[i],dentureAX , dentureAY);
      dentureAY += dentureAFallingSpeed;
      if(dentureAY>=yReceiver && dentureAX>=xReceiver-imagesDenture[i].width/2 && dentureAX<=xReceiver+imagesDenture[i].width/2){
        nbrLife--;dentureAX = random(imagesDenture[dA].width/2,width-imagesDenture[dA].width/2); dentureAY=-100; dentureAFallingSpeed = int(random(5,9)) ;
        q=1; 
        image(imgReceiver1,xReceiver+imgReceiver1.width/2,yReceiver+imgReceiver1.height/2);
      }}else{dentureAX = random(imagesDenture[dA].width/2,width-imagesDenture[dA].width/2); dentureAY=-100; dentureAFallingSpeed = int(random(5,9)) ;}

      if(dentureBY < height-100){
      int j = (currentDenture++)%nbrDenture;
      imageMode(CENTER);
      image(imagesDenture[j],dentureBX , dentureBY);
      dentureBY += dentureBFallingSpeed;
      if(dentureBY>=yReceiver && dentureBX>=xReceiver-imagesDenture[j].width/2 && dentureBX<=xReceiver+imagesDenture[j].width/2){
      nbrLife--;dentureBX = random(imagesDenture[dB].width/2,width-imagesDenture[dB].width/2); dentureBY=-100; dentureBFallingSpeed = int(random(6,9)) ;
      q=1;image(imgReceiver1,xReceiver+imgReceiver1.width/2,yReceiver+imgReceiver1.height/2);
      }}else{dentureBX = random(imagesDenture[dB].width/2,width-imagesDenture[dB].width/2); dentureBY=-100; dentureBFallingSpeed = int(random(6,9)) ;}

      if(dentureCY < height-100){
      int k = (currentDenture++)%nbrDenture;
      imageMode(CENTER);
      image(imagesDenture[k],dentureCX , dentureCY);
      dentureCY += dentureCFallingSpeed;
      if(dentureCY>=yReceiver && dentureCX>=xReceiver-imagesDenture[k].width/2 && dentureCX<=xReceiver+imagesDenture[k].width/2){
      nbrLife--;dentureCX = random(imagesDenture[dC].width/2,width-imagesDenture[dC].width/2); dentureCY=-100; dentureCFallingSpeed = int(random(5,9)) ;
      q=1;image(imgReceiver1,xReceiver+imgReceiver1.width/2,yReceiver+imgReceiver1.height/2);
      }}else{dentureCX = random(imagesDenture[dC].width/2,width-imagesDenture[dC].width/2); dentureCY=-100; dentureCFallingSpeed = int(random(7,9)) ;}
      
      imageMode(CORNER);
            
      for(int i=0;i<nbrLife;i++){image(imgLife,445+i*50,30);}
      if (nbrLife==0){gameState=GAME_LOSE; nbrLife=3;nbrTeethCollected=0;beingHit.rewind(); beingHit.play();}      
      }
      break ;

    case GAME_LOSE :
    if (enter==true){
       gameState = GAME_START ;
       enter=false;
      }else{image(lose,0,0);}      
      break ;

    case GAME_WIN :
    if (enter==true){
       gameState = GAME_START ;
       enter=false;
      }else{image(win,0,0);}      
      break ;

  }  }
    



    void keyPressed() {
      if (key == CODED) {
        switch(keyCode){
          case LEFT :   leftPressed = true ;   break ;
          case RIGHT :   rightPressed = true ;   break ;
        }}
      if(key==ENTER){
        enter = true; }
   }
   

    void keyReleased(){
      if(key == CODED) {
        switch(keyCode){
          case LEFT :   leftPressed = false ;   break ;
          case RIGHT :   rightPressed = false ;   break ;
        }
      }
    }