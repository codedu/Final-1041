class Tea{
  PImage dropImg, teabgImg, teatopImg,cup0Img,cup1Img,win3Img,lose3Img;
  PImage count;
  float teatopX, teatopSpeed;
  float cupX, cupSpeed;
  float dropSpacingY, dropSpacingX, dropSpeed;
  int dropNbr=12,dropCount=0,cupNbr;
  float [] dropX = new float[dropNbr];
  float [] dropY = new float[dropNbr];
  boolean dropDetect=false;
  PFont cupCount;
  int countNbr=0;
 
  
  Tea(){
    cup0Img=loadImage("game3/cup0.png");
    cup1Img=loadImage("game3/cup1.png");
    dropImg=loadImage("game3/drop.png");
    teabgImg=loadImage("game3/teabg.png");
    teatopImg=loadImage("game3/teatop.png");
    win3Img=loadImage("game3/win3.png");
    lose3Img=loadImage("game3/lose3.png");
    count=loadImage("game3/cup0.png");
    //tea
    teatopX=width/2-teatopImg.width/2;
    teatopSpeed=5;
    //cup
    cupSpeed=5;
    cupNbr=00;
    //drop
    dropSpeed=0;
    dropSpacingY=30;
    dropSpacingX=0;
    cupCount=createFont("Arial",30);
    textFont(cupCount,30);
    textAlign(CENTER); 
    dropDetect=false;
    rightPressed=false;
    leftPressed=false;
  }
  
  void draw(){
    count.resize(70,60);
    image(count,603,35);
    
    //teatop
    if(teatopX-dropImg.width-45<=0 || teatopX>=width-teatopImg.width){
      teatopSpeed*=-1;
    }
    image(teatopImg,teatopX+=teatopSpeed,teatopImg.height/2);
    
    //drop
    for(int i=0; i<dropNbr; i++){
      dropSpeed+=0.3;
      dropX[i]=teatopX-dropImg.width-i*(dropSpacingX-i)-teatopImg.width/3;
      dropY[i]=dropSpeed+i*dropSpacingY+teatopImg.height;
      if(dropY[i]>=height){
        dropSpeed=0;
      }
      image(dropImg,dropX[i],dropY[i]);
    }
  
   //control cup
   if(rightPressed){
     cupX+=cupSpeed;
   }if(cupX>width-cup0Img.width){
     cupX=width-cup0Img.width;
    }
   if(leftPressed){
     cupX-=cupSpeed;
   }if(cupX<0){
      cupX=0;
   }
   
   //drop & cup detection
   for(int i=0; i<dropNbr; i++){
     if(dropX[i]<cupX+dropImg.width && dropX[i]>cupX-cup0Img.width && dropY[i]>400){
       dropCount++;
       
     }
     
     if(dropCount>=100){
       dropDetect=true;
       if(key==' '){
  tea.countNbr++;
  tea.dropCount=0;
  tea.dropDetect=false;
  }
       
     }else if(dropCount<100){
       dropDetect=false;
     }
  
     
     if(dropDetect==false){
       image(cup0Img,cupX,430);
     }else{
       image(cup1Img,cupX,430);
     }
   
   }
   
   //time & cup count
   textSize(20);
   text("X "+countNbr,600,45); 
   
   
   

 
}



}