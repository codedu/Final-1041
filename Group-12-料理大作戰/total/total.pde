PImage gStart1,gStart2,chooseH1,chooseH2,chooseH3,chooseS1,chooseS2,chooseS3,chooseG1,chooseG2,chooseG3,choose;
PImage hWin,hLose,sWin,sLose,gWin,gLose;
PImage hWin2,hLose2,sWin2,sLose2,gWin2,gLose2;
int gameMode = 0, caseNum;
final int GAMECHOOSE = 1;
final int HOTPOT = 2;
final int SUSHI = 3;
final int GRILL = 4;
final int WIN =5;
final int LOSE = 6;
import ddf.minim.*;
Minim minim;
AudioPlayer bgMusic,people,lose,win,japan;



//PART hotpot-----------------------
      //hotpot
      PImage [] hHotpotEmpty=new PImage[4];
      PImage [] hHotpotHalf=new PImage[4];
      PImage [] hHotpotFull=new PImage[4];
      int currentFrame=0;
      //hand
      PImage hHand1, hHand2;
      //ingredient
      PImage [] hIngredient=new PImage[8];
      int [] hIngredientX=new int[8];
      int [] hIngredientY=new int[8];
      boolean [] hFalling=new boolean[8];
      boolean [] hFallingWrong=new boolean[8];
      int hCurrentIngredient;
      int hNextIngredient;
      int hIngredientMode=1;
      //score
      int hScore;
      //sound
      AudioPlayer hBoiling;
      AudioSample hCorrect;
      AudioSample hWrong;
      //countdown timer
      String hTime = "30";
      int hT;
      int hInterval = 30;
//-------------------------------------------------------PART hotpot

//PART Grill---------------------------------------------------------
PImage bg, meatRaw,meatOK1,meatOK2,meatOut1,meatOut2;
Meat [] meat = new Meat[50];
boolean move = false;
int moveCounter = 0;
int gScore = 0;
int gTime=30;
//PART Grill--------------------------------------------------------

//PART shshu------------------------------------------------------
int sGameState;
final int sGameStart = 0,sGameRun = 1,sGameWin = 2,sGameLose = 3;
int fishState;
final int fish0=0,fish1=1,fish2=2,fish3=3;
PImage imgRailway,imgRice,imgHand,imgFish0,imgFish1,imgFish2;
float railwayX,railwayY,riceX,riceY,riceX2,riceY2,handX,handY,handX2,handY2,fish0X,fish0Y,fish1X,fish1Y,fish2X,fish2Y;
int timer = 0;
float railwaySpeed = 10;

int score;
boolean makeSushi;
boolean doneSushi;
boolean okSushi;

int sTotalTime;
int sPassedTime;
int sLeftTime;
//-----------------------------------------------------PART sushi


