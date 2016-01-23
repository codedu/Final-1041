class Player{
  AudioPlayer jumpSFX, highjumpSFX;
  PImage playerImg1,playerImg2,playerImg3;
  float g=6.8;
    int t=0;
    boolean jumping=false;
float x, y;
int hp;

float S(float time,float v ){
    float T=0.0;float v2=0.0;float s=0.0;
    v2=v-g*time;
    s=((v*v)-(v2*v2))/(2*g);
    if(s>=0)return s;
    else return 0;
}

  Player(int number){
  jumpSFX = minim.loadFile("audio/jump.wav");
  highjumpSFX = minim.loadFile("audio/high jump.wav");
  playerImg1 = loadImage("img/player"+number+".png");
  playerImg2 = loadImage("img/player"+(number*10+1)+".png");
  playerImg3 = loadImage("img/player"+(number*10+2)+".png");
  }
void draw(){

  //show the pic
  imageMode(CENTER);
  x=280;
  if(jumping){
  t++;
    if(t==24){
  jumping=false;
  t=0;
  jumpSFX.rewind();
  highjumpSFX.rewind();
  }
  y=-(S(t,50));
  }
  if(protect==true){
    image(playerImg2, x, 320+y);}

    if(g==4){
    image(playerImg3, x, 320+y); 
}
    if(g==6.8){
  image(playerImg1, x, 320+y);
  }
}
  
  void jump(){
  jumping=true;
  }
    
  void hpUp(){
  hp++;
  }
  
  void hpDown(){
  hp--;
  }
  
  void hpDownDown(){
  hp-=5;
  }
  
  
  
}