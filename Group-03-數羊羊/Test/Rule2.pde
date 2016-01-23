class Rule2{
  float x,y;
  PImage rule2_1,rule2_2;
  boolean showRule2_1,showRule2_2;
    
    Rule2(){
     rule2_1= loadImage("rule2_1.png");
     rule2_2= loadImage("rule2_2.png");
     showRule2_1 = true;
     showRule2_2 = false;
    }
    
   void display(){
    if(showRule2_1){
    image(rule2_1,x,y);
   }
    if(showRule2_2){
    image(rule2_2,x,y);
   }
      
    if(mouseX >= 402 && mouseX <= 614 && mouseY >= 407 && mouseY <= 457){
      showRule2_2 = true;
      showRule2_1 = false;
    }else{
      showRule2_2 = false;
      showRule2_1 = true;
    }
  }
}