void setup()
{
  frameRate(60);
  size(800,600);
  gStart1 = loadImage("img/gamestartpage_01.png");
  gStart2 = loadImage("img/gamestartpage_02.png");
  choose = loadImage("img/choosepage.png");
  chooseS1 = loadImage("img/choosepage_shushi_01.png");
  chooseS2 = loadImage("img/choosepage_shushi_02.png");
  chooseS3 = loadImage("img/choosepage_shushi_03.png");
  chooseH1 = loadImage("img/choosepage_hotpot_01.png");
  chooseH2 = loadImage("img/choosepage_hotpot_02.png");
  chooseH3 = loadImage("img/choosepage_hotpot_03.png");
  chooseG1 = loadImage("img/choosepage_firemeat_01.png");
  chooseG2 = loadImage("img/choosepage_firemeat_02.png");
  chooseG3 = loadImage("img/choosepage_firemeat_03.png");
  
  sWin = loadImage("img/wl/shushi_win_01.png");
  sWin2 = loadImage("img/wl/shushi_win_02.png");
  sLose = loadImage("img/wl/shushi_lose_01.png");
  sLose2 = loadImage("img/wl/shushi_lose_02.png");
  
  hWin = loadImage("img/wl/hotpot_win_01.png");
  hWin2 = loadImage("img/wl/hotpot_win_02.png");
  hLose = loadImage("img/wl/hotpot_lose_01.png");
  hLose2 = loadImage("img/wl/hotpot_lose_02.png");
  
  gWin = loadImage("img/wl/meat_win_01.png");
  gWin2 = loadImage("img/wl/meat_win_02.png");
  gLose = loadImage("img/wl/meat_lose_01.png");
  gLose2 = loadImage("img/wl/meat_lose_02.png");
  
  //bgMusic
  
  //hotpot part-----------------------------
          //hotpot
          for(int i=0; i<4; i++){
            hHotpotEmpty[i]=loadImage("img/hotpot_00_0"+i+".png");
          }
          for(int i=0; i<4; i++){
            hHotpotHalf[i]=loadImage("img/hotpot_01_0"+i+".png");
          }
          for(int i=0; i<4; i++){
            hHotpotFull[i]=loadImage("img/hotpot_02_0"+i+".png");
          }
          
          //hand
          hHand1=loadImage("img/hand_02.png");
          hHand2=loadImage("img/hand_01.png");
          
          //ingredient
          hIngredient[0]=loadImage("img/fishthing.png");
          hIngredient[1]=loadImage("img/mushroom.png");
          hIngredient[2]=loadImage("img/shrimp.png");
          hIngredient[3]=loadImage("img/tofu.png");
          hIngredient[4]=loadImage("img/vegetable.png");
          hIngredient[5]=loadImage("img/pika.png");
          hIngredient[6]=loadImage("img/pokapi.png");
          hIngredient[7]=loadImage("img/pokeball.png");
          hCurrentIngredient=floor(random(8));
          hNextIngredient=floor(random(8));
          for(int i=0; i<8; i++){
            hIngredientX[i]=-1000;
            hIngredientY[i]=-1000;
            hFalling[i]=false;
            hFallingWrong[i]=false;
          }
          hIngredientX[hCurrentIngredient]=520;
          hIngredientY[hCurrentIngredient]=110;
          hIngredientX[hNextIngredient]=520;
          hIngredientY[hNextIngredient]=110;
          
          //score
          hScore=0;
          
          //sound
          minim=new Minim(this);
          hCorrect=minim.loadSample("sound/Yes.mp3",256);
          hWrong=minim.loadSample("sound/No.mp3",256);
          
          hBoiling=minim.loadFile("sound/Boiling Water.mp3");
          bgMusic=minim.loadFile("sound/bgMusic2.mp3");
          people=minim.loadFile("sound/people.mp3");
          win=minim.loadFile("sound/win.mp3");
          lose=minim.loadFile("sound/lose.mp3");
          japan=minim.loadFile("sound/japan2.mp3");
          bgMusic.play();
          bgMusic.loop();
          
          
          
  //-----------------------------hotpot part
  
  //Grill part------------------------
          bg = loadImage("img/background.png");
          meatRaw = loadImage("img/meat01.png");
          meatOK1 = loadImage("img/meat02_1.png");
          meatOK2 = loadImage("img/meat02_2.png");
          meatOut1 = loadImage("img/meat03_1.png");
          meatOut2 = loadImage("img/meat03_2.png");
          
          //meat ini
          for(int i =0; i<meat.length;i++)
          {
            meat[i] = new Meat();
            meat[i].x = 570+i*120;
            meat[i].y = 250;
          }

  //------------------------Grill part
  
  
  
  //PART sushi-------------------------------------
  imgRailway = loadImage("img/railway0.png");
  imgRice = loadImage("img/rice.png");
  imgHand = loadImage("img/hand.png");
  imgFish0 = loadImage("img/fish0.png");
  imgFish1 = loadImage("img/fish1.png");
  imgFish2 = loadImage("img/fish2.png");
  
  
  railwayX =0;
  railwayY = 350;
  riceX = -460;
  riceY = 370;
  handX = 300;
  handY = 40;
  makeSushi = false;
  doneSushi = false;
  okSushi = false;
  fish0X = 300;
  fish0Y = 50;
  score = 0;
  sTotalTime = 30000;
  sPassedTime = millis();
  //-------------------------------------PART sushi
}

