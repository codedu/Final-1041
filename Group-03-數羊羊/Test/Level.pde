class Level{
  PImage level;
  float x,y;
  int i;
  boolean showLevel;
  
  Level(String filename){
    level= loadImage(filename);
    x= 0;
    y= 0;
    i=0;
    showLevel= true;
  }
   void display(){
     if(showLevel){
      image(level,x,y);
      i++;
     }
      if(i == 100){
        showLevel = false;
        i= 0;
      }

    }
}