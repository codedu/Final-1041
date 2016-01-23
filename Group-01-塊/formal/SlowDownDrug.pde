class SlowDownDrug extends Medicine{
  SlowDownDrug(int dX, int dY) {
    super(dX,dY);
    super.medImg = loadImage("bg/med1.png");
    super.hp=0;
    super.speeddown=-7;
    }
}