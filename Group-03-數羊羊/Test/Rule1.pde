class Rule1{
  float x,y;
  PImage rule1_1,rule1_2;
  boolean showRule1_1,showRule1_2;
    
    Rule1(){
     rule1_1= loadImage("rule1_1.png");
     rule1_2= loadImage("rule1_2.png");
     showRule1_1 = true;
     showRule1_2 = false;
    }
    
   void display(){
    if(showRule1_1){
    image(rule1_1,x,y);
    }
    if(showRule1_2){
    image(rule1_2,x,y);
    }
   
    if(mouseX >= 402 && mouseX <= 614 && mouseY >= 407 && mouseY <= 457){
     
      showRule1_2 = true;
      showRule1_1 = false;
    }else{
      showRule1_2 = false;
      showRule1_1 = true;
   
    }


   
  }
}