class couple {
  float x ; 
  float y ;
  PImage wait1 ;
  PImage wait2 ;
  float speed = 20 ; 
  int iswaiting=0;
 couple (float x , float y ) {
    wait1 = loadImage("waiting1.PNG") ;
    wait2 = loadImage("waiting2.PNG") ;
    this.x = x ; 
    this.y = y ;
  }
void reset(){
    x = width / 2  ; 
    y = 90; 
  }
void display (){
    if(x<0) x=0;
    if(x>width-40) x=width-40;
    if(y<0) y=0;
    if(y>height-55) y=height-55;
    image(wait1,x,y);
  }  
void moveUp (){
  if(gee.y<=420)
    y-= speed ;
  }
void moveDown (){
  if(gee.y<=420)
    y+= speed ;
  }
void moveLeft (){
  if(gee.y<=420)
    x-= speed ;
  }
void moveRight (){
  if(gee.y<=420)
    x+= speed ;
  }
}