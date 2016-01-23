class Polly {
  PImage polly1;
  PImage pollyDie;
  int px;
  int py;
  int time = 0;
  boolean jump;
  int hp;
  int x;
  boolean hit;
  int tmp;

  Polly(int hp) {
    polly1 = loadImage("img/poly/poly1.png");
    pollyDie = loadImage("img/poly/poly1Die.png");
    jump = false;
    this.hp = hp;
  }

  void draw() {
    if (hit) {
      tmp++;
      if (tmp > 45) {
        hit = false;
      }

      image(pollyDie, x, 600 - py, 102, 70);

    } else {
      image(polly1, x, 600 - py, 102, 70);
    }
  }

  void move() {
    x = 1000 - px;
    if (hit) {
      px += 0;
    } else {
      px += 3;
    }
    time++;
    if (time <= 15) {
      py += 7;
    }
    if (time > 15 && time <= 30) {
      py -= 7;
    }
    if (time >= 30) {
      time = 0;
    }
  }

  boolean isCollideWithPlayers() {
    if (isHit(1020 - px, 600 - py, 102, 80, players.saberx + 100,
        players.sabery + 30, 70, 170)) {
      hit = true;
      return true;
    } else {
      return false;
    }

  }

  boolean isCollideWithPlayer() {
    if (isHit(1020 - px, 600 - py, 102, 80, player.archerx + 100,
        player.archery + 30, 70, 170)) {
      hit = true;
      return true;
    } else {
      return false;
    }

  }
  
  boolean isCollideWithPlayersattack(Saber saber) {
   if (isHit(1020 - px, 600 - py, 102, 80, saber.saberx+100,  saber.sabery+100, 80, 60)) {
      hit = true;
      hp -= floor(random(70, 100));
      return true;
    } else {
      return false;
    }
  }
  boolean isCollideWithArrow(Arrow arrow) {
    if (isHit(1020 - px, 600 - py, 102, 80, arrow.x, arrow.y, 80, 60)) {
      hit = true;
      hp -= floor(random(70, 100));
      return true;
    } else {
      return false;
    }

  }

}