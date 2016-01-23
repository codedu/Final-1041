class Pass{
  float x,y;
  PImage pass1,pass2;
  boolean showPass1,showPass2;
    
    Pass(){
     pass1= loadImage("pass1.png");
     pass2= loadImage("pass2.png");
     showPass1 = true;
     showPass2 = false;
    }
    
   void display(){
    if(showPass1){
    image(pass1,x,y);
    }
    if(showPass2){
    image(pass2,x,y);
    }
   
    if(mouseX >= 402 && mouseX <= 614 && mouseY >= 407 && mouseY <= 457){
      showPass2 = true;
      showPass1 = false;
    }else{
      showPass2 = false;
      showPass1 = true;
   
    }
  }
}