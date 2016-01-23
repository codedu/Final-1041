class Ground{
  //properties
  PImage ground;
  float x;
  float y;
  float speed;

Ground(String filename){
   ground=loadImage(filename);
   x=0;
   y=0;
   speed=3;
}
  //methods
  void moveTo(float x,float y){
    this.x=x;
    this.y=y;
  }
  void display (){
    image(ground,x,y);  
  }
  void move(){
    this.x-=speed;
  }

}