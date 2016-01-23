/*PImage worm1, bg;
int the = 0, flag = -1;
void setup (){
  size(640,480);
  worm1 = loadImage("img/worm1.png");
  bg = loadImage("img/bg.png");
}
void draw (){
  image(bg,100,0);
  if (the == 180 | the == 0)
      flag *= -1;
  the += flag;
  translate (320, 240);
  rotate (radians (the));
  image(worm1,100,0);
}

//90*30*/