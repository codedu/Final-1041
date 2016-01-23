class HPDisplay {
PImage pig;
int wallet;
  HPDisplay () {
    pig = loadImage("img/pig.png");
    wallet=5;
  }
  
  void updateWallet(int wallet){
    image(pig,580, 45);
textSize(20);
textAlign(RIGHT);
fill(0);  // fill color 0-255: grey scale
text(wallet, (width-pig.width)+70,55);
    if(wallet<0){
    gameState=GAME_OVER;
    
    }
  } 
  
  

}