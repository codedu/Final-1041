class Obstacle2 {
  //properties
  PImage obstacle;
  //PImage [] obstacles;
  float x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15;
  float y;
  float speed;

  Obstacle2(String filename) {
    obstacle=loadImage(filename); 
    x1=700;
    x2=1500;
    x3=2000;
    x4=2300;
    x5=2700;
    x6=3100;
    x7=3500;
    x8=4000;
    x9=4300;
    x10=4600;
    x11=5800;
    x12=6500;
    x13=7300;
    x14=8400;
    x15=9000;
    y=height-groundHeight-obstacle.height;
    speed=3;
  }

  
  //methods
  void display () {
    image(obstacle, x1, y);image(obstacle, x2, y);image(obstacle, x3, y);image(obstacle, x4, y);image(obstacle, x5, y);image(obstacle, x6, y);image(obstacle, x7, y);image(obstacle, x8, y);
    image(obstacle, x9, y);image(obstacle, x10, y);image(obstacle, x11, y);image(obstacle, x12, y);image(obstacle, x13, y);image(obstacle, x14, y);image(obstacle, x15, y);
  }
  void move() {
    x1-=speed;x2-=speed;x3-=speed;x4-=speed;x5-=speed;x6-=speed;x7-=speed;x8-=speed;x9-=speed;x10-=speed;
    x11-=speed;  x12-=speed;  x13-=speed;  x14-=speed;  x15-=speed;
  }
  

}