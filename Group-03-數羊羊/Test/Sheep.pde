class Sheep{
  PImage sheep;
  float x, y,speed;
  boolean getCaught, sheepCanBeCounted, sheepBeAdded,sheepBeSubtracted, sheepAdding, sheepSubtracting;
  
  Sheep(int x){
    sheep= loadImage("sheep.png");
    getCaught= false;
    sheepCanBeCounted = false;
    sheepBeAdded= false;
    sheepBeSubtracted=false;
    sheepAdding= true;
    sheepSubtracting=true;
    this.x=x;
    y=height-groundHeight-(jones.jones.height-sheep.height)+12;
    speed=5;
  }
  
  void display(){
  image(sheep,x,y);
  
  }
  
  void reset(int x){
    getCaught= false;
    sheepCanBeCounted = false;
    sheepBeAdded= false;
    sheepBeSubtracted=false;
    sheepAdding= true;
    sheepSubtracting=true;
    this.x=x;
    y=height-groundHeight-(jones.jones.height-sheep.height)+12;
  }
  
  void move(){
    if(!getCaught){
      x-=speed;    
    }
  }
  
  void getCaught(){
    getCaught= true;
    sheepCanBeCounted= true;
     x-=speed;
  }
  
  void followJones(){
    for(int i=0; i<sheeps.length; i++){
      if(getCaught && this.x == jones.x-sheeps[i].sheep.width/4){
        this.x=jones.x-sheeps[i].sheep.width/4;
        this.y=jones.y+jones.jones.height-sheep.height-20;
        for(int j=0; j<scoringBoard.sheepNum-1; j++){
            image(sheeps[i].sheep,jones.x-sheeps[i].sheep.width/4*(j+2),jones.y+sheeps[i].sheep.height+10);
          }
      }
    }
  }
  void falling(){
    if(this.y>height-groundHeight-(jones.jones.height-sheep.height)+12){
      this.y+=5;
    }  
  }
  
  boolean alive(){
    if(this.x<=0-sheep.width || this.y>= height){
      getCaught= false;
      return false;
    }else{return true;}
  }
  
}