void draw()
{
  
  
  switch(gameMode)
  {
    case 0:
      bgBlink(gStart1,gStart2);
      
    break;
    
    case GAMECHOOSE:
      gameChoose();
      lose.pause();
      win.pause();
      bgMusic.play();
    break;
    
    case HOTPOT:
      hBoiling.play();
      hotpot();
    break;
    
    case SUSHI:
      japan.play();
      sushi();
    break;
    
    case GRILL:
      people.play();
      grill();
    break;
    
    case WIN:
    background(255);
      fill(0);
      textSize(50);
      text("YOU WIN", 200, 300);
      people.pause();
      bgMusic.pause();
      japan.pause();
      win.play();
      
      if(caseNum ==GRILL)
      {
        bgBlink(gWin,gWin2);
      }else if(caseNum == SUSHI)
      {
        bgBlink(sWin,sWin2);
      }else if(caseNum ==HOTPOT)
      {
        bgBlink(hWin,hWin2);
      }
    break;
    
    case LOSE:
      background(255);
      fill(0);
      textSize(50);
      text("YOU LOSE", 200, 300);
      people.pause();
      bgMusic.pause();
      japan.pause();
      lose.play();
      
      if(caseNum ==GRILL)
      {
        bgBlink(gLose,gLose2);
      }else if(caseNum == SUSHI)
      {
        bgBlink(sLose,sLose2);
      }else if(caseNum ==HOTPOT)
      {
        bgBlink(hLose,hLose2);
      }
    break;
  }
}

void keyPressed()
{
  if(gameMode ==0)
  {
    if(key == ENTER)
    {
      gameMode = GAMECHOOSE;
    }
  }else if(gameMode==WIN ||gameMode == LOSE)
  {
    if(key == ENTER)
    {
      gameMode =GAMECHOOSE;
    }
  }
}

void gameChoose()
{
        background(255);
      image(choose,0,0,800,600); 
      if(mouseX>=39 && mouseX <= 255 && mouseY>=333 && mouseY<=549)
      {
        
        if(millis()%1000<333)
        {
          background(255);
          image(chooseS1,0,0,800,600);
        }else if(millis()%1000>666)
        {
          background(255);
          image(chooseS3,0,0,800,600);
        }else
        {
          background(255);
          image(chooseS2,0,0,800,600);
        }
        
        if(mousePressed)
        {
          gameMode = SUSHI;
        }
      }
      if(mouseX>=285 && mouseX <= 501 && mouseY>=57 && mouseY<=333)
      {
        if(millis()%1000<333)
        {
          background(255);
          image(chooseH1,0,0,800,600);
        }else if(millis()%1000>666)
        {
          background(255);
          image(chooseH3,0,0,800,600);
        }else
        {
          background(255);
          image(chooseH2,0,0,800,600);
        }
        
        if(mousePressed)
        {
          gameMode = HOTPOT;
        }
      }
      if(mouseX>=532 && mouseX <= 748 && mouseY>=334 && mouseY<=550)
      {
        if(millis()%1000<333)
        {
          background(255);
          image(chooseG1,0,0,800,600);
        }else if(millis()%1000>666)
        {
          background(255);
          image(chooseG3,0,0,800,600);
        }else
        {
          background(255);
          image(chooseG2,0,0,800,600);
        }
        
        if(mousePressed)
        {
          gameMode = GRILL;
        }
      }
}

