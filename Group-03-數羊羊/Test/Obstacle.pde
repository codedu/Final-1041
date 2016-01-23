class Obstacle {
  //properties
  PImage obstacle;
  //PImage [] obstacles;
  float x1,x2,x3,x4,x5,x6,x7,x8,x9,x10;
  float y;
  float speed;

  Obstacle(String filename) {
    obstacle=loadImage(filename); 
    x1=700;
    x2=1800;
    x3=2500;
    x4=3000;
    x5=4500;
    x6=5000;
    x7=6000;
    x8=6800;
    x9=8000;
    x10=8600;
    y=height-groundHeight-obstacle.height;
    speed=3;
  }

  
  //methods
  void display () {
    image(obstacle, x1, y);image(obstacle, x2, y);image(obstacle, x3, y);image(obstacle, x4, y);image(obstacle, x5, y);image(obstacle, x6, y);image(obstacle, x7, y);image(obstacle, x8, y);
    image(obstacle, x9, y);image(obstacle, x10, y);
  }
  void move() {
    x1-=speed;x2-=speed;x3-=speed;x4-=speed;x5-=speed;x6-=speed;x7-=speed;x8-=speed;x9-=speed;x10-=speed;
  }
  

}