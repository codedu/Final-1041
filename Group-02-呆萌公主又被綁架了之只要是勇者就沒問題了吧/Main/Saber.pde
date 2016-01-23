class Saber{
  PImage saberwalk1;
  PImage saberwalk2;

  PImage saberattack1;
  PImage saberattack2;

  int speed = 5;
  int timera = 0;

  int saberx;
  int sabery;
 boolean jump;
  int hp;
Saber (){
}
  Saber(int hp) {
    this.saberwalk2 = loadImage("img/saber/saber1.png");
    this.saberwalk1 = loadImage("img/saber/saber2.png");
    this.saberattack1 = loadImage("img/saber/sabersttack.png");
    this.saberattack2 = loadImage("img/saber/saberattack2.png");
    this.hp = hp;
    this.saberx = 0;
    this.sabery = 470;

  }

  void draw() {
    if (view && !clear) {
      image(saberwalk2, this.saberx, this.sabery);
    } else if (clear) {

    } else {
      image(saberwalk1, this.saberx, this.sabery);
    }

    if (saberx % 30 == 0 && stop) {
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

  }

  int tmp = 0;// arrow num

  void attack() {
    if (attack) {
      timera++;
      if (timera <= 10) {
        clear = true;
        // println("attack:");
        image(saberattack2, saberx, sabery);
      } else if (timera > 10 && timera <= 20) {
        image(saberattack1, saberx, sabery);
      }

    }

    if (timera > 20) {
      clear = false;
      attack = false;
      timera = 0;
    }

  }

  void shoot() {
    
  }

  void move(int direct) {

    switch (direct) {
    case Direction.UP:
    if (jump) {
        tmp++;
        if (tmp < 15) {
          this.sabery -= 20;
        }
        if (tmp > 15 && tmp < 30) {
          this.sabery += 20;
        }

      }

      if (tmp > 30) {
        jump = false;
        isMovingUp = false;
        tmp = 0;
        this.sabery = 470;

      }

      
      break;

    case Direction.LEFT:

      if (this.saberx - speed > 0) {
        this.saberx -= speed;
      }
      break;

    case Direction.RIGHT:
      if (this.saberx + speed < width - this.saberwalk1.width) {
        this.saberx += speed;
      }
      break;
    }
  }

  void hpValueChange(int value) {
    this.hp += value;
    if (this.hp <= 0) {
      state = GameState.END;
      return;
    } else if (this.hp >= 100) {
      this.hp = 100;
      return;
    }
    return;
  }
}