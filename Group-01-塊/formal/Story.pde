
class Story{
int currentImage=0 ;
boolean isCurrentFadeInOut = false; 
PImage [] images = new PImage[200];
PImage [] rpg = new PImage[200];
PImage CG3,CG4,CG5,CG6,CG7,room,game,bg,hospital,run,sun,focus;
int lightForImage1 = 255;
float fadeSpeed =5 ;
boolean showNextImage = false;
boolean stkp=false;

Story(){
 for(int i=0;i<25;i++){
  images[i] = loadImage("OPENING/0"+i+".png");//0-24
 }
 
 for(int i=40;i<56;i++){
  images[i-15] = loadImage("OPENING/0"+i+".png");//40-56  25-40
 }
 
 for(int i=0;i<11;i++){
  images[i+41] = loadImage("fivewin/0"+i+".png");//0-10  41-51  
 }

 for(int i=53;i<56;i++){
  images[i-1] = loadImage("fivewin/0"+i+".png");//53-55  52-54   
 }

 images[55] = loadImage("fivewin/057.png");
 images[56] = loadImage("fivewin/black.png");
 
 for(int i=58;i<62;i++){
  images[i-1] = loadImage("fivewin/0"+i+".png");//58-61 57-60  
 }
 for(int i=64;i<67;i++){
  images[i-3] = loadImage("fivewin/0"+i+".png");//64-66 61-63
 }
  for(int i=72;i<78;i++){
  images[i-8] = loadImage("fivewin/0"+i+".png");//72-77 64-69
 }
  for(int i=95;i<107;i++){
  images[i-25] = loadImage("fivewin/0"+i+".png");//94-106 //redlight_096 //70-81  
 }
 for(int i=1;i<6;i++){
  images[i+81] = loadImage("fivewin/win/0"+i+".png");//1-5 82-86
 }
 for(int i=1;i<65;i++){
  images[i+86] = loadImage("fivewin/win/win/0"+i+".png");//1-61 87-150
 }
  
 
 CG3=loadImage("bg/CG3.png");
 CG4=loadImage("bg/CG4.png");
 CG5=loadImage("bg/CG5.png");
 CG6=loadImage("bg/CG6.png");
 CG7=loadImage("bg/CG7.png");
 room=loadImage("bg/room.png");
 game=loadImage("bg/game2.png");
 bg=loadImage("bg/game2bg.png");
 hospital=loadImage("bg/hospital.png");
 run=loadImage("bg/run.jpg");
 sun=loadImage("bg/sun.png");
 focus=loadImage("bg/focus.png");
}

void draw(){
 if(isCurrentFadeInOut){
    stkp=false;
   fadeInFadeOut();
  }else{
    image(images[currentImage], 0, 0);
  }
  
  if(currentImage==9){
    if(!effect1.isPlaying()){effect1.play();} 
  }
  if(currentImage==10){
    effect1.pause();
  }
  
  if(currentImage==45){
    effect9.pause();
  }
   if(currentImage==42){
    if(!effect3.isPlaying()){effect3.play();} 
  }
   if(currentImage==44){
      effect3.pause();
      if(!effect9.isPlaying()){effect9.play();} 
  }
   if(currentImage==45){
    effect9.pause();
  }
  if(currentImage==87){
    if(!effect6.isPlaying()){effect6.play();} 
  }
  
  if(currentImage==88){
    effect6.pause();
  }
  if(currentImage==93){
    if(!effect7.isPlaying()){effect7.play();} 
  }
  if(currentImage==94){
    effect7.pause();
    if(!effect8.isPlaying()){effect8.play();} 
  }
  if(currentImage==97){
     effect8.pause();
  }
  
  if(currentImage>=23){
    talk1.pause();
  }
  if(currentImage==25){
    if(!talk2.isLooping()){talk2.loop();} 
  }
  if(currentImage==49){
    if(!talk3.isLooping()){talk3.loop();} 
  }
  if(currentImage>=56){
    talk3.pause();
  }
   if(currentImage==57){
    if(!talk4.isLooping()){talk4.loop();} 
  }
  if(currentImage>=81){
    talk4.pause();
  }
  
  if(currentImage>=97){
    if(!talk5.isLooping()){talk5.loop();} 
  }
  if(currentImage>=148){
    talk5.pause();
  }


 if(currentImage==24){
    stkp=false;
   // start.curFlame=0;
    move.display();

    if(move.timer>=120){
      move.timer=120;
      stkp=true;
      currentImage=25;
      image(images[currentImage], 0, 0);
    }
  }
  if(currentImage==51){
    stkp=false;
    move.display();
    //start.curFlame ++;
    if(move.timer>=456){
      move.timer=456;
      stkp=true;
      currentImage=52;
      image(images[currentImage], 0, 0);
    }
  }
  
  if(currentImage==54){
    stkp=false;
    move.display();
    //start.curFlame ++;
    if(move.timer>=496){
      move.timer=496;
      stkp=true;
      currentImage=55;
      image(images[currentImage], 0, 0);
    }
  }
   if(currentImage==60){
    stkp=false;
    move.display();
    //start.curFlame ++;
    if(move.timer>=520){
      move.timer=520;
      stkp=true;
      currentImage=61;
      image(images[currentImage], 0, 0);
    }
  }
   if(currentImage==63){
    stkp=false;
    move.display();
    //start.curFlame ++;
    if(move.timer>=568){
      move.timer=568;
      stkp=true;
      currentImage=64;
      image(images[currentImage], 0, 0);
    }}
    
    if(currentImage==69){
      stkp=false;
      move.display();
      //start.curFlame ++;
      if(move.timer>=712){
        move.timer=712;
        stkp=true;
        currentImage=70;
        image(images[currentImage], 0, 0);
      }}
         
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
  if(isCurrentFadeInOut) {return;}
  if(stkp==true && key==ENTER){ 
    
    currentImage++;
  }
  
  if( currentImage == 23 || currentImage == 40 || currentImage == 44|| currentImage == 48 || currentImage == 53 || currentImage == 56 || currentImage == 59 
    || currentImage == 88 || currentImage == 96){
    stkp=false;
    isCurrentFadeInOut = true;
    fadeSpeed = 5;
  }
  if(currentImage == 93){
    stkp=false;
    isCurrentFadeInOut = true;
    fadeSpeed = 1;
  }
 
    
  if( isCurrentFadeInOut == true){ 
  //isCurrentFadeInOut = true;
  stkp=false;
  lightForImage1 = 255;
  showNextImage = false;}else{stkp=true;}
    
 
 if(currentImage>=149){
   currentImage=149;}
    
 
}

void stop(){
  stkp=false; 
}

}//STORY