class Dropbean {
  int dropY;
  int speed = 2;
  int a, b, c, d, e=0;
  int randomSpeed[]=new int [5];
  PImage boot; //128
  PImage rock; //128-105=13/2=+7 
  PImage airplane; //128-74=54/2=+27     //102-164=-42
  PImage beanstalk; //151-128=23/2=-11
  PImage beanstalk2; //153-128=25/2=-12
  PImage dropThing[]= new PImage[5];
  int arrayNum[]= new int[5];
  int ranY[] = new int[5];
  int beanstalkX=0;
  PImage jackWH ;
  boolean that=false;

  Dropbean() {

    this.boot = loadImage("img/boot.png");
    this.rock = loadImage("img/rock.png");
    this.airplane = loadImage("img/airplane.png");
    this.beanstalk = loadImage("img/beanstalk.png");
    this.beanstalk2 = loadImage("img/beanstalk2.png");
    this.jackWH = loadImage("img/JATB.png");
  }

  void changeDrop() {

    a=floor(random(5));
    arrayNum[0]=a;

    b=floor(random(5));
    while (isExist(b, arrayNum)) {
      b=floor(random(5));
    }
    arrayNum[1]=b;

    c=floor(random(5));
    while (isExist(c, arrayNum)) {
      c=floor(random(5));
    }
    arrayNum[2]=c;

    d=floor(random(5));
    while (isExist(d, arrayNum)) {
      d=floor(random(5));
    }
    arrayNum[3]=d;

    e=10-a-b-c-d;
    arrayNum[4]=e;

    dropThing[a]=this.boot;
    dropThing[b]=this.rock;
    dropThing[c]=this.airplane;
    dropThing[d]=this.beanstalk;
    dropThing[e]=this.beanstalk2;
    beanstalkX=spaceWidth*d-20;

    dropY=-150;
    for (int i=0; i<5; i++) {
      ranY[i]= floor(random(-150,0));
      arrayNum[i]= -1;
    }
  }

  void draw() {
    //for (int i=0; i<5; i++) {
    image(dropThing[a], spaceWidth*a, dropY+ranY[0]);
    image(dropThing[b], spaceWidth*b+5, dropY+ranY[1]);
    image(dropThing[c], spaceWidth*c+19, dropY-35+ranY[2]);
    image(dropThing[d], spaceWidth*d-8, dropY+ranY[3]);
    image(dropThing[e], spaceWidth*e-8, dropY+ranY[4]);
    //}
  }

  void move() {
    dropY+=speed;
  }

  boolean isExist(int num, int []arrayNum) {
    for (int i=0; i<arrayNum.length; i++) {
      if (arrayNum[i]==num) {
        return true;
      }
    }
    return false;
  }
  boolean isGet(int x, int y) {
    that=false;

    if (isHit(beanstalkX, dropY+ranY[3], beanstalk.width-30, beanstalk.height-40, 
      x, y, jackWH.width-30, jackWH.height-30)) {
      //return true;
      that=true;
    } else /*return false;*/  that=false;

    if (that) {
      return true;
    } else return false;
  }
  boolean isSmash(int x, int y, int num) {
    that=false;
    if (num==c) {
      if (isHit(spaceWidth*num, dropY+ranY[c], dropThing[num].width-50, 
        dropThing[num].height-50, x, y, jackWH.width-20, jackWH.height-40)) {
        that= true;
      } else that= false;
    } else {
      if (isHit(spaceWidth*num, dropY+ranY[num], dropThing[num].width-100, 
        dropThing[num].height-50, x, y, jackWH.width-30, jackWH.height-40)) {
        that= true;
      } else that= false;
    }

    if (that) {
      return true;
    } else return false;
  }
}

//-for all scene use
boolean isHit(int ax, int ay, int aw, int ah, int bx, int by, int bw, int bh)
{
  // Collision x-axis?
  boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
  // Collision y-axis?
  boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
  return collisionX && collisionY;
}