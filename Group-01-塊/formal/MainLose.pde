class MainLose{
int currentImage=0 ;
boolean isCurrentFadeInOut = false; 
PImage [] images = new PImage[100];
PImage CG5;
int lightForImage1 = 255;
float fadeSpeed =5 ;
boolean showNextImage = false;
boolean stkp=true;
  
MainLose(){
  
for(int i=1;i<5;i++){
  images[i-1] = loadImage("fivewin/lose/0"+i+".png");//0-3
 }
  CG5=loadImage("bg/CG5.png");
}  
 
void draw(){
 if(isCurrentFadeInOut){
    stkp=false;
   fadeInFadeOut();
  }else{
    image(images[currentImage], 0, 0);
  }

  
}

void fadeInFadeOut()
{ 
  if(showNextImage == false){
    tint(lightForImage1,255);
    image(images[currentImage],0,0);
    lightForImage1 -= fadeSpeed;
  }else{
    tint(lightForImage1,255);
    image(images[currentImage],0,0);
    lightForImage1 += fadeSpeed;
    
      if(lightForImage1 > 255) { 
        lightForImage1 = 255; 
        isCurrentFadeInOut = false;
        stkp=true;
        
      }
  }  
  if(lightForImage1 <= 0) {
    showNextImage = true;
    currentImage++;
  }
  
}


void keyPressed(){ 
  if(isCurrentFadeInOut) {return;};
  if(stkp==true && key==ENTER){ 
    
    currentImage++;
  }
  
  if( currentImage == 1){
    stkp=false;
    isCurrentFadeInOut = true;
    fadeSpeed = 5;
  }else{fadeSpeed = 255;}
    
  if( isCurrentFadeInOut == true){
  //isCurrentFadeInOut = true;
  stkp=false;
  lightForImage1 = 255;
  showNextImage = false;}else{stkp=true;}
    
 
 if(currentImage>=3){
   currentImage=3;}
 
}

void stop(){
  stkp=false; 
}

}//class
  
  