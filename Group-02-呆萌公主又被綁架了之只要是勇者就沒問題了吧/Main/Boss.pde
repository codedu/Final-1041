class Boss{
  PImage boss1;
  PImage boss2;
  PImage background2;
  PImage stair1;
  PImage stair2;
  PImage stair3;
  int bossX = 800;
  int bossY = 350;
  int tmp = 0;
  int walkType = 0;
  int walkWard = 1;
  int[][] stair = new int[3][2];
  boolean hit;
  int tmp1;


  boolean bossWalk = true;
  int hp;

  Boss(int hp){
     boss1 = loadImage("img/boss/boss1.png");
     boss2 = loadImage("img/boss/boss2.png");
     stair1 = loadImage("img/boss/stair.png");
     stair2 = loadImage("img/boss/stair.png");
     stair3 = loadImage("img/boss/stair.png");
     this.hp = hp;
     stair[0][0] = 700;
     stair[0][1] = 500;
     stair[1][0] = 750;
     stair[1][1] = 550;
     stair[2][0] = 800;
     stair[2][1] = 600;
  }

  void draw(){  
        tmp++;
      if (hit) {
         tmp1++;
        if(tmp1 > 45){
         hit = false;
      }
    }

      if(bossWalk == true && tmp == 20){
        tmp = 0;
        walkType++;
      }
        
      if(walkType%2 == 0){
        image(boss1,bossX,bossY);
      }else{
        image(boss2,bossX,bossY);
      }
      
      if(hit){
         bossX+=0;
      }else {
        if(walkWard%2 == 0){
         bossX+=5;
        }else{
          bossX-=5;
       }
     }
      
      
      if(bossX == 300){
        walkWard++;
      }
      if(bossX == 810){
        walkWard++;
      }
      
      image(stair1,stair[0][0],stair[0][1]);
      image(stair2,stair[1][0],stair[1][1]);
      image(stair3,stair[2][0],stair[2][1]);
      stair[0][0]-=10;
      stair[1][0]-=10;
      stair[2][0]-=10;
      if(stair[0][0]<-5){
        stair[0][0] = 800;
      }
      if(stair[1][0]<-5){
       stair[1][0] = 800;
      }
      if(stair[2][0]<-5){
       stair[2][0] = 800;
      }
     
  }


  boolean isCollideWithPlayer() {
    int tmp = 0;
    if(isHit(bossX+70,bossY,170, 60,player.archerx+100, player.archery+30,
        70, 170)){
      hit = true;
      tmp++;
    }

    for(int i = 0;i < 3;i++){
        if (isHit(stair[i][0]+10,stair[i][1]+20, 70, 30, player.archerx, player.archery,
            100, 200)) {
         tmp ++;
         stair[i][0] = 10000;
        } else {
        
        }
    }
     if(tmp != 0){
      return true;
     }else {
      return false;
     }
  }
 boolean isCollideWithPlayers() {
    int tmp = 0;
    if(isHit(bossX+70,bossY,170, 60,players.saberx+100, players.sabery+30,
        70, 170)){
      hit = true;
      tmp++;
    }

    for(int i = 0;i < 3;i++){
        if (isHit(stair[i][0]+10,stair[i][1]+20, 70, 30, players.saberx, players.sabery,
            100, 200)) {
         tmp ++;
         stair[i][0] = 10000;
        } else {
        
        }
    }
     if(tmp != 0){
      return true;
     }else {
      return false;
     }
  }
  boolean isCollideWithArrow(Arrow arrow) {
    if (isHit(bossX+70,bossY,170, 60, arrow.x, arrow.y, 80, 60)) {
      // py = 0;
      hp -= floor(random(70,110));
      return true;
    } else {
      return false;
    }

  }
}    