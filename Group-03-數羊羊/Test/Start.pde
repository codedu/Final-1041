class Start{
  PImage startBg,startWord,sheepStart,sheepStart2;
  PImage [] sheeps;
  float wordX,wordY,sheepX,sheepY;
  float wordSpeed,sheepSpeed;
  float spacing;
  int sheepNum;
  boolean showSheep,showSheep2; 
 
  Start(){
    startBg = loadImage("bg_start.png");
    startWord = loadImage("word.png");
    sheepStart = loadImage("sheep_start.png");
    sheepStart2 = loadImage("sheep_start2.png");
    wordX = 0;
    wordY = -height;  
    sheepX = -sheepStart.width;
    sheepY = height-sheepStart.height-groundHeight;
    wordSpeed = 2;
    sheepSpeed = 1;
    spacing = 20;
    sheepNum = 7;
    sheeps = new PImage [sheepNum];
    showSheep = true;
    showSheep2 = false;
    
    for(int i=0;i<sheepNum;i++){
    sheeps[i] = loadImage("sheep.png");
    }
  }
    void bgDisplay(){
      image(startBg,0,0);
    }
    void wordDisplay(){
      image(startWord,wordX,wordY);
      wordY+=wordSpeed;
      if(wordY == 0){
        wordSpeed = 0;
      }
      }
    void sheepDisplay(){
        if(showSheep){
        image(sheepStart,sheepX,sheepY);
        }
        if(showSheep2){
        image(sheepStart2,sheepX,sheepY);
        }
        sheepX+= sheepSpeed;
        if(sheepX >= width-sheepStart2.width-5){
        sheepSpeed = 0;
        }
        if(mouseX >= sheepX && mouseX <= sheepX+sheepStart.width && mouseY >= sheepY && mouseY <= sheepY+sheepStart.height){
        showSheep = false;
        showSheep2 = true;
        }else{
        showSheep = true;
        showSheep2 = false;
        }
    
      for(int i=0;i<sheepNum;i++){
        image(sheeps[i],sheepX-(i+1)*(sheeps[i].width+spacing),height-sheeps[i].height-groundHeight);
      }
    }
  
}