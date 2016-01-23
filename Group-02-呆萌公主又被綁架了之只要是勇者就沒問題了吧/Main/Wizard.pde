class Wizard {
	PImage background;
	PImage wizard1;
	PImage wizard2;
	PImage wizardAttack1;
	PImage wizardAttack2;
	PImage wizardAttack3;
	int walkTmp;
	int walkType;
	int wizardX;
	int wizardY;
	int wizardAttack1X;
	int wizardAttack1Y;
	int wizardAttack2X;
	int wizardAttack2Y;
	int wizardAttack3X;
	int wizardAttack3Y;
	int tmp;
	int hp;

	Wizard(int hp) {
		wizard1 = loadImage("img/wizard/wizard1.png");
		wizard2 = loadImage("img/wizard/wizard2.png");
		wizardAttack1 = loadImage("img/wizard/wizard's attack.png");
		wizardAttack2 = loadImage("img/wizard/wizard's attack.png");
		wizardAttack3 = loadImage("img/wizard/wizard's attack.png");
		this.walkTmp = 0;
		this.walkType = 0;
		this.wizardX = 1000;
		this.wizardY = 400;
		this.wizardAttack1X = 750;
		this.wizardAttack1Y = 500;
		this.wizardAttack2X = 760;
		this.wizardAttack2Y = 480;
		this.wizardAttack3X = 770;
		this.wizardAttack3Y = 460;
		this.hp = hp;
	}

	void draw() {

		// println(wizardX);
		if (wizardX > 700) {
			tmp++;
			if (walkTmp == 5) {
				walkTmp = 0;
				walkType++;
			}
			wizardX -= 3;
		}
		if (walkType % 2 == 0) {
			image(wizard1, wizardX, wizardY);
		} else {
			image(wizard2, wizardX, wizardY);
		}

		if (wizardX <= 700) {
			image(wizardAttack1, wizardAttack1X, wizardAttack1Y);
			// image(wizardAttack2,wizardAttack2X,wizardAttack2Y);
			// image(wizardAttack3,wizardAttack3X,wizardAttack3Y);
			wizardAttack1X -= 10;
			// wizardAttack2X-=8;
			// wizardAttack3X-=9;
			if (wizardAttack1X < -10) {
				wizardAttack1X = 750;
			}
			// if(wizardAttack2X < -10){
			// wizardAttack2X = 760;
			// }
			// if(wizardAttack3X < -10){
			// wizardAttack3X = 770;
			// }
		}

	}

	boolean isCollideWithPlayer() {
		if (isHit(wizardAttack1X, wizardAttack1Y, 80, 60, player.archerx + 100,
				player.archery + 30, 70, 170)
				|| isHit(wizardX + 130, wizardY, 170, 60, player.archerx + 100,
						player.archery + 30, 70, 170)) {
			return true;
		} else {
			return false;
		}

	}

	boolean isCollideWithArrow(Arrow arrow) {
		if (isHit(wizardX + 130, wizardY, 170, 60, arrow.x, arrow.y, 80, 60)) {
			// py = 0;
			hp -= floor(random(70, 110));
			return true;
		} else {
			return false;
		}

	}
}