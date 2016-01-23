int gameState;
final int beginning=0, explain1=1, game1=2, explain2=3, game2=4, explain3=5, game3=6;

int time = 0;
boolean rightPressed=false,leftPressed=false;
PImage clockImg,start;
Cable cable;
Bg explain_1;
Bg game_1;
Bg win_1;
Bg lose_1;

Bg explain_2;
Bg game_2;
Bg win_2;
Bg lose_2;

Bg explain_3;
Bg game_3;
Bg win_3;
Bg lose_3;

Strong lion;
Strong blackbear;
Strong croco;
Strong owl;
Strong penguin;
Strong polarbear;

Weak koala;
Weak panda;
Weak rabbit;
Weak sheep;
Weak deer;
Weak squ;

Couple a;
Couple b;
Couple c;
Shooter shooter;

Tea tea;

import ddf.minim.*;

Minim minim;
AudioPlayer begin, explain, animal, couple, teatime, win, lose;
boolean beginplay=false, explainplay=false, animalplay=false, coupleplay=false, teatimeplay=false, winplay=false, loseplay=false; 

void setup(){
size(640,480);
gameState=0;
imageMode(CENTER);
clockImg=loadImage("game3/clock.png");
start=loadImage("start.png");
cable = new Cable();

lion=new Strong("game1/strong/lion.png");
blackbear=new Strong("game1/strong/blackbear.png");
croco=new Strong("game1/strong/crocodile.png");
owl=new Strong("game1/strong/owl.png");
penguin=new Strong("game1/strong/penguin.png");
polarbear=new Strong("game1/strong/polarbear.png");
koala=new Weak("game1/weak/koala.png");
panda=new Weak("game1/weak/panda.png");
rabbit=new Weak("game1/weak/rabbit.png");
sheep=new Weak("game1/weak/sheep.png");
deer=new Weak("game1/weak/reindeer.png");
squ=new Weak("game1/weak/squirrel.png");

explain_1=new Bg("game1/animalinfo.png");
game_1=new Bg("game1/animalbg.png");
win_1=new Bg("game1/win1.png");
lose_1=new Bg("game1/lose1.png");


explain_3=new Bg("game3/teainfo.png");
game_3=new Bg("game3/teabg.png");
win_3=new Bg("game3/win3.png");
lose_3=new Bg("game3/lose3.png");

shooter=new Shooter();
a=new Couple("game2/couple1.png");
b=new Couple("game2/couple2.png");
c=new Couple("game2/couple3.png");
tea=new Tea();

minim=new Minim (this);

begin=minim.loadFile("music/beginning.wav");
explain=minim.loadFile("music/explain.wav");
animal=minim.loadFile("music/game1.mp3");
couple=minim.loadFile("music/game2.aiff");
teatime=minim.loadFile("music/game3.mp3");
win=minim.loadFile("music/win.wav");
lose=minim.loadFile("music/lose.wav");
}

