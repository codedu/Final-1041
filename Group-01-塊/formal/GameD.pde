
class GameD{
PImage game,tip;
PImage [] dirty=new PImage[10];
int t1,t2,t3,t4,dy1,dy2,dy3,dy4;
int timer;
int tDraw=30;
PFont clear;
boolean d1=false,d2=false,d3=false,d4=false;
  
GameD(){
  game=loadImage("bg/game4.png"); 
  for(int i=1;i<5;i++){
   dirty[i]=loadImage("bg/d"+i+".png");
  }
  tip=loadImage("tips/rust.png"); 
  clear = createFont("Showcard Gothic", 24);
  t1=255;
  t2=255;
  t3=255;
  t4=255;
  frameRate(60);
}
  
void draw(){ 
    talk1.pause();
    talk2.pause();
    talk3.pause();
    talk4.pause();
    talk5.pause();
    talk6.pause();
  image(game,0,0);
  tint(255,t1);
  image(dirty[1],0,dy1);
  tint(255,t2);
  image(dirty[2],0,dy2);
  tint(255,t3);
  image(dirty[3],0,dy3);
  tint(255,t4);
  image(dirty[4],0,dy4);
  tint(255,255);
  image(dirty[2],0,480);
  
  timer++;
  if(timer%60==0){
   tDraw-=1;
  }
  if(tDraw<=0){
   tDraw=0;
  }
  
  textFont(clear, 45);
  textAlign(LEFT);
  fill(255);  
  text("time:"+tDraw,75,90);
  textFont(clear, 25);
  image(tip,25,15);
/*  fill(255);  
  text("Click on the rust ",60,140);
  text("to sharpen the knife",60,170); */
  
  if(t1<=0){
   textFont(clear, 28);
   fill(0,255,230);  
   text("Clear ",290,270); 
  }
  if(t2<=0){
   textFont(clear, 28); 
   fill(0,255,230);  
   text("Clear ",380,150); 
  }
  if(t3<=0){
   textFont(clear, 28); 
   fill(0,255,230);  
   text("Clear ",470,135); 
  }
  if(t4<=0){
   textFont(clear, 28); 
   fill(0,255,230);  
   text("Clear ",380,210); 
  }
}

void mousePressed(){
  if(mouseX>=300 && mouseX<=350){
    if(mouseY>=240 && mouseY<=280){
      t1-=12;   
      if(t1<=0){
       dy1=600;
       d1=true;
     }
    }
  }
  if(mouseX>=380 && mouseX<=430){
    if(mouseY>=130 && mouseY<=170){
      t2-=24;
      if(t2<=0){
       dy2=700; 
       d2=true;}
    }
  }
  if(mouseX>=440 && mouseX<=510){
    if(mouseY>=100 && mouseY<=170){
      t3-=6;
      if(t3<=0){
       dy3=800;
       d3=true;}
    }
  }
  if(mouseX>=380 && mouseX<=430){
    if(mouseY>=170 && mouseY<=230){
      t4-=12;
      if(t4<=0){
       dy4=900; 
       d4=true;}
    }
  }
}//mouse
    
}//class