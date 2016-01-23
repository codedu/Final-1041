import ddf.minim.*;

Minim minim;
AudioPlayer openMusic;
AudioPlayer music1;
AudioPlayer music2;
AudioPlayer music3;
AudioPlayer failMusic;

Start start;
Story story;
Rule1 rule1;
Rule2 rule2;
Rule3 rule3;
Level level1;
Level level2;
Level level3;
Pass pass;
Lose lose;
Jones jones;
Obstacle obstacle;
Obstacle2 obstacle2;
Obstacle3 obstacle3;
Sheep [] sheeps;
Background background1;
Background_2 background2;
Background background3;
Ground ground;
ScoringBoard scoringBoard;
End end;
float groundHeight=60;

int gameState;
final int GAME_START =0;
final int GAME_STORY =1;
final int GAME_RULE1 =2;
final int GAME_RULE2 =3;
final int GAME_RULE3 =4;
final int GAME_RUN =5;
final int GAME_FAIL=6;
final int GAME_END =7;

int stage ;
final int STAGE_1 =0;
final int STAGE_2 =1;
final int STAGE_3 =2;

int count=0;
int a=0;
        
  
void setup(){
  size(640,480);
  start= new Start();
  story= new Story();
  rule1= new Rule1();
  rule2= new Rule2();
  rule3= new Rule3();
  level1= new Level("level1.png");
  level2= new Level("level2.png");
  level3= new Level("level3.png");
  lose= new Lose();
  jones= new Jones();
  obstacle= new Obstacle("fence.png");
  obstacle2= new Obstacle2("fence.png");
  obstacle3= new Obstacle3("fence.png");
  //for(int i=0; i<obstacles.length; i++){
  // obstacles[i] = new Obstacle("fence.png",(i+1)*700);
  //}
  sheeps = new Sheep[11];
  for(int i=0; i<sheeps.length; i++){
    sheeps[i] = new Sheep((i+1)*1400);
  }
  background1 = new Background("bg1_1.png","bg1_2.png");
  background2 = new Background_2();
  background3 = new Background("bg3_1.jpg","bg3_2.jpg");
  scoringBoard = new ScoringBoard();
  end = new End();
  groundHeight=60;
  
   minim=new Minim(this);
  
  openMusic=minim.loadFile("openMusic.mp3");
  music1=minim.loadFile("music1.mp3");
  music2=minim.loadFile("music2.mp3");
  music3=minim.loadFile("music3.mp3");
  failMusic=minim.loadFile("failMusic.mp3");
    
}

