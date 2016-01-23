class Shooter{  
  
  float distx,disty,exp;
  float strength=0.5;
  float x=0.0;
  float y=0.0;
  float step=0.01;
  float pct=0.0;
  PImage shooter;
  
      void display(){
      
        shooter=loadImage("game2/throw.png");
        image(shooter,460,240);
       
      
      }  


      void shoot(){
        
        if(mouseX>460&&mouseX<530&&mouseY>220&&mouseY<220+shooter.height){     
          if (mousePressed==true){
            
            rect(332,120,strength++,10);
              if(strength>120){strength=120;}
          }
          else{
            strength=0;  
          }
    
         }
        }
          
}