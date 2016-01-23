class Rule3{
  float x,y;
  PImage rule3_1,rule3_2;
  boolean showRule3_1,showRule3_2;
    
    Rule3(){
     rule3_1= loadImage("rule3_1.png");
     rule3_2= loadImage("rule3_2.png");
     showRule3_1 = true;
     showRule3_2 = false;
    }
    
   void display(){
    if(showRule3_1){
    image(rule3_1,x,y);
   }
    if(showRule3_2){
    image(rule3_2,x,y);
   }

    if(mouseX >= 486 && mouseX <= 591 && mouseY >= 412 && mouseY <= 451){
      showRule3_2 = true;
      showRule3_1 = false;
    }else{
      showRule3_2 = false;
      showRule3_1 = true;
    }
  }
}