PImage bgpart2, shovel,book,candy,egg,goldegg,sock,tshirt,clay,shiny,intro1,intro2,win,lose;
private static final byte countdown = 10;
private static int seconds, startTime;
int gameState;
int bx,by,cx,cy,ex,ey,gx,gy,sx,sy,tx,ty,clayX,clayY;
boolean isBdisplay = false;
boolean isCdisplay = false;
boolean isEdisplay = false;
boolean isGdisplay = false;
boolean isSdisplay = false;
boolean isTdisplay = false;
boolean isClayDisplay = false;


void setup()
{
  size(640,480);
  bgpart2 = loadImage("bgpart2.jpg");
  shovel = loadImage("shovel.png"); 
  book = loadImage("book.png");
  candy = loadImage("candy.png");
  egg = loadImage("egg.png");
  goldegg = loadImage("goldegg.png");
  sock = loadImage("sock.png");
  tshirt = loadImage("tshirt.png");
  clay = loadImage("clay.png");
  lose = loadImage("lose.jpg");
  shiny  = loadImage("shiny.png");
  intro1 = loadImage("intro1.jpg");
  intro2 = loadImage("intro2.jpg");
  win = loadImage("win.jpg");
  lose = loadImage("lose.jpg");
  
  gameState = 0;
  
  bx = floor(random(200,300));
  by = floor(random(60,150));
  cx = floor(random(300,400));
  cy = floor(random(150,200));  
  ex = floor(random(400,500));
  ey = floor(random(300,250));  
  gx = floor(random(200,550));
  gy = floor(random(100,350));  
  sx = floor(random(200,300));
  sy = floor(random(300,350));
  tx = floor(random(300,400));
  ty = floor(random(200,300)); 
  clayX = -200;
  clayY = -200;

    
  //倒數文字
  fill(0);
  textSize(50);
  startTime = millis()/1000 + countdown;  
  
}

void draw()
{
  if( gameState == 0 )
  {
    image(intro1,0,0);
    if(mouseX>1.0/3.0*width && mouseX<2.0/3.0*width && mouseY>3.0/4.0*height && mouseY<height){
      image(intro2,0,0);
      
    if(mousePressed){
        gameState = 1;
      }
    }    
  }
  
  if( gameState == 1 )
  {
    image(bgpart2,0,0);  
    image(shovel,mouseX-100,mouseY-200);
    ellipse(bx,by,30,30);
    ellipse(cx,cy,30,30);
    ellipse(ex,ey,30,30);
    ellipse(gx,gy,30,30); 
    ellipse(sx,sy,30,30);
    ellipse(tx,ty,30,30);  
    
    //畫圖片 
    if(isBdisplay ==true)
    {
      image(book,bx-50,by-50);
      image(clay,bx-50,by-50);     
    }
    
    if(isCdisplay ==true)
    {
     image(candy,cx-50,cy-50);
     image(clay,cx-50,cy-50);    
    }
  
    if(isEdisplay ==true)
    {
     image(egg,ex-50,ey-50);
     image(clay,ex-50,ey-50);    
    }  
    
    if(isGdisplay ==true)
    {
      image(goldegg,gx-50,gy-50);
      image(clay,gx-50,gy-50);   
      image(shiny,gx-60,gy-100);
      gameState = 2;
    }
    
    if(isSdisplay ==true)
    {
     image(sock,sx-50,sy-50);
     image(clay,sx-60,sy-50);    
    }
    
    if(isTdisplay ==true)
    {
      image(tshirt,tx-50,ty-50);
      image(clay,tx-50,ty-50); 
    }
    
     
    //倒數計時器
    seconds = startTime - millis()/1000;
  
    if (seconds < 0)
        startTime = millis()/1000 + countdown;
    else                text(seconds, 580, 80);  
    
    //time up
    if(seconds == 0)
    {
      image(lose,0,0);
    }  
  }
  
  if( gameState == 2)
  {
    image(win,0,0);
    
  }
}  

void mousePressed()
{
    //點到圖片出現
   if(mouseX>bx && mouseX<bx+50 && mouseY>by && mouseY<by+50)
   {
     isBdisplay = true;
   } 
   
   if(mouseX>cx && mouseX<cx+50 && mouseY>cy && mouseY<cy+50)
   {
     isCdisplay = true;
   }
   if(mouseX>ex && mouseX<ex+50 && mouseY>ey && mouseY<ey+50)
   {
     isEdisplay = true;
   } 
   
   if(mouseX>gx && mouseX<gx+50 && mouseY>gy && mouseY<gy+50)
   {
     isGdisplay = true;
   }
   if(mouseX>sx && mouseX<sx+50 && mouseY>sy && mouseY<sy+50)
   {
     isSdisplay = true;
   } 
   
   if(mouseX>tx && mouseX<tx+50 && mouseY>ty && mouseY<ty+50)
   {
     isTdisplay = true;
   } 
   
   //clay
   if(mouseX>clayX && mouseX<clayX+50 && mouseY>clayY && mouseY<clayY+50)
   {
     isTdisplay = true;
   }  
   
   ////點到圖片array管理
   //for( int i=0; i< treasures.length; i++ )
   //{
   //    if( mouseX > treasures[i].x && mouseX < treasures[i].x+50 && mouseY>treasures[i].y && treasures[i].y+50)
   //        treasures[i].display = true;
   //}

}