void hotpot()
{
  //hotpot
  if(frameCount % (60/4)==0){
   background(255);
   int i=(currentFrame++)%4;
   image(hHotpotEmpty[i], 50, 250, 600, 350);
  }
  if(hScore>10){ 
    if(frameCount % (60/4)==0){
     background(255);
     int i=(currentFrame++)%4;
     image(hHotpotHalf[i], 50, 250, 600, 350);
    }
  }
  if(hScore>20){
    if(frameCount % (60/4)==0){
     background(255);
     int i=(currentFrame++)%4;
     image(hHotpotFull[i], 50, 250, 600, 350);
    }
  }
  
  //hand
  image(hHand1, 500, 0, 330, 200);
  if(mousePressed){
    noStroke();
    fill(255);
    //rect(500, 0, 350, 200);
    image(hHand2, 500, 0, 330, 200);
  }
  
  //ingredient
  switch(hIngredientMode){
  case 1:  
  //throw into hotpot
  if(mousePressed && mouseButton==LEFT){
    hFalling[hCurrentIngredient]=true;
  }
  if(hFalling[hCurrentIngredient]){
    image(hIngredient[hCurrentIngredient], hIngredientX[hCurrentIngredient], hIngredientY[hCurrentIngredient], 100, 100);
    hIngredientY[hCurrentIngredient]+=30;
    hIngredientX[hCurrentIngredient]-=20;
     if(hIngredientY[hCurrentIngredient]>450 && hIngredientX[hCurrentIngredient]>0){
       hFalling[hCurrentIngredient]=false;
       hIngredientY[hCurrentIngredient]=-1000;
       hIngredientX[hCurrentIngredient]=-1000;
       //add score
       if(hCurrentIngredient!=5 && hCurrentIngredient!=6 && hCurrentIngredient!=7){
         hScore++;
         hCorrect.trigger();
       }else{
         hWrong.trigger();
       }
       //reset
       hIngredientMode=2;
       hNextIngredient=floor(random(8));
       hIngredientX[hNextIngredient]=520;
       hIngredientY[hNextIngredient]=110;
     }
  }else{
    image(hIngredient[hCurrentIngredient], hIngredientX[hCurrentIngredient], hIngredientY[hCurrentIngredient], 100, 100);
  }
  
  //throw away
  if(mousePressed && mouseButton==RIGHT){
    hFallingWrong[hCurrentIngredient]=true;
  }
  if(hFallingWrong[hCurrentIngredient]){
    image(hIngredient[hCurrentIngredient], hIngredientX[hCurrentIngredient], hIngredientY[hCurrentIngredient], 100, 100);
    hIngredientY[hCurrentIngredient]+=30;
    hIngredientX[hCurrentIngredient]+=30;
     if(hIngredientY[hCurrentIngredient]>450 && hIngredientX[hCurrentIngredient]>0){
       hFallingWrong[hCurrentIngredient]=false;
       hIngredientY[hCurrentIngredient]=-1000;
       hIngredientX[hCurrentIngredient]=-1000;
       //add score
       if(hCurrentIngredient==5 || hCurrentIngredient==6 || hCurrentIngredient==7){
         hScore++;
         hCorrect.trigger();
       }else{
         hWrong.trigger();
       }
       //reset
       hIngredientMode=2;
       hNextIngredient=floor(random(8));
       hIngredientX[hNextIngredient]=520;
       hIngredientY[hNextIngredient]=110;
     }
  }else{
    image(hIngredient[hCurrentIngredient], hIngredientX[hCurrentIngredient], hIngredientY[hCurrentIngredient], 100, 100);
  }

  break;
  
  case 2:
  //throw into hotpot
  if(mousePressed && mouseButton==LEFT){
    hFalling[hNextIngredient]=true;
  }
  if(hFalling[hNextIngredient]){
    image(hIngredient[hNextIngredient], hIngredientX[hNextIngredient], hIngredientY[hNextIngredient], 100, 100);
    hIngredientY[hNextIngredient]+=30;
    hIngredientX[hNextIngredient]-=20;
     if(hIngredientY[hNextIngredient]>450 && hIngredientX[hNextIngredient]>0){
       hFalling[hNextIngredient]=false;
       hIngredientY[hNextIngredient]=-1000;
       hIngredientX[hNextIngredient]=-1000;
       //add score
       if(hNextIngredient!=5 && hNextIngredient!=6 && hNextIngredient!=7){
         hScore++;
         hCorrect.trigger();
       }else{
         hWrong.trigger();
       }
       //reset
       hIngredientMode=1;
       hCurrentIngredient=floor(random(8));
       hIngredientX[hCurrentIngredient]=520;
       hIngredientY[hCurrentIngredient]=110;
     }
  }else{
    image(hIngredient[hNextIngredient], hIngredientX[hNextIngredient], hIngredientY[hNextIngredient], 100, 100);
  }
  
  //throw away
  if(mousePressed && mouseButton==RIGHT){
    hFallingWrong[hNextIngredient]=true;
  }
  if(hFallingWrong[hNextIngredient]){
    image(hIngredient[hNextIngredient], hIngredientX[hNextIngredient], hIngredientY[hNextIngredient], 100, 100);
    hIngredientY[hNextIngredient]+=30;
    hIngredientX[hNextIngredient]+=30;
     if(hIngredientY[hNextIngredient]>450 && hIngredientX[hNextIngredient]>0){
       hFallingWrong[hNextIngredient]=false;
       hIngredientY[hNextIngredient]=-1000;
       hIngredientX[hNextIngredient]=-1000;
       //add score
       if(hNextIngredient==5 || hNextIngredient==6 || hNextIngredient==7){
         hScore++;
         hCorrect.trigger();
       }else{
         hWrong.trigger();
       }
       //reset
       hIngredientMode=1;
       hCurrentIngredient=floor(random(8));
       hIngredientX[hCurrentIngredient]=520;
       hIngredientY[hCurrentIngredient]=110;
     }
  }else{
    image(hIngredient[hNextIngredient], hIngredientX[hNextIngredient], hIngredientY[hNextIngredient], 100, 100);
  }
  
  }

  //score
  fill(0);
  textSize(30);
  text("Score: "+hScore,15,30);
  
      //hotpotTime
  if(frameCount%60 ==0)
  {
    gTime--;
  }
  text("Time: "+gTime,185,30);
  if(gTime<=0)
  {
    if(hScore>=30)
    {
      gameMode = WIN;
      caseNum = HOTPOT;
    }else
    {
      gameMode = LOSE;
      caseNum = HOTPOT;
    }
    gTime = 30;
    hScore =0;
  }

}

