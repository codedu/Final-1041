class Car {
  float x, y;
  float speed;
  PImage img;
  int running=0;
  int finish;
  float startx;
  int road;

  /*Car(float x, float y) {
    this.x = x;
    this.y = y;
    speed = 1;
  }*/
  
  Car(float x, float y, float speed,PImage img,int finish) {
    startx=x;
    this.x = x;
    this.y = y;
    this.speed = speed;
    this.img=img;
    this.finish=finish;
  }
  void reset() {
    x = startx;
    running=0;
  }
  void display() {
     image(img, x, y);
  }
  void moveForward() {
    x += speed;
  }
};