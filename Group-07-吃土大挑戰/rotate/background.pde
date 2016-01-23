class Background{
float a;
PImage bg;

Background(){
bg = loadImage("img/bg.png");
}

void draw(){
  pushMatrix();
translate(320, 900);
rotate(radians(a));
imageMode(CENTER);
image(bg,0, 0);
a-=0.6;
popMatrix();
}
}