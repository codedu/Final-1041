import ddf.minim.*;
Minim minim;
AudioPlayer theme;
Background bg;
Player player;
Enemy enemy;
Bossenemy bossenemy;
Money money;
Treasure treasure;
HPDisplay pig;
float timer;
PImage bg2, bg21 , bg22, bg23 , bg3, bg31, bg4, bg41;
int te, tb, tt, ts;
boolean protect=false;

void setup(){
  size(640,480);
  minim = new Minim(this);
  theme = minim.loadFile("audio/theme.mp3");
  bg = new Background();
  bg2 = loadImage("img/bg2.png");
  bg21 = loadImage("img/bg21.png");
  bg22 = loadImage("img/bg22.png");
  bg23 = loadImage("img/bg23.png");
  bg3 = loadImage("img/bg3.png");
  bg31 = loadImage("img/bg31.png");
  bg4 = loadImage("img/bg4.png");
  bg41 = loadImage("img/bg41.png");
  player = new Player(1);
  pig = new HPDisplay(); 
  treasure = new Treasure();
  frameRate(24);
  
  theme.play();
  theme.loop();
  }
  
  final int GAME_START=0,GAME_INSTRUCT=1,GAME_RUN=2,GAME_OVER=3 ;
  int gameState ;

void draw(){
  switch(gameState){
    
    case GAME_START:  
     image(bg2,0,0);
         if( 40<mouseX && mouseX<100 && 100<mouseY && mouseY<360  ){
         if(mousePressed){
         gameState=GAME_RUN;
         player = new Player(1); 
         }else{
         image(bg21,0,0);
         }
         }
         
         if( 540<mouseX && mouseX<600 && 100<mouseY && mouseY<360  ){
         if(mousePressed){
         gameState=GAME_RUN;
         player = new Player(2); 
         }else{
         image(bg22,0,0);
         }
         }
         
         if( 180<mouseX && mouseX<400 && 380<mouseY && mouseY<450  ){
         if(mousePressed){
         gameState=GAME_INSTRUCT; 
         }else{
         image(bg23,0,0);
         }
         }
         
  timer=0;
  te=0;
  tb=0;
  ts=0;
  tt=0;
    treasure = new Treasure();
    protect=false;
         
    break;
    
    case GAME_INSTRUCT:
        image(bg3,0,0); 
        if( 400<mouseX && mouseX<500 && 400<mouseY && mouseY<450  ) {
        if(mousePressed){
           gameState=GAME_START;
        }else{
         image(bg31,0,0);
        }
        }
    break;
    
    case GAME_RUN:
  timer+=2;
  background(255);
  bg.draw();
        pig.updateWallet(player.hp);
  player.draw();
  
//bossenemy and jumpShoes
if(bossenemy!=null){
    if(timer%360==0){
    bossenemy.a=0;
    bossenemy = null;
    tb=0;
}
}
if(bossenemy==null){
  if(timer%1080==0){ 
  bossenemy = new Bossenemy();}
  }
if(bossenemy!=null){
  bossenemy.draw();
  if(protect==false){
  if(bossenemy.enemyIsCollideWithPlayer()){
    bossenemy.bossSFX.play();
    tb++;
  if(tb==1){
  player.hpDownDown();
}
  }
 }
 
 //shoes
  if(bossenemy.treasureIsCollideWithPlayer()){
    bossenemy.shoeSFX.play();
    bossenemy.jumpshoes=null;
    bossenemy.draw();
    player.g=4;
  }
  }
  if(player.g==4){
     tt++;
      if(tt>100){
    player.g=6.8;
    tt=0;
    }
  }

  
//enemy
if(enemy!=null){
if(timer%180==0){
  enemy.a=0;
  enemy = null;
  te=0;
  }}
if(timer%180==0 || timer==0){
  enemy = new Enemy(floor(random(1, 6)));    
  }
if(enemy!=null){
  enemy.draw();
    if(protect==false){
  if(enemy.isCollideWithPlayer()){
    enemy.enemySFX.play();
    te++;
  if(te==1){
  player.hpDown();
}
  }
  }
}
  
//money
if(money!=null){
  if((timer-90)%180==0){
  money.a=0;
  money = null;
  }}
if((timer-90)%180==0){
  money = new Money();    
  }
if(money!=null){
  money.draw();
  if(money.isCollideWithPlayer()){
    money.moneySFX.play();
  player.hpUp();
  money = null;
  }
}
  
//superStar
if(treasure!=null){
  if(timer%180==0){
  treasure.a=0;
  treasure.x = 1000;
  }
if(timer%361==0){
  treasure.x=765;
  }
}
if(treasure!=null){
  treasure.draw();
  if(treasure.isCollideWithPlayer()){
    protect=true;
    treasure.starSFX.play();
    treasure.x=1000;
  }
      if(protect==true){
     ts++;
     println(ts);
     if(ts==150){
     protect=false;
     ts=0;
     }
    }
} 
  


   break;
   
case GAME_OVER:
  
  
    image(bg4,0,0);
    if(mouseX<520 && 380<mouseX && mouseY<450  && 350<mouseY){
     if(mousePressed){
      gameState=GAME_START;
     bg.a=0;
     }else{ 
       image(bg41,0,0);
     }
    }
      enemy =null;
  treasure = null;
  money = null;
  bossenemy = null;
    
    
    break; 
}
}

void keyPressed(){
if(key==' '){
player.jump();
  if(player.g==6.8){
    player.jumpSFX.play();
  }else{
    player.highjumpSFX.play();
  }
}
}