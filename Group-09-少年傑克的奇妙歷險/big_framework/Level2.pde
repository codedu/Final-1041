class Level2 {
  PImage bgpart2, shovel, book, candy, egg, goldegg, sock, tshirt, clay, shiny, intro1, intro2, win1, win2, lose1, lose2;
  private static final byte countdown = 10;
  int seconds, startTime, count;
  int gameState;
  int bx, by, cx, cy, ex, ey, gx, gy, sx, sy, tx, ty, clayX, clayY;
  boolean isBdisplay = false;
  boolean isCdisplay = false;
  boolean isEdisplay = false;
  boolean isGdisplay = false;
  boolean isSdisplay = false;
  boolean isTdisplay = false;
  boolean isClayDisplay = false;

  Level2() {

    this.bgpart2 = loadImage("img2/bgpart2.jpg");
    this.shovel = loadImage("img2/shovel.png"); 
    this.book = loadImage("img2/book.png");
    this.candy = loadImage("img2/candy.png");
    this.egg = loadImage("img2/egg.png");
    this.goldegg = loadImage("img2/goldegg.png");
    this.sock = loadImage("img2/sock.png");
    this.tshirt = loadImage("img2/tshirt.png");
    this.clay = loadImage("img2/clay.png");
    this.lose1 = loadImage("img2/lose1.jpg");
    this.shiny  = loadImage("img2/shiny.png");
    this.intro1 = loadImage("img2/intro1.jpg");
    this.intro2 = loadImage("img2/intro2.jpg");
    this.win1 = loadImage("img2/win1.jpg");
    this.win2 = loadImage("img2/win2.jpg");
    this.lose2 = loadImage("img2/lose2.jpg");

    this.gameState = 0;

    this.bx = floor(random(200, 300));
    this.by = floor(random(60, 150));
    this.cx = floor(random(300, 400));
    this.cy = floor(random(150, 200));  
    this.ex = floor(random(400, 500));
    this.ey = floor(random(300, 250));  
    this.gx = floor(random(200, 550));
    this.gy = floor(random(100, 350));  
    this.sx = floor(random(200, 300));
    this.sy = floor(random(300, 350));
    this.tx = floor(random(300, 400));
    this.ty = floor(random(200, 300)); 
    this.clayX = -200;
    this.clayY = -200;
    //倒數文字
    //this.startTime = millis()/1000 + countdown;
  }

  void draw()
  {
    //mousePressed();
    if ( gameState == 0 )
    {
      image(intro1, 0, 0);
      if(musicWaitAll.isPlaying() == false)
      {
        musicWaitAll.play(0);
      }
      if (mouseX>1.0/3.0*width && mouseX<2.0/3.0*width && mouseY>3.0/4.0*height && mouseY<height) {
        image(intro2, 0, 0);

        if (mousePressed) {
          musicClickAll.trigger();
          gameState = 1;
        }
      }
      this.startTime = millis()/1000 + countdown;
    }

    if ( gameState == 1 )
    {
      if (musicWaitAll.isPlaying()) {
        musicWaitAll.pause();
        musicLevel2.loop();
      }

      image(bgpart2, 0, 0);  
      image(shovel, mouseX-70, mouseY-130);
      //ellipse(bx, by, 30, 30);
      //ellipse(cx, cy, 30, 30);
      //ellipse(ex, ey, 30, 30);
      //ellipse(gx, gy, 30, 30); 
      //ellipse(sx, sy, 30, 30);
      //ellipse(tx, ty, 30, 30);  

      //畫圖片 
      if (isBdisplay ==true)
      {
        image(book, bx-50, by-50);
        image(clay, bx-50, by-50);
      }

      if (isCdisplay ==true)
      {
        image(candy, cx-50, cy-50);
        image(clay, cx-50, cy-50);
      }

      if (isEdisplay ==true)
      {
        image(egg, ex-50, ey-50);
        image(clay, ex-50, ey-50);
      }  

      if (isGdisplay ==true)
      {
        image(goldegg, gx-50, gy-50);
        image(clay, gx-50, gy-50);   
        image(shiny, gx-60, gy-100);
        gameState = 2;
      }

      if (isSdisplay ==true)
      {
        image(sock, sx-50, sy-50);
        image(clay, sx-60, sy-50);
      }

      if (isTdisplay ==true)
      {
        image(tshirt, tx-50, ty-50);
        image(clay, tx-50, ty-50);
      }


      //倒數計時器
      seconds = startTime - millis()/1000;

      if (seconds < -10) {
        startTime = millis()/1000 + countdown;
      } else  text(seconds, 580, 80);  

      //time up
      if (seconds > -10 && seconds<=0)
      {
        if (musicLevel2.isPlaying()) {
          musicLevel2.pause();
          musicLoseAll.play();
        }
        if (second() % 2 == 1 ) {
          image(lose1, 0, 0);
        } else {
          image(lose2, 0, 0);
        }
        this.bx = floor(random(200, 300));
        this.by = floor(random(60, 150));
        this.cx = floor(random(300, 400));
        this.cy = floor(random(150, 200));  
        this.ex = floor(random(400, 500));
        this.ey = floor(random(300, 250));  
        this.gx = floor(random(200, 550));
        this.gy = floor(random(100, 350));  
        this.sx = floor(random(200, 300));
        this.sy = floor(random(300, 350));
        this.tx = floor(random(300, 400));
        this.ty = floor(random(200, 300)); 
        isBdisplay = false;
        isCdisplay = false;
        isEdisplay = false;
        isGdisplay = false;
        isSdisplay = false;
        isTdisplay = false;
        isClayDisplay = false;
        if (mousePressed) {
          if (mouseX>45 & mouseX<220 & mouseY>395 & mouseY<455) {
            startTime = millis()/1000 + countdown;
            gameState =0;
          }
        }
      }
    }
    if (gameState ==2) {
      count++ ;
      if (count== 60*1.5) {
        gameState=3;
      }
    }
    if ( gameState == 3)
    {
      if (musicLevel2.isPlaying()) {
        musicLevel2.pause();
        musicWinAll.play();
      }
      if (second() % 2 == 1 ) {
        image(win1, 0, 0);
      } else {
        image(win2, 0, 0);
      }
      if (mousePressed) {
        if (mouseX>455 & mouseX<600 & mouseY>395 & mouseY<455) {
          musicClickAll.trigger();
          state=GameState.PLAYINGthree;
        }
      }
    }
  }  
  
  boolean firstDig = true;
  
  void mousePressed()
  {
    if (mousePressed) {
      //點到圖片出現
      if( firstDig )
      {
        musicClay2.trigger();
        firstDig = false;
      }
      
      if (mouseX>bx && mouseX<bx+80 && mouseY>by && mouseY<by+80)
      {
        isBdisplay = true;
      } 

      if (mouseX>cx && mouseX<cx+80 && mouseY>cy && mouseY<cy+80)
      {
        isCdisplay = true;
      }
      if (mouseX>ex && mouseX<ex+80 && mouseY>ey && mouseY<ey+80)
      {
        isEdisplay = true;
      } 

      if (mouseX>gx && mouseX<gx+80 && mouseY>gy && mouseY<gy+80)
      {
        isGdisplay = true;
        musicGoldEgg2.trigger();
      }
      if (mouseX>sx && mouseX<sx+80 && mouseY>sy && mouseY<sy+80)
      {
        isSdisplay = true;
      } 

      if (mouseX>tx && mouseX<tx+80 && mouseY>ty && mouseY<ty+80)
      {
        isTdisplay = true;
      } 

      //clay
      if (mouseX>clayX && mouseX<clayX+50 && mouseY>clayY && mouseY<clayY+50)
      {
        isTdisplay = true;
      }
    }
    else
    {
      firstDig = true;
    }
  }
}