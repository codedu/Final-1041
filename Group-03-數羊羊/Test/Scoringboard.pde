class ScoringBoard{
  PImage sheep;
  int sheepNum;
  
  ScoringBoard(){
    sheep= loadImage("sheep.png");
    sheepNum = 0;  
    textAlign(LEFT,TOP);
    textSize(35);
  }

  void showSheepNum(){
    colorMode(HSB);
    fill(224,0,119,200);
    noStroke();
    rectMode(CENTER);
    rect(width/2,30,130,60,7);
    fill(255);
    text("x"+sheepNum,width/2,0);
    image(sheep,width/2-sheep.width,0);
  }
  
    void reset(){
    sheepNum = 0;
  }
  
  void sheepNumChange(){
    for(int i=0; i<sheeps.length; i++){
      if(sheeps[i].sheepCanBeCounted){
        if(sheeps[i].sheepBeAdded){
          if(sheeps[i].sheepAdding){
            sheepNum+=1;
            sheeps[i].sheepAdding = false;
          }
        }
      
        if(sheeps[i].sheepBeSubtracted){
          if(sheeps[i].sheepSubtracting){
            sheepNum-=1;
            sheeps[i].sheepSubtracting=false;
          }
        }  
      }
    }
  }
}