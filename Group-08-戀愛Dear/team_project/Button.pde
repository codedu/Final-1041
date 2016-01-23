class Button {
  float x;
  float y;
  float w;
  float h;
  PImage img;

  Button(String name, float x, float y) {
    img = loadImage(name+".png");
    this.x = x;
    this.y = y;
    w = img.width;
    h = img.height;
  }

  void display() {
    //fill(255, 0, 0);
    //noStroke();
    //ellipse(x+w/2, y+h/2, w, h);
    image(img, x, y);
  }
}