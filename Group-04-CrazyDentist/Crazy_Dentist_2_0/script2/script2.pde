Aim aim;
//int i =0;
PImage mouse;



void setup(){
size(640,480);
aim = new Aim();
mouse = loadImage("mission1background.png".)
}




void draw(){
  //size(640,480);
  background(255);
  aim.display(width/2,height/2);
  aim.ball();

  //i-=0.1;
}