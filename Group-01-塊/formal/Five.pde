class Five{
  int x;
  int y;
  int hpx=180;
  PImage hp;
  
  PImage [] up = new PImage[3];
  PImage [] left = new PImage[3];
  PImage [] right = new PImage[3];
  PImage [][] images = new PImage[3][];
  
  float speed = 10 ;
  boolean m=false;
  
  // 0 - up, 1 - left, 2 - right
  int walkingDirection = 0;
  boolean isWalking = false;
  
  Five(){
    up[0] = loadImage("fi1.png") ;   
    up[1] = loadImage("fi2.png");
    up[2] = loadImage("fi3.png");
    
    left[0] = loadImage("fi4.png") ;   
    left[1] = loadImage("fi5.png");
    left[2] = loadImage("fi6.png");
    
    right[0] = loadImage("fi7.png") ;   
    right[1] = loadImage("fi8.png");
    right[2] = loadImage("fi9.png");
    
    images[0] = up;
    images[1] = left;
    images[2] = right;
    
    x=width/2;
    y=435;
    hp=loadImage("hp.png");
  }
  int currentFrame = 0;
  void display(){    
    imageMode(CENTER);
    image(images[walkingDirection][currentFrame],x,y);
  }
  void Slow(int s){
    speed+=s;
  }
  void hp(){
    fill(230,0,0);
    rect(32,23,hpx,17);
    imageMode(CORNER);
    hp=loadImage("hp.png");
    image(hp,20,20);  
  }
    
  
  void hpDecrease(int i){
    hpx-=i;
  
   if(hpx>=197){
    hpx=197; 
   }
  }
  void border(){
   if(x<137){
     x=137;}
     
   if(x>495){
    x=495;}

   if(y<25){
     y=25;}
   
   if(y>445){
    y=445;}
    
    //noreste1
   if(five.x>360 && five.x<500 && five.y<40){
      five.y=40;}
      
    //noreste2
   if(five.x>390){
      if(five.y>110 && five.y<145){
        five.y=160; }
      if(five.y>90 && five.y<=130){
        five.y=90; }}
   if(five.y>120 &&five.y<130 && five.x>390){
       five.x=390;}
   
        
    //sureste
   if(five.y>240 && five.y<390){
      if(five.x>350 &&five.x<415){
        five.x=350;}
      if(five.x>415 &&five.x<480){
        five.x=480;}
    } 
   if(five.x>350 && five.x<480 ){      
      if(five.y>220 && five.y<310){
        five.y=220;} 
      if(five.y>310 && five.y<405){
        five.y=405;}}
        
    //noroeste
    if(five.x>135 && five.x<300 && five.y<135){
      five.y=135;}
   if(five.y>20 && five.y<125 && five.x<300){
      five.x=300;}
      
    //este
   if(five.y>180 && five.y<220){
      if(five.x>145 &&five.x<163){
        five.x=145;}
      if(five.x>163 &&five.x<180){
        five.x=180;}
    } 
    if(five.x>145 && five.x<180 ){      
      if(five.y>175 && five.y<190){
        five.y=175;} 
      if(five.y>190 && five.y<220){
        five.y=220;}} 
        
    //suroeste
   if(five.x>135 && five.x<155){
     if(five.y>310 && five.y<350){
        five.y=310;}
     if(five.y>350 && five.y<405){
        five.y=405;}
      }
   if(five.y>325 && five.y<405 && five.x<170){
       five.x=170;}
   
  }
  void moveUp (){
    walkingDirection = 0;
    y-= speed ;
    currentFrame++;
    if(currentFrame==3){currentFrame = 1;}
  }
  void moveDown(){
    walkingDirection = 0; 
    y+= speed ;
  currentFrame++;  
  if(currentFrame==3){currentFrame = 1;}
  }
  void moveLeft(){
    walkingDirection = 1;
    x-= speed ;
    currentFrame++;
    if(currentFrame==3){currentFrame = 1;}
  }
  void moveRight(){
    walkingDirection = 2;
    x+= speed ;
    currentFrame++;
    if(currentFrame==3){currentFrame = 1;}
  }
  void endMove()
  {
    currentFrame = 0;
  }
  
}