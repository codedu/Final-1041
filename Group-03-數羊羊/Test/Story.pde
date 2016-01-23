class Story{
  float x,y;
  PImage story1,story2;
  boolean showStory1,showStory2;

Story(){
  x= 0;
  y= 0;
  story1= loadImage("story1.png");
  story2= loadImage("story2.png");
  showStory1 = true;
  showStory2 = false;
}
void display(){
  if(showStory1){
     image(story1,x,y);
  }
  if(showStory2){
    image(story2,x,y);
  }

   if(mouseX >= 402 && mouseX <= 614 && mouseY >= 407 && mouseY <= 457){
     showStory2 = true;
     showStory1 = false;
   }else{
     showStory2 = false;
     showStory1 = true;
   }
}
}