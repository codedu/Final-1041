class Lose{
  float x,y;
  float sheepX,sheepY;
  PImage lose1,lose2;
  PImage lose_sheep1,lose_sheep2;
  boolean showLose1,showLose2;
  boolean showLose_sheep1,showLose_sheep2;
  int time;
    
    Lose(){
     x= 0;
     y= 0;
     sheepX= 230;
     sheepY= 51;
     lose1= loadImage("lose1.png");
     lose2= loadImage("lose2.png");
     lose_sheep1= loadImage("lose_sheep1.png");
     lose_sheep2= loadImage("lose_sheep2.png");
     showLose1 = true;
     showLose2 = false;
     showLose_sheep1 = true;
     showLose_sheep2 = false;
     time = 0;
    }
    
   void display(){
     time++;
    if(showLose1){
    image(lose1,x,y);
    }
    if(showLose2){
    image(lose2,x,y);
    }
    if(showLose_sheep1){
    image(lose_sheep1,sheepX,sheepY);
    }
    if(showLose_sheep2){
    image(lose_sheep2,sheepX,sheepY);
    }
    
    if(time == 60){
     showLose_sheep1 = false;
     showLose_sheep2 = true;
    }
   
    if(mouseX >= 402 && mouseX <= 614 && mouseY >= 407 && mouseY <= 457){
      showLose2 = true;
      showLose1 = false;
    }else{
      showLose2 = false;
      showLose1 = true;
    }
    
  }
}