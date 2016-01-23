
class MinorStory{ 
int curImage = 0;
boolean isCurrentFadeInOut = false; 
PImage [] images = new PImage[100];
PImage CG1;
int lightForImage1 = 255;
float fadeSpeed =5 ;
boolean showNextImage = false;
boolean stkp=true;
boolean stk=true;

MinorStory(){
  curImage =0;
 for(int i=0;i<4;i++){
  images[i] = loadImage("fourwin/0"+i+".png");//0-3
 }
 for(int i=0;i<8;i++){
  images[i+4] = loadImage("fourwin/WIN/0"+i+".png");//4-11
 }
 CG1=loadImage("bg/CG1.png");

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
    image(images[curImage], 0, 0);
  }
  if(curImage==5){
    if(!talk6.isLooping()){talk6.loop();} 
  }
  if(curImage==9){
    talk6.pause();
  }
  
  
}

void fadeInFadeOut()
{ 
  if(showNextImage == false){
    tint(lightForImage1,255);
    image(images[curImage],0,0);
    lightForImage1 -= fadeSpeed;
  }else{
    tint(lightForImage1,255);
    image(images[curImage],0,0);
    lightForImage1 += fadeSpeed;
    
      if(lightForImage1 > 255) { 
        lightForImage1 = 255; 
        isCurrentFadeInOut = false;
     //   stkp=true;
        
      }
  }  
  if(lightForImage1 <= 0) {
    showNextImage = true;
    curImage++;
  }
  
  
}

void keyPressed(){ 
  if(isCurrentFadeInOut) {return;};
  if(stkp==true && key==ENTER){    
    curImage++;
  }
  
  if(curImage == 0 ||curImage == 3){
    stkp=false;
    isCurrentFadeInOut = true;
    fadeSpeed = 5;
  }//else{fadeSpeed = 255;}
  if(curImage == 9){
    stkp=false;
    isCurrentFadeInOut = true;
    fadeSpeed = 1;
  }//else{fadeSpeed = 255;}
    
  if( isCurrentFadeInOut == true){ 
  //isCurrentFadeInOut = true;
  stkp=false;
  lightForImage1 = 255;
  showNextImage = false;}else{stkp=true;}
    
    
 if(curImage>11){
   curImage=11;} 
 
 
}

void stop(){
  stkp=false; 
 }  

    
}