void grill()
{
  //bg
  image(bg,0,0,800,600);
  //rect(131,394,583,158);
  //rect(0,229,218,161);
  //prepare meat show
  for(int i =0; i<meat.length;i++)
  {
    meat[i].show(meatRaw);
  }
  //image(meatOK1,573,180,97,205);
  
  //mouse Control Meat
  if(mousePressed)
  {
    for(int i =0; i<meat.length; i++)
    {
      if(mouseX>=meat[i].x-20 && mouseX<=meat[i].x +117 && mouseY>=meat[i].y-20 && mouseY <= meat[i].y+158)
      {
        meat[i].x = mouseX-45;
        meat[i].y = mouseY-90;
        move = true;
      }
    }
  }
  
  //prepare meat move forward
  if(move)
  {
    for(int i =0; i<meat.length;i++)
    {
      if(meat[i].x>=690)
      {
        meat[i].x -=5;
        moveCounter++;
      }
      
      if(moveCounter==20)
      {
        move = false;
        moveCounter = 0;
      }
    }
  }
  
  //gDegree Change
    for(int i =0; i<meat.length; i++)
    {
      if(meat[i].x>=131 &&meat[i].x<=617 && meat[i].y>=398 && meat[i].y <=477)
      {
        meat[i].gDegree++;
      }
      
      //meat ok
      if(meat[i].gDegree>=150 && meat[i].gDegree<=220)
      {
        if(millis()%500 <=250 )
        {
          meat[i].showOK(meatOK1);
        }else
        {
          meat[i].showOK(meatOK2);
        }
      }
      
      //meat over 
      if(meat[i].gDegree>220)
      {
        if(millis()%500 <=250 )
        {
          meat[i].showOK(meatOut1);
        }else
        {
          meat[i].showOK(meatOut2);
        }
      }
    }
      
      //score
  textSize(30);
  text("Score: "+gScore,15,30);
      //grillTime and winCondi
  if(frameCount%60 ==0)
  {
    gTime--;
  }
  text("Time: "+gTime,185,30);
  if(gTime<=0)
  {
    if(gScore>=250)
    {
      gameMode = WIN;
      caseNum = GRILL;
    }else
    {
      gameMode = LOSE;
      caseNum = GRILL;
    }
    gTime = 30;
    gScore =0;
              //meat reset
          for(int i =0; i<meat.length;i++)
          {
            meat[i].x = 570+i*120;
            meat[i].y = 250;
            meat[i].gDegree = 0;
          }
  }

}