void draw(){
  
  
  
  switch(gameState){
    
  case 0:
  
  cable.display();
  cable.move();
  beginplay=true;
  if(cable.cableX>800){
  gameState=1;
  time=0;
  beginplay=false;
  }
  break;
  
  case 1:
  explain_1.display(320,240);
  image(start,150,360);
  explainplay=true;
  if(mousePressed&&mouseX>59&&mouseX<241&&mouseY>331&&mouseY<389){
  gameState=2;
  explainplay=false;
  }
  
  break;
  
  case 2:
  time++;
  
  if(time/60<=20){
  animalplay=true; 
  game_1.display(320,240);
  
  
  penguin.move();
  penguin.display();
  polarbear.move();
  polarbear.display();
  blackbear.move();
  blackbear.display();
  lion.move();
  lion.display();
  owl.move();
  owl.display();
  croco.move();
  croco.display();
  
  
  panda.move();
  panda.display();
  rabbit.move();
  rabbit.display();
  deer.move();
  deer.display();
  sheep.move();
  sheep.display();
  squ.move();
  squ.display();
  koala.move();
  koala.display();
  
  lion.put();
  if(lion.isPut==true){
  lion.img.resize(0,80);
  lion.x=410;
  lion.y=100;
  }
  
  croco.put();
  if(croco.isPut==true){
  croco.img.resize(0,80);
  croco.x=475;
  croco.y=100;
  }
  
  owl.put();
  if(owl.isPut==true){
  owl.img.resize(0,60);
  owl.x=550;
  owl.y=105;
  }
  
  penguin.put();
  if(penguin.isPut==true){
  penguin.img.resize(0,65);
  penguin.x=410;
  penguin.y=50;
  }
  
  polarbear.put();
  if(polarbear.isPut==true){
  polarbear.img.resize(0,70);
  polarbear.x=480;
  polarbear.y=45;
  }
  
  blackbear.put();
  if(blackbear.isPut==true){
  blackbear.img.resize(0,70);
  blackbear.x=540;
  blackbear.y=45;
  }
  
  koala.put();
  if(koala.isPut==true){
  koala.img.resize(0,60);
  koala.x=165;
  koala.y=101;
  }
  
  panda.put();
  if(panda.isPut==true){
  panda.img.resize(0,75);
  panda.x=105;
  panda.y=40;
  }
  
  rabbit.put();
  if(rabbit.isPut==true){
  rabbit.img.resize(0,80);
  rabbit.x=220;
  rabbit.y=40;
  }
  
  deer.put();
  if(deer.isPut==true){
  deer.img.resize(0,80);
  deer.x=165;
  deer.y=40;
  }
  
  sheep.put();
  if(sheep.isPut==true){
  sheep.img.resize(0,90);
  sheep.x=95;
  sheep.y=90;
  }
  
  squ.put();
  if(squ.isPut==true){
  squ.img.resize(0,75);
  squ.x=240;
  squ.y=95;
  }
  
  }
  if(time/60>20){
  animalplay=false;
  if(koala.isPut==true&&rabbit.isPut==true&&deer.isPut==true&&sheep.isPut==true&&squ.isPut==true&&panda.isPut==true&&lion.isPut==true&&croco.isPut==true&&penguin.isPut==true&&owl.isPut==true&&polarbear.isPut==true&&blackbear.isPut==true){
  win_1.display(320,240);
  winplay=true;
  if(time/60>25){
  gameState=5;
  winplay=false;
  time=0;
  }
  }else{
  lose_1.display(320,240); 
  loseplay=true;
  if(keyPressed&&key==ENTER){
  loseplay=false;
  gameState=0;
  cable.cableX=-100;
  cable.cableY=415;
  cable.cableAddWidth = 16.3;
  cable.cableAddHeight = 28.2;
  }
  }
  }
  
  
  
  break;
  
  case 3:
 
  explain_2.display(320,240);
  image(start,150,360);
  explainplay=true;
  if(mousePressed&&mouseX>59&&mouseX<241&&mouseY>331&&mouseY<389){
  gameState=4;
  explainplay=false;
  }
  break;
  
  case 4:
  time++;
  
  if(time/60<=60){
  game_2.display(320,240);
  coupleplay=true;
  shooter.display();
  
  
  a.display();
  a.move();
  
  b.display();
  b.move();
  
  c.display();
  c.move();
  
  

  
  
  if(a.isDragged==true){
  a.x=mouseX;
  a.y=mouseY;
  }
  if(b.isDragged==true){
  b.x=mouseX;
  b.y=mouseY;
  }
  if(c.isDragged==true){
  c.x=mouseX;
  c.y=mouseY;
  }
  if(b.isPut==false&&c.isPut==false){
  a.put();
  }
  if(a.isPut==false&&c.isPut==false){
  b.put();
  }
  if(b.isPut==false&&a.isPut==false){
  c.put();
  }
  
  
  if(a.isPut==true&&a.isDragged==false){
  a.x=515;
  a.y=220;
  shooter.shoot();

  }
  if(b.isPut==true){
  b.x=515;
  b.y=220;
  shooter.shoot();
  }
  if(c.isPut==true){
  c.x=515;
  c.y=220;
  shooter.shoot();
  }
  
  
  }else{
    gameState=5;
    time=0;
    coupleplay=false;
  }
  break;
  
  case 5:
  explain_3.display(320,240);
  image(start,150,360);
  explainplay=true;
  if(mousePressed&&mouseX>59&&mouseX<241&&mouseY>331&&mouseY<389){
  gameState=6;
  explainplay=false;
  }
 
  break;
  
  case 6:
  time++;
  if(time/60<=30){
  teatimeplay=true;
  game_3.display(320,240);
  tea.draw();
  }
  
  
  
  
  if(time/60>30){
  teatimeplay=false;
  if(tea.countNbr>=10){
  win_3.display(320,240);
  winplay=true;
  }else{
  lose_3.display(320,240);
  loseplay=true;
  }
  if(keyPressed&&key==ENTER){
  loseplay=false;
  winplay=true;
  gameState=0;
  cable.cableX=-100;
  cable.cableY = 415;
  cable.cableAddWidth = 16.3;
  cable.cableAddHeight = 28.2;
  }
  }
  break;

  }//switch
  if(gameState!=0&&gameState!=1&&gameState!=3&&gameState!=5){
    if(gameState==2&&time/60<20){
    fill(#36C6BB);
    image(clockImg,45,35);
    textAlign(CENTER);
    textSize(30);
    text(20-time/60,45,46);
    }else if((gameState==4||gameState==6)&&time/60<30){
    fill(#36C6BB);
    image(clockImg,45,35);
    textAlign(CENTER);
    textSize(30);
    text(30-time/60,45,46);
    }
  }
  
  if(beginplay==true){
  begin.play();
  }else{
  begin.pause();
  }
  if(explainplay==true){
  explain.play();
  }else{
  explain.pause();
  }
  if(animalplay==true){
  animal.play();
  }else{
  animal.pause();
  }
  if(coupleplay==true){
  couple.play();
  }else{
  couple.pause();
  }
  if(teatimeplay==true){
  teatime.play();
  }else{
  teatime.pause();
  }
  if(loseplay==true){
  lose.play();
  }else{
  lose.pause();
  }
  if(winplay==true){
  win.play();
  }else{
  win.pause();
  }
}

void mouseDragged(){
 if(gameState==2){
 if(mouseX>blackbear.x-blackbear.img.width/2 && mouseX<blackbear.x+blackbear.img.width/2 && mouseY>blackbear.y-blackbear.img.height/2 && mouseY<blackbear.y+blackbear.img.height/2){
 if(koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==panda.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==polarbear.isDragged==false){
 blackbear.isDragged=true;
 }
 }
 if(mouseX>croco.x-croco.img.width/2 && mouseX<croco.x+croco.img.width/2 && mouseY>croco.y-croco.img.height/2 && mouseY<croco.y+croco.img.height/2){
 if(koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==panda.isDragged==lion.isDragged==blackbear.isDragged==penguin.isDragged==owl.isDragged==polarbear.isDragged==false){
 croco.isDragged=true;
 }
 }
 if(mouseX>lion.x-lion.img.width/2 && mouseX<lion.x+lion.img.width/2 && mouseY>lion.y-lion.img.height/2 && mouseY<lion.y+lion.img.height/2){
 if(koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==panda.isDragged==blackbear.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==polarbear.isDragged==false){
 lion.isDragged=true;
 }
 }
 if(mouseX>penguin.x-penguin.img.width/2 && mouseX<penguin.x+penguin.img.width/2 && mouseY>penguin.y-penguin.img.height/2 && mouseY<penguin.y+penguin.img.height/2){
 if(koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==panda.isDragged==lion.isDragged==croco.isDragged==blackbear.isDragged==owl.isDragged==polarbear.isDragged==false){
 penguin.isDragged=true;
 }
 }
 if(mouseX>owl.x-owl.img.width/2 && mouseX<owl.x+owl.img.width/2 && mouseY>owl.y-owl.img.height/2 && mouseY<owl.y+owl.img.height/2){
 if(koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==panda.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==blackbear.isDragged==polarbear.isDragged==false){
 owl.isDragged=true;
 }
 }
 if(mouseX>polarbear.x-polarbear.img.width/2 && mouseX<polarbear.x+polarbear.img.width/2 && mouseY>polarbear.y-polarbear.img.height/2 && mouseY<polarbear.y+polarbear.img.height/2){
 if(koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==panda.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==false){
 polarbear.isDragged=true;
 }
 }
 if(mouseX>koala.x-koala.img.width/2 && mouseX<koala.x+koala.img.width/2 && mouseY>koala.y-koala.img.height/2 && mouseY<koala.y+koala.img.height/2){
 if(polarbear.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==panda.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==false){
 koala.isDragged=true;
 }
 }
 if(mouseX>panda.x-panda.img.width/2 && mouseX<panda.x+panda.img.width/2 && mouseY>panda.y-panda.img.height/2 && mouseY<panda.y+panda.img.height/2){
 if(polarbear.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==koala.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==false){
 panda.isDragged=true;
 }
 }
 if(mouseX>rabbit.x-rabbit.img.width/2 && mouseX<rabbit.x+rabbit.img.width/2 && mouseY>rabbit.y-rabbit.img.height/2 && mouseY<rabbit.y+rabbit.img.height/2){
 if(polarbear.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==panda.isDragged==koala.isDragged==deer.isDragged==sheep.isDragged==squ.isDragged==false){
 rabbit.isDragged=true;
 }
 }
 if(mouseX>deer.x-deer.img.width/2 && mouseX<deer.x+deer.img.width/2 && mouseY>deer.y-deer.img.height/2 && mouseY<deer.y+deer.img.height/2){
 if(polarbear.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==panda.isDragged==rabbit.isDragged==koala.isDragged==sheep.isDragged==squ.isDragged==false){
 deer.isDragged=true;
 }
 }
 if(mouseX>sheep.x-sheep.img.width/2 && mouseX<sheep.x+sheep.img.width/2 && mouseY>sheep.y-sheep.img.height/2 && mouseY<sheep.y+sheep.img.height/2){
 if(polarbear.isDragged==lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==panda.isDragged==rabbit.isDragged==deer.isDragged==koala.isDragged==squ.isDragged==false){
 sheep.isDragged=true;
 }
 }
 if(mouseX>squ.x-squ.img.width/2 && mouseX<squ.x+squ.img.width/2 && mouseY>squ.y-squ.img.height/2 && mouseY<squ.y+squ.img.height/2){
 if(lion.isDragged==croco.isDragged==penguin.isDragged==owl.isDragged==blackbear.isDragged==polarbear.isDragged==panda.isDragged==rabbit.isDragged==deer.isDragged==sheep.isDragged==koala.isDragged==false){
 squ.isDragged=true;
 }
 }
 }
 
 if(gameState==4){
 if(mouseX>a.x-a.img.width/2&&mouseX<a.x+a.img.width/2&&mouseY>a.y-a.img.height/2&&mouseY<a.y+a.img.height/2){
  if(b.isDragged==false&&c.isDragged==false){
  a.isDragged=true;
  }
  }
  if(mouseX>b.x-b.img.width/2&&mouseX<b.x+b.img.width/2&&mouseY>b.y-b.img.height/2&&mouseY<b.y+b.img.height/2){
    if(a.isDragged==false&&c.isDragged==false){
    b.isDragged=true;
    }
  }
  if(mouseX>c.x-c.img.width/2&&mouseX<c.x+c.img.width/2&&mouseY>c.y-c.img.height/2&&mouseY<c.y+c.img.height/2){
    if(b.isDragged==false&&a.isDragged==false){
    c.isDragged=true;
    }
  }
 }
 
}

void mouseReleased(){
  if(gameState==2){
  blackbear.isDragged=lion.isDragged=croco.isDragged=penguin.isDragged=owl.isDragged=polarbear.isDragged=false;
  koala.isDragged=panda.isDragged=rabbit.isDragged=sheep.isDragged=deer.isDragged=squ.isDragged=false;
  }
  if(gameState==4&&a.isPut==false&&b.isPut==false&&c.isPut==false){
  a.isDragged=b.isDragged=c.isDragged=false;
  }
  
  
}
void keyPressed(){
  if(gameState==6){
  if(key==CODED){
    switch(keyCode){
    case RIGHT:
      rightPressed=true;
      break;
    case LEFT:
      leftPressed=true;
      break;
    }
  }
  if(tea.dropDetect==true){
  if(key==' '){
  tea.countNbr++;
  tea.dropCount=0;
  tea.dropDetect=false;
  }
  }
  }
 
  
}
  
void keyReleased(){
  if(gameState==6){
  if(key==CODED){
  switch(keyCode){  
    case RIGHT:
      rightPressed=false;
      break;
    case LEFT:
      leftPressed=false;
      break;   
    }
  }
  }

}