void draw(){
  switch(gameState){
    case GAME_START:
    start.bgDisplay();
    start.wordDisplay();
    start.sheepDisplay();
    openMusic.play();
    break;
    
    case GAME_STORY:
    story.display();
    break;
    
    case GAME_RULE1:
    rule1.display();
    break;
    
    case GAME_RULE2:
    rule2.display();
    break;
    
    case GAME_RULE3:
    rule3.display();
    break;
    
    case GAME_RUN:
     openMusic.pause();
    switch (stage){
    case STAGE_1:
    failMusic.pause();
    music1.play();
    count++;
    if(level1.showLevel){
      level1.display();
    }else{
      background1.display();
       //for(int i=0; i<obstacles.length; i++){
      obstacle.display();
      obstacle.move();

      //}

      if(jones.alive()){        
        jones.getStuck();
   
        jones.display();
        jones.backToPosition();
        jones.capture();
      }
      jones.falling();
      
      println(a);
      for(int i=0; i<sheeps.length; i++){
      if(sheeps[i].alive()){
        sheeps[i].display();
        sheeps[i].move();
        sheeps[i].followJones();
      }
      if(sheeps[i].alive()==false){
        sheeps[i].sheepBeSubtracted = true;
      }
      sheeps[i].falling();
      }
      
      scoringBoard.showSheepNum();
      scoringBoard.sheepNumChange();
    }
    
      if(count == 3360){
        if(scoringBoard.sheepNum <6){
          gameState = GAME_FAIL;
          music1.pause();
          scoringBoard.reset();
          for(int i=0; i<sheeps.length; i++){
          sheeps[i].reset((i+1)*1400);}
          stage=STAGE_1;
          count =0;
          level1.showLevel = true;
          return;
        }else{
        scoringBoard.reset();
        for(int i=0; i<sheeps.length; i++){
        sheeps[i].reset((i+1)*1400);}
        stage=STAGE_2;
        count =0;
        music1.pause();}
      }
     if(jones.alive() == false){
      gameState = GAME_FAIL;
    }
    break;
    
    case STAGE_2:
     music2.play();
     count++;
     if(level2.showLevel){
      level2.display();
    }else{
      background2.display();
       obstacle2.display();
       obstacle2.move();
       //for(int i=0; i<obstacles.length; i++){
       // obstacles[i].display();
       // obstacles[i].move();
      //}
      if(jones.alive()){
        jones.getStuck();
        jones.display();
        jones.backToPosition();
        jones.capture();
      }
      jones.falling();
      
      for(int i=0; i<sheeps.length; i++){
      if(sheeps[i].alive()){
        sheeps[i].display();
        sheeps[i].move();
        sheeps[i].followJones();
      }
      if(sheeps[i].alive()==false){
        sheeps[i].sheepBeSubtracted = true;
      }
      sheeps[i].falling();
      }
      
      scoringBoard.showSheepNum();
      scoringBoard.sheepNumChange();
    }
      if(count == 3360){
          if(scoringBoard.sheepNum <8){
          gameState = GAME_FAIL;
          music2.pause();
          scoringBoard.reset();
          for(int i=0; i<sheeps.length; i++){
          sheeps[i].reset((i+1)*1400);}
          stage=STAGE_2;
          count =0;
          level2.showLevel = true;
          return;
        }else{
        scoringBoard.reset();
        for(int i=0; i<sheeps.length; i++){
        sheeps[i].reset((i+1)*1400);}
        stage=STAGE_3;
        count =0;
        music2.pause();}
      }
    if(jones.alive() == false){
      gameState = GAME_FAIL;
    }
    break;
    case STAGE_3:
    music3.play();
    count++;
     if(level3.showLevel){
      level3.display();
    }else{
      background3.display();
       obstacle3.display();
       obstacle3.move();
      //for(int i=0; i<obstacles.length; i++){
      //  obstacles[i].display();
      //  obstacles[i].move();
      //}
      if(jones.alive()){
        jones.getStuck();
        jones.display();
        jones.backToPosition();
        jones.capture();
      }
      jones.falling();
      
      for(int i=0; i<sheeps.length; i++){
      if(sheeps[i].alive()){
        sheeps[i].display();
        sheeps[i].move();
        sheeps[i].followJones();
      }
      if(sheeps[i].alive()==false){
        sheeps[i].sheepBeSubtracted = true;
      }
      sheeps[i].falling();
      }
      
      scoringBoard.showSheepNum();
      scoringBoard.sheepNumChange();
    }
      if(count == 3360){
          if(scoringBoard.sheepNum <10){
          gameState = GAME_FAIL;
          music3.pause();
          scoringBoard.reset();
          for(int i=0; i<sheeps.length; i++){
          sheeps[i].reset((i+1)*1400);}
          stage=STAGE_3;
          count =0;
          level3.showLevel = true;
          return;
        }else{
        scoringBoard.reset();
        for(int i=0; i<sheeps.length; i++){
        sheeps[i].reset((i+1)*1400);}
        gameState= GAME_END;
        stage = STAGE_1;
        count =0;
        music3.pause();
      }
      }
      if(jones.alive() == false){
      gameState = GAME_FAIL;
    }
    break;

  }
  
    break;
    case GAME_FAIL:
    failMusic.play();
      lose.display();
       level1.showLevel = true;
        level2.showLevel = true;
         level3.showLevel = true;
    break;
    case GAME_END:
      end.endDisplay();
      end.sheepDisplay();
        level1.showLevel = true;
        level2.showLevel = true;
         level3.showLevel = true;
    break;
  
  }
}

void keyPressed(){
  if(key==ENTER){
    jones.jump();
  }
}


boolean isCollide(float ax, float ay, int aw, int ah, float bx, float by, int bw, int bh) {
  boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
  boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
  if (collisionX && collisionY) {
    return true;
  } else {
    return false;
  }
}

void mouseReleased(){
    if(start.showSheep2){
      gameState = GAME_STORY;
    }
    if(story.showStory2){
      gameState = GAME_RULE1;
    }
    if(rule1.showRule1_2){
      gameState = GAME_RULE2;
    }
    if(rule2.showRule2_2){
      gameState = GAME_RULE3;
    }
    if(rule3.showRule3_2){
      gameState = GAME_RUN;
    }
    if(lose.showLose2 ){
      gameState = GAME_RUN;
      stage = STAGE_1;
      jones.alive();
      jones.x = 150;
      if(jones.alive()){
        jones.getStuck();
        jones.display();
        jones.backToPosition();
        jones.capture();
      }
      
    }
    if(end.showSheep2){
      gameState = GAME_START;
    }
}