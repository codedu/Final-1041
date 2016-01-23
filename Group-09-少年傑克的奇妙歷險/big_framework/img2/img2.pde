class Treasure {
  int x;
  int y;
  PImage image;
  boolean display;
  
  Treasure( int inputX, int inputY, String imgName )
  {
    x = inputX;
    y = inputY;
    image = loadImage( imgName );
    display = false;
  }
}