void mouseReleased()
{
  if(gameMode == GRILL)
  {
    for(int i =0; i<meat.length; i++)
    {
      //the meat released in the OK Area
      if(meat[i].x>=0 && meat[i].x <=158 && meat[i].y>=229 && meat[i].y<=264)
      {
        if(meat[i].gDegree<150)
        {
          gScore-=5;
          hWrong.trigger();
        }else if(meat[i].gDegree>=150 && meat[i].gDegree<=220)
        {
          gScore+=10;
          hCorrect.trigger();
        }else
        {
          gScore-=10;
          hWrong.trigger();
        }
        meat[i].y = -1000;
      }
    }
  }
  
  if(gameMode == SUSHI)
  {
      //rice
      
      if((riceX>=200 && riceX<=330) ||(riceX2>=200 && riceX2<=330))
      {
        score++;
        hCorrect.trigger();
      }
      makeSushi = true;
      doneSushi = true;
      okSushi = true;
      if(makeSushi == true){
      image(imgHand,handX2,handY2,600,200);
      handX2 = 300;
      handY2 = 350;
      timer++;
      if(timer == 1){
        handY = 40;
        timer = 0;
        makeSushi = false;
        
      }
      
  }
  }
}


//sushi part void-----------------------------------------
void sushi()
{
    background(255);
  switch(sGameState){ 
  case sGameRun:
  background(255);
  drawRailway();
  drawRice();
  drawScore();
  sDrawTimer();
  railwaySpeed+=0.02;
  
  switch(fishState){
    case fish0:
    image(imgFish0,fish0X,fish0Y,300,100);
    if(doneSushi == true){
      fishState = fish1;
      doneSushi = false;
    }
    break;
    case fish1:
    image(imgFish0,fish0X,fish0Y,300,100);
      fish0X += railwaySpeed;
      fish0Y = 350;
    image(imgFish1,fish1X,fish1Y,300,100);
    fish1X = 300;
    fish1Y = 50;
    if(doneSushi == true){
      fishState = fish2;
      doneSushi = false;
    }
    break;
    case fish2:
    image(imgFish1,fish1X,fish1Y,300,100);
      fish1X += railwaySpeed;
      fish1Y = 350;
    fish2X = 300;
    fish2Y = 50;
    image(imgFish2,fish2X,fish2Y,300,100);
    if(doneSushi == true){
      fishState = fish3;
      doneSushi = false;
    }
    break;
    case fish3:
    image(imgFish2,fish2X,fish2Y,300,100);
      fish2X += railwaySpeed;
      fish2Y = 350;
    image(imgFish0,fish0X,fish0Y,300,100);
    fish0X = 300;
    fish0Y = 50;
    if(doneSushi == true){
      fishState = fish1;
      doneSushi = false;
    }
    break;
  }
  drawHand();
  break;
  }
}



void drawRailway(){
  image(imgRailway,railwayX,railwayY,800,250);
  image(imgRailway,railwayX-700,railwayY,800,250);
  railwayX += railwaySpeed;
  railwayX %= 700;
}

void drawRice(){
    image(imgRice,riceX,riceY,300,150);
    riceX2 = riceX-700;
    image(imgRice,riceX2,riceY,300,150);
    riceX+=railwaySpeed;
    riceX%=700;
}
void drawHand(){
  image(imgHand,handX,handY,600,200);
}
void sDrawTimer(){
  //sushiTime and win condi
  if(frameCount%60 ==0)
  {
    gTime--;
  }
  text("Time: "+gTime,10,200);
  if(gTime<=0)
  {
    if(score>=40)
    {
      gameMode = WIN;
      caseNum = SUSHI;
    }else
    {
      gameMode = LOSE;
      caseNum = SUSHI;
    }
    gTime = 30;
    score =0;
    railwaySpeed = 10;
  }
}

boolean isHitGood(float ax, float bx){
  if(ax+100 >= bx && ax-100 <= bx ){
    return true;
  }else{
    return false;
  }
}
void drawScore(){
  fill(0);
  textSize(50);
  text("Score: " + score, 10, 100);  
}

void keyReleased(){
  if (key == ENTER) {
    switch(sGameState) {
      case sGameStart:
         sGameState = sGameRun;
      case sGameWin:
         sGameState = sGameRun;
         score = 0;
      default : break ;
    }
  }
}

void bgBlink(PImage img,PImage img2)
{
    if(second()%2 ==0)
    {
      background(255);
      image(img,0,0,800,600);
    }else
    {
      background(255);
      image(img2,0,0,800,600);
    }
}