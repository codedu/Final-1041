class MinorLose{
int currentImage=0 ;
boolean isCurrentFadeInOut = false; 
PImage [] images = new PImage[100];
PImage CG2;
int lightForImage1 = 255;
float fadeSpeed =5 ;
boolean showNextImage = false;
boolean stkp=true;

MinorLose(){
 
 for(int i=0;i<8;i++){
  images[i] = loadImage("fourwin/LOSE/0"+i+".png");//0-7
 }
  CG2=loadImage("bg/CG2.png");
}

void draw(){
    talk1.pause();
    talk2.pause();
    talk3.pause();
    talk4.pause();
    talk5.pause();
 if(isCurrentFadeInOut){
    stkp=false;
   fadeInFadeOut();
  }else{
    image(images[currentImage], 0, 0);
  }
 /*  if(currentImage==0){
    if(!talk6.isLooping()){talk6.loop();} 
  }*/
  if(currentImage==5){
    talk7.pause();
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
  
  if( currentImage == 5){
    stkp=false;
    isCurrentFadeInOut = true;
    fadeSpeed = 5;
  }else{fadeSpeed = 255;}
    
  if( isCurrentFadeInOut == true){ 
  //isCurrentFadeInOut = true;
  stkp=false;
  lightForImage1 = 255;
  showNextImage = false;}else{stkp=true;}
    
 
 if(currentImage>=7){
   currentImage=7;}
 
}

void stop(){
  stkp=false; 
}
}