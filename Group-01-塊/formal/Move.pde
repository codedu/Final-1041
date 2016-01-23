class Move{

PImage [] rpg = new PImage[200];
int curFrame;
int timer;
float tint=0;
boolean t=true;

Move(){
  
for(int i=25;i<40;i++){
  rpg[i-25] = loadImage("talk/move/0"+i+".png");//0-14
 } 
for(int i=11;i<53;i++){
  rpg[i+4] = loadImage("fivewin/0"+i+".png");//11-52 15-56
 } 
 //new
for(int i=57;i<60;i++){
  rpg[i] = loadImage("fivewin/0551.png");//57-59
}

for(int i=55;i<57;i++){
  rpg[i+5] = loadImage("fivewin/0"+i+".png");//55-56 60-61
 } 
for(int i=61;i<64;i++){
  rpg[i+1] = loadImage("fivewin/0"+i+".png");//61-63  62-64
 } 
for(int i=66;i<72;i++){
  rpg[i-1] = loadImage("fivewin/0"+i+".png");//66-71 65-70
 } 
for(int i=77;i<95;i++){
  rpg[i-6] = loadImage("fivewin/0"+i+".png");//77-94  71-88
 }  
 
}
  
void display(){
image(rpg[curFrame], 0, 0);      
     if(t=true){ timer ++;}
      if ( timer % 8 == 0){
        curFrame ++;
      } 
      if ( curFrame >=88){
        curFrame = 88;
      }   
      if(curFrame==28){
        t=false;
        tint+=0.1;
        tint(tint,255);       
        image(rpg[28], 0, 0); 
        if(tint>=255){
         tint=255;
         t=true ;
        }
      }
}  
   
  
}