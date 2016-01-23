
class Archer {
  PImage archerwalk1;
  PImage archerwalk2;

  PImage archerattack1;
  PImage archerattack2;

  int speed = 15;
  int timera = 0;

  int archerx;
  int archery;
  boolean jump;
  int hp;

  Archer(int hp) {
    this.archerwalk2 = loadImage("img/archer/archer walk1.png");
    this.archerwalk1 = loadImage("img/archer/archer walk0.png");
    this.archerattack1 = loadImage("img/archer/archer attack0.png");
    this.archerattack2 = loadImage("img/archer/archer attack1.png");
    this.hp = hp;
    this.archerx = 0;
    this.archery = 470;

  }

  void draw() {
    if (view && !clear) {
      image(archerwalk2, this.archerx, this.archery);
    } else if (clear) {

    } else {
      image(archerwalk1, this.archerx, this.archery);
    }

    if (archerx % 30 == 0 && stop) {
      view = !view;
    } else {
      view = view;
    }
    if (isMovingUp) {
      jump = true;
      this.move(Direction.UP);
    }
    if (isMovingDown) {
      this.move(Direction.DOWN);
    }
    if (isMovingLeft) {
      this.move(Direction.LEFT);
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);
    }

    // if(archery != 470)
    // {
    // archery = 470;
    // }
  }

  int tmp = 0;// arrow num

  void attack() {
    if (attack) {
    
      timera++;
      if (timera <= 10) {
        clear = true;
        // println("attack:");
        image(archerattack1, archerx, archery);
      } else if (timera > 10 && timera <= 20) {
        image(archerattack2, archerx, archery);
      }

    }

    if (timera > 20) {
      clear = false;
      attack = false;
      timera = 0;
    }

  }

  void shoot() {
     
    if (tmp < 13) {
       
      arrows[tmp] = new Arrow(archerx, archery);
      tmp++;
    } else {
      for (int i = 0; i < tmp; i++) {
        if (arrows[i] == null || arrows[i].x < 0) {
          arrows[i] = new Arrow(archerx, archery);
         
          break;
        }
      }
    }
  }

  void move(int direct) {

    switch (direct) {
    case Direction.UP:

      if (jump) {
        tmp++;
        if (tmp < 15) {
          this.archery -= 20;
        }
        if (tmp > 15 && tmp < 30) {
          this.archery += 20;
        }

      }

      if (tmp > 30) {
        jump = false;
        isMovingUp = false;
        tmp = 0;
        this.archery = 470;

      }

      break;

    case Direction.LEFT:

      if (this.archerx - speed > 0) {
        this.archerx -= speed;
      }
      break;

    case Direction.RIGHT:
      if (this.archerx + speed < width - this.archerwalk1.width) {
        this.archerx += speed;
      }
      break;
    }
  }

  void hpValueChange(int value) {
    this.hp += value;
    if (this.hp <= 0) {
      state = GameState.DIE;
      return;
    } else if (this.hp >= 100) {
      this.hp = 100;
      return;
    }
    return;
  }
}