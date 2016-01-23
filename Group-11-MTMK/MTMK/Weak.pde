class Weak{
int x;
int y;
boolean isDragged = false;
boolean isPut = false;
boolean isPressed = false;
int direction;
final int rightDown=0, rightUp=1, leftDown=2, leftUp=3;
float speed;
PImage img;

Weak(String filename){
x=floor(random(width));
y=floor(random(height/2,height));
direction=floor(random(4));
speed=floor(random(1,3));
img=loadImage(filename);
isDragged = false;
isPut=false;
}

void move(){
if(direction==0){
  x+=speed;
  y+=speed;
  if(x+img.width/2>width){
  direction=2;
  }
  if(y+img.height/2>height){
  direction=1;
  }
  }else if(direction==1){
  x+=speed;
  y-=speed;
  if(x+img.width/2>width){
  direction=4;
  }
  if(y-img.height/2<height/2-60){
  direction=0;
  }
  }else if(direction==2){
  x-=speed;
  y+=speed;
  if(x-img.width/2<0){
  direction=0;
  }
  if(y+img.height/2>height){
  direction=3;
  }
  }else{
  x-=speed;
  y-=speed;
  if(x-img.width/2<0){
  direction=1;
  }
  if(y-img.height/2<height/2-60){
  direction=2;
  }
  }
  
  if(isDragged==true){
  x=mouseX;
  y=mouseY;
  }
}


void display(){
imageMode(CENTER);
image(img,x,y);
}

void put(){
if(isDragged==false&&x<290&&x>40&&y<165&&y>0){
isPut=true;


}
}


}