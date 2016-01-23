class End{
  PImage end,sheepRestart1,sheepRestart2;
  PImage [] sheeps;
  float x,y,sheepX,sheepY;
  float spacing,sheepSpeed;
  int sheepNum;
  boolean showSheep1,showSheep2; 
  
  End(){
    end= loadImage("End.png");
    sheepRestart1 = loadImage("restart1.png");
    sheepRestart2 = loadImage("restart2.png");
    sheepSpeed = 1;
    x= 0;
    y= 0;
    sheepX= -53;
    sheepY= 0;
    sheepNum =7;
    spacing = 20;
    sheeps = new PImage [sheepNum];
    showSheep1 = true;
    showSheep2 = false;
    
    for(int i=0;i<sheepNum;i++){
    sheeps[i] = loadImage("sheep.png");
    }
  }
  
  void endDisplay(){
    image(end,x,y);
  }
  
   void sheepDisplay(){
        if(showSheep1){
        image(sheepRestart1,sheepX,sheepY);
        }
        if(showSheep2){
        image(sheepRestart2,sheepX,sheepY);
        }
        sheepX+= sheepSpeed;
        if(sheepX >= width-sheepRestart2.width-5){
        sheepSpeed = 0;
        }
        if(mouseX >= sheepX && mouseX <= sheepX+sheepRestart1.width && mouseY >= sheepY && mouseY <= sheepY+sheepRestart1.height){
        showSheep1 = false;
        showSheep2 = true;
        }else{
        showSheep1 = true;
        showSheep2 = false;
        }
    
      for(int i=0;i<sheepNum;i++){
        image(sheeps[i],sheepX-(i+1)*(sheeps[i].width+spacing),sheepY+78);
      }
    }
  
}