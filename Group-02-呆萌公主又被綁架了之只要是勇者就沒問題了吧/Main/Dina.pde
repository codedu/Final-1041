class Dina{
  PImage dina;
  PImage dina2;
  PImage dinaDie;
  int dx;
  int dy;
  int hp;
  boolean hit;
  int tmp;

  boolean  dinaAnimation = true;
  Dina(int hp){
    dina = loadImage("img/dina/dina.png");
    dina2 = loadImage("img/dina/dina2.png");
    dinaDie = loadImage("img/dina/dinadDie.png");
    this.hp = hp;
  }

  void move(){
     if(hit){
      dx-=0;
    }else  {
      dx-=3;
    }
  }
  void draw(){
  if (hit) {
     tmp++;
      if(tmp > 45){
        hit = false;
      }

      image(dinaDie,1020+dx ,500+dy);
  }else {
     if(dx%60 == 0){
       dinaAnimation = !dinaAnimation;
       dy = floor(random(5, 10));
    }
    

    if(dinaAnimation){
      image(dina, 1020+dx ,500+dy);
    }else  {
      image(dina2,1020+dx ,500-dy);
    }
  }
   
  }

  boolean isCollideWithPlayer() {
    if (isHit(1020+dx, 500, 102, 80,player.archerx+100, player.archery+30,
        70, 170)) {
      hit = true;
      return true;
    } else {
      return false;
    }

  }
 boolean isCollideWithPlayers() {
    if (isHit(1020+dx, 500, 102, 80, players.saberx + 100,
        players.sabery + 30, 70, 170)) {
      hit = true;
      return true;
    } else {
      return false;
    }

  }
  boolean isCollideWithArrow(Arrow arrow) {
    if (isHit(1020+dx, 480 , 102, 80, arrow.x, arrow.y, 80, 60)) {
      hit = true;
      hp -= floor(random(70,110));
      return true;
    } else {
      return false;
    }

  }

}