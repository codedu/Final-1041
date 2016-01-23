class Aim{
  int ballX;
  int ballY;
  int reverse = 5;
  float t = 1,ballwalk;
  Aim () {
    
    
  }
  
  void display(int x, int y){
    strokeWeight(6);
    noFill();
    pushMatrix();
    translate(15,170);
    ellipse(x,y,50,50);
    line(x-50,y,x+50,y);
    line(x,y-50,x,y+50);
    ballX = x;
    ballY = y;
    popMatrix();
  }
  
  void ball(){
    //for(i = 0;i<=1;i+=0.1){
    //pushMatrix();
    //translate(width/2,height/2);
    //t = t%180;
    ballwalk = map(t,0,180,0,PI);
   // for(i = 0;i<=8;i++){
    //rotate(i*(1.0/100)*PI);
    ellipse(ballX +80*cos(ballwalk),ballY +80*sin(ballwalk),20,20);
    //}
    t+=reverse;
    if(t>180||t<0)
      reverse*=-1;
    //popMatrix();
    //}
    /*i-=0.001;
    if(i==-1){
      i =0;
    }*/
  }

  
}