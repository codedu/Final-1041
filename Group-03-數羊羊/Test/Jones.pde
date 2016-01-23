class Jones {
  float x, y, position;
  PImage jones;
  float speed;
  int jumpCount, time;
  boolean isJumping = false;
  boolean isFalling = false;
  boolean leavingPosition = false;
  boolean hitDetect = false;
  boolean stuck1= false;boolean stuck7= false;boolean stuck13= false;boolean stuck19= false;boolean stuck25= false;boolean stuck31= false;boolean stuck37= false;boolean stuck43= false;
  boolean stuck2= false;boolean stuck8= false;boolean stuck14= false;boolean stuck20= false;boolean stuck26= false;boolean stuck32= false;boolean stuck38= false;boolean stuck44= false;
  boolean stuck3= false;boolean stuck9= false;boolean stuck15= false;boolean stuck21= false;boolean stuck27= false;boolean stuck33= false;boolean stuck39= false;boolean stuck45= false;
  boolean stuck4= false;boolean stuck10= false;boolean stuck16= false;boolean stuck22= false;boolean stuck28= false;boolean stuck34= false;boolean stuck40= false;
  boolean stuck5= false;boolean stuck11= false;boolean stuck17= false;boolean stuck23= false;boolean stuck29= false;boolean stuck35= false;boolean stuck41= false;
  boolean stuck6= false;boolean stuck12= false;boolean stuck18= false;boolean stuck24= false;boolean stuck30= false;boolean stuck36= false;boolean stuck42= false;
//boolean alive= true;
  float acc = 18;
  
  Jones() {
    jones=loadImage("jones.png");
    speed=5;
    position=150;
    x=position;
    y=height-jones.height-groundHeight;
  }

  boolean alive(){
    if(this.x<=-jones.width || this.y > height- groundHeight-jones.height ){  
      return false;
    }else{return true;}  
  }
  
  void falling(){
    if(this.y>height- groundHeight-jones.height){
      this.y+=5;
    }
  }
  
  void jump() {
    if (isJumping) {
      return;
    }
    isJumping = true;
    isFalling = false;
    acc = 18;
  }

  void drawJump() {
    if (!isFalling) {
      y-= acc;
      acc-=0.5;
    } else {
      y+= acc;
      acc+=0.5;
      if (acc == 18) {
        y+= acc;
        isJumping = false;
      }
    }    
    if (acc == 0) {
      isFalling = true;
    }
  }

  void display() {
    image(jones, x, y);
    if (isJumping) {
      drawJump();
    }
  }

  void getStuck() {
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x1,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck1=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x2,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck2=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x3,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck3=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x4,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck4=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x5,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck5=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x6,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck6=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x7,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck7=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x8,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck8=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x9,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck9=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle.x10,obstacle.y,obstacle.obstacle.width,obstacle.obstacle.height)){ 
        this.x-=obstacle.speed; 
        stuck10=true;
    }
    
    
     if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x1,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck11=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x2,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck12=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x3,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck13=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x4,obstacle.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck14=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x5,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck15=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x6,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck16=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x7,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck17=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x8,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck18=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x9,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck19=true;
    }
    if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x10,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck20=true;
    }
     if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x11,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck21=true;
    }
     if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x12,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck22=true;
    }
     if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x13,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck23=true;
    }
     if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x14,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck24=true;
    }
     if(isCollide(this.x,this.y,jones.width,jones.height,obstacle2.x15,obstacle2.y,obstacle2.obstacle.width,obstacle2.obstacle.height)){ 
        this.x-=obstacle2.speed; 
        stuck25=true;
    }
  
  }
    
  void backToPosition() { 
    if(stuck1){
      if (this.x>=obstacle.x1+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
      if (this.x>=obstacle2.x1+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
     if(stuck2){
      if (this.x>=obstacle.x2+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
     
    }
     if(stuck3){
      if (this.x>=obstacle.x3+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }    
    }
    if(stuck4){
      if (this.x>=obstacle.x4+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }     
    }
    if(stuck5){
      if (this.x>=obstacle.x5+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
    if(stuck6){
      if (this.x>=obstacle.x6+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
    if(stuck7){
      if (this.x>=obstacle.x7+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
    if(stuck8){
      if (this.x>=obstacle.x8+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
    if(stuck9){
      if (this.x>=obstacle.x9+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
    if(stuck10){
      if (this.x>=obstacle.x10+obstacle.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
     if(stuck11){
       if (this.x>=obstacle2.x1+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
     if(stuck12){
       if (this.x>=obstacle2.x2+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
     if(stuck13){
       if (this.x>=obstacle2.x3+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
     if(stuck14){
       if (this.x>=obstacle2.x4+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
     if(stuck15){
       if (this.x>=obstacle2.x5+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
     }
       if(stuck16){
       if (this.x>=obstacle2.x6+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
       }
       if(stuck17){
       if (this.x>=obstacle2.x7+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
       }
       if(stuck18){
       if (this.x>=obstacle2.x8+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
       if(stuck19){
       if (this.x>=obstacle2.x9+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
       }
       if(stuck20){
       if (this.x>=obstacle2.x10+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
    }
       if(stuck21){
       if (this.x>=obstacle2.x11+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
     }
       if(stuck22){
       if (this.x>=obstacle2.x12+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }}
       if(stuck23){
       if (this.x>=obstacle2.x13+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
       }
       if(stuck24){
       if (this.x>=obstacle2.x14+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
       }
       if(stuck25){
       if (this.x>=obstacle2.x15+obstacle2.obstacle.height && this.y==height-jones.height-groundHeight) {
        x+=speed;
      }
       }
    
    
    if (x>=position) {
      this.x= position;
      stuck1=false;
      stuck2=false;
      stuck3=false;
      stuck4=false;
      stuck5=false;
      stuck6=false;
      stuck7=false;
      stuck8=false;
      stuck9=false;
      stuck10=false;
      stuck11=false;
      stuck12=false;
      stuck13=false;
      stuck14=false;
      stuck15=false;
      stuck16=false;
      stuck17=false;
      stuck18=false;
      stuck19=false;
      stuck20=false;
      stuck21=false;
      stuck22=false;
      stuck23=false;
      stuck24=false;
      stuck25=false;
      
    }
  }
  
  void capture(){
    for(int i=0; i<sheeps.length; i++){
      if(isCollide(this.x,this.y,jones.width,jones.height,sheeps[i].x,sheeps[i].y,sheeps[i].sheep.width,sheeps[i].sheep.height)){
        sheeps[i].getCaught();
        sheeps[i].sheepBeAdded= true;
        if(sheeps[i].x<=this.x-sheeps[i].sheep.width/4){
          sheeps[i].x=this.x-sheeps[i].sheep.width/4;
          
    
        }
      }
    }
  }
  
  
}