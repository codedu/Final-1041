 class Obstacle3 {
  //properties
  PImage obstacle;
  //PImage [] obstacles;
  float x1,x2,x3,x4,x5,x6,x7,x8,x9,x10,x11,x12,x13,x14,x15,x16,x17,x18,x19,x20;
  float y;
  float speed;
  
  Obstacle3(String filename) {
    obstacle=loadImage(filename); 
    x1=1200;
    x2=1700;
    x3=2000;
    x4=2500;
    x5=3100;
    x6=3500;
    x7=3900;
    x8=4300;
    x9=4700;
    x10=5200;
    x11=5600;
    x12=5900;
    x13=6300;
    x14=6800;
    x15=7200;
    x16=7500;
    x17=8000;
    x18=8200;
    x19=8700;
    x20=9000;
    
    y=height-groundHeight-obstacle.height;
    speed=3;
  }

  
  //methods
  void display () {
    image(obstacle, x1, y);image(obstacle, x2, y);image(obstacle, x3, y);image(obstacle, x4, y);image(obstacle, x5, y);image(obstacle, x6, y);image(obstacle, x7, y);image(obstacle, x8, y);
    image(obstacle, x9, y);image(obstacle, x10, y);image(obstacle, x11, y);image(obstacle, x12, y);image(obstacle, x13, y);image(obstacle, x14, y);image(obstacle, x15, y);image(obstacle, x16, y);
    image(obstacle, x17, y);image(obstacle, x18, y);image(obstacle, x19, y);image(obstacle, x20, y);
  }
  void move() {
    x1-=speed;x2-=speed;x3-=speed;x4-=speed;x5-=speed;x6-=speed;x7-=speed;x8-=speed;x9-=speed;x10-=speed;
    x11-=speed;x12-=speed;x13-=speed;x14-=speed;x15-=speed;x16-=speed;x17-=speed;x18-=speed;x19-=speed;x20-=speed;
  }
  

}