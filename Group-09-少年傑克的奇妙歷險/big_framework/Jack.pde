class Jack {
  int x;
  int y;
  int hp;
  PImage jack;
  int speed =5;

  Jack(int x, int y) {
    this.x=x;
    this.y=480-115+40;
    this.hp=100;
    this.jack = loadImage("img/JATB.png");
  }

  void draw() {
    image(jack, x, y);

    if (isMovingLeft) {
      this.move(Direction.LEFT);
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);
    }
  }

  void move(int direct) {
    switch (direct) {

    case Direction.LEFT:
      if (this.x - speed > 0-30) {
        this.x-= speed;
      }
      break;
    case Direction.RIGHT:
      if (this.x + speed < width - this.jack.width+30) {
        this.x+= speed;
      }
      break;
    }
  }
  void damage() {
    this.hp-=35;
    musicPowerDown1.trigger();
  }
}