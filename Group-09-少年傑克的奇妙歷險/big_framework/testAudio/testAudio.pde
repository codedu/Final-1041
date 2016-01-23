import ddf.minim.*;
Minim minim;
AudioPlayer song;
void setup(){
size (100,100);
minim = new Minim(this);
song = minim.loadFile("01.Main Theme I - Opening.mp3");
song.play();
}
void draw(){
}