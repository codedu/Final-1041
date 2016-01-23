PImage bb,cro,lion,owl,pen,polar;
int [] x = new int [6];
int [] y = new int [6];

boolean []isDragged = new boolean[6]; 

int []direction = new int[6];
final int rightDown=0, rightUp=1, leftDown=2, leftUp=3;
int []speed= new int [6];
void setup(){
  
  size(640,480);
  bb=loadImage("blackbear.png");
  cro=loadImage("crocodile.png");
  lion=loadImage("lion.png");
  owl=loadImage("owl.png");
  pen=loadImage("penguin.png");
  polar=loadImage("polarbear.png");
  
  for(int i = 0; i<6; i++){
  isDragged[i]=false;
  x[i]=floor(random(width));
  y[i]=floor(random(height/2,height));
  direction[i]=floor(random(4));
  speed[i]=floor(random(1,5));
  }
  
}

void draw(){
  
  background(255);
  
  imageMode(CENTER);
  image(bb,x[0],y[0]);
  image(cro,x[1],y[1]);
  image(lion,x[2],y[2]);
  image(owl,x[3],y[3]);
  image(pen,x[4],y[4]);
  image(polar,x[5],y[5]);  



for(int i=0; i<6; i++){
  
  if(direction[i]==0){
  x[i]+=speed[i];
  y[i]+=speed[i];
  if(x[i]+39>width){
  direction[i]=2;
  }
  if(y[i]+50>height){
  direction[i]=1;
  }
  }else if(direction[i]==1){
  x[i]+=speed[i];
  y[i]-=speed[i];
  if(x[i]+39>width){
  direction[i]=4;
  }
  if(y[i]-50<height/2){
  direction[i]=0;
  }
  }else if(direction[i]==2){
  x[i]-=speed[i];
  y[i]+=speed[i];
  if(x[i]-39<0){
  direction[i]=0;
  }
  if(y[i]+50>height){
  direction[i]=3;
  }
  }else{
  x[i]-=speed[i];
  y[i]-=speed[i];
  if(x[i]-39<0){
  direction[i]=1;
  }
  if(y[i]-50<height/2){
  direction[i]=2;
  }
  }
  
  if(isDragged[i]==true){
  x[i]=mouseX;
  y[i]=mouseY;
  }

  
  }
  
}

void mouseDragged(){
 if(mouseX>x[0]-bb.width/2 && mouseX<x[0]+bb.width/2 && mouseY>y[0]-bb.height/2 && mouseY<y[0]+bb.height/2){
 for(int i=0; i<6; i++){
 if(isDragged[1]==isDragged[2]==isDragged[3]==isDragged[4]==isDragged[5]==false){
 if(i==0){
 isDragged[i]=true;
 }else{
 isDragged[i]=false;
 }
 }
 }
 }
 if(mouseX>x[1]-cro.width/2 && mouseX<x[1]+cro.width/2 && mouseY>y[1]-cro.height/2 && mouseY<y[1]+cro.height/2){
 for(int i=0; i<6; i++){
 if(isDragged[0]==isDragged[2]==isDragged[3]==isDragged[4]==isDragged[5]==false){
 if(i==1){
 isDragged[i]=true;
 }else{
 isDragged[i]=false;
 }
 }
 }
 }
 if(mouseX>x[2]-lion.width/2 && mouseX<x[2]+lion.width/2 && mouseY>y[2]-lion.height/2 && mouseY<y[2]+lion.height/2){
 for(int i=0; i<6; i++){
 if(isDragged[0]==isDragged[1]==isDragged[3]==isDragged[4]==isDragged[5]==false){
 if(i==2){
 isDragged[i]=true;
 }else{
 isDragged[i]=false;
 }
 }
 }
 }
 if(mouseX>x[3]-owl.width/2 && mouseX<x[3]+owl.width/2 && mouseY>y[3]-owl.height/2 && mouseY<y[3]+owl.height/2){
 for(int i=0; i<6; i++){
 if(isDragged[0]==isDragged[1]==isDragged[2]==isDragged[4]==isDragged[5]==false){
 if(i==3){
 isDragged[i]=true;
 }else{
 isDragged[i]=false;
 }
 }
 }
 }
 if(mouseX>x[4]-pen.width/2 && mouseX<x[4]+pen.width/2 && mouseY>y[4]-pen.height/2 && mouseY<y[4]+pen.height/2){
 for(int i=0; i<6; i++){
 if(isDragged[0]==isDragged[1]==isDragged[2]==isDragged[3]==isDragged[5]==false){
 if(i==4){
 isDragged[i]=true;
 }else{
 isDragged[i]=false;
 }
 }
 }
 }
 if(mouseX>x[5]-polar.width/2 && mouseX<x[5]+polar.width/2 && mouseY>y[5]-polar.height/2 && mouseY<y[5]+polar.height/2){
 for(int i=0; i<6; i++){
 if(isDragged[0]==isDragged[1]==isDragged[2]==isDragged[3]==isDragged[4]==false){
 if(i==5){
 isDragged[i]=true;
 }else{
 isDragged[i]=false;
 }
 }
 }
 }
}

void mouseReleased(){
for(int i=0; i<6; i++){
isDragged[i]=false;
}
}