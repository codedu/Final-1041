class Bg{
int x=0;
int y=0;
PImage img;

Bg(String filename){
x=0;
y=0;
img = loadImage(filename);
}

void display(){
x=0;
y=0;
img.resize(640,480);

image(img,x,y);
}
void display(int x, int y){
this.x=x;
this.y=y;
img.resize(640,480);
image(img,x,y);
}
}