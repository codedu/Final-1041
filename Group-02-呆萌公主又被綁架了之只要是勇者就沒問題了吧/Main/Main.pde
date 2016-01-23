
class GameState {


	static final int START = 0;
	static final int CHOOSE = 1;
	static final int STAGE1 = 2;
	static final int STAGE2 = 3;
	static final int STAGE3 = 4;
	static final int DIE = 5;
	static final int END = 7;
}

class Direction {
	static final int LEFT = 0;
	static final int RIGHT = 1;
	static final int UP = 2;
	static final int DOWN = 3;
}

class EnemyGroup {
	static final int FIRST = 0;
	static final int SECOND = 1;
	static final int THIRD = 2;
	static final int FORTH = 3;
	static final int FIVE = 4;
	static final int SIX = 5;
	static final int SEVEN = 6;

}
import ddf.minim.*;
boolean view = true;

boolean infenityDefender;
int infenityDefenderTime;

// Boss
boolean bossGo = true;
Boss boss;

// Wizard
int wizardCount = 0;
int wizardNum = 5;
Wizard[] wizards = new Wizard[wizardNum];
// Archer player;

// Dina
int dinaCount = 0;
int dinaNum = 5;
Dina dina[] = new Dina[dinaNum];

// Polly
int pollyCount = 0;
int pollyNum = 5;
Polly[] pollys = new Polly[pollyNum];

// Hp
HpUi hpDisplay;

// Arrow
int arrowNum = 13;
Arrow[] arrows = new Arrow[arrowNum];
Saber saber = new Saber();
int arrowCount = 0;

PImage background1, background2;

int time;
int wait = 4000;

boolean leftPressed;
boolean rightPressed;
boolean attack;
boolean shoot;
boolean jump;
boolean[] arrow_appear;
Archer player;
Saber players;
int enemyGroup = EnemyGroup.FIRST;
int state = GameState.START;
// picture start
PImage start1, start2;
// pictures initial
PImage archar1, archar2, go, sabertext, saber1, saber2, stage, archartext;
PImage win_Archer;

PImage end1, end2, end3;

boolean isMovingUp;
boolean isMovingDown;
boolean isMovingLeft;
boolean isMovingRight;

boolean stop = false;// prevent forever loop for animation
boolean clear = false;

// background
int playingBg1x = 0;
int playingBg2x = 1024;

boolean starter = true;

// killcount
int pollyLill = 0;
int wizardKill = 0;
int dinaKill = 0;

// Control enemy
Controller crtl;
PFont enemyGroupFont;
import ddf.minim.*;
Minim  minim;
AudioPlayer songstart;
AudioPlayer game;
AudioPlayer gameover;
void setup() {
	size(1024, 768);

	player = new Archer(100);
	players = new Saber(170);
	start1 = loadImage("img/start/start1.png");
	start2 = loadImage("img/start/start2.png");
	archar1 = loadImage("img/initialHero/ARCHER1.png");
	archar2 = loadImage("img/initialHero/ARCHER2.png");
	win_Archer = loadImage("img/win/win1(archer).png");
	go = loadImage("img//initialHero/go.png");
	archartext = loadImage("img/initialHero/archer.PNG");
	sabertext = loadImage("img/initialHero/saber.PNG");
	saber1 = loadImage("img/initialHero/SABER1.png");
	saber2 = loadImage("img/initialHero/SABER2.png");

	background1 = loadImage("img/background1.jpg");
	background2 = loadImage("img/background2.png");

	end1 = loadImage("img/Die/end1.PNG");
	end2 = loadImage("img/Die/end2.PNG");
	end3 = loadImage("img/Die/end3.PNG");
	hpDisplay = new HpUi();
	enemyGroupFont = createFont("W71.TTC", 100);
minim = new Minim(this);
songstart = minim.loadFile("sound/start.mp3");
songstart.play();
game = minim.loadFile("sound/game.mp3");
gameover = minim.loadFile("sound/gameover.wav");
//game.play();
}

String role;

void draw() {

	// Start
	if (state == GameState.START) {
		// start page

		if (mouseX >= 31 && mouseY >= 530) {
			if (mouseX <= 353 && mouseY <= 683) {
				if (mousePressed) { // GameStart
					// fill(255, 40);
					state = GameState.CHOOSE;
                                  
				} else {
					background(start2);
                               songstart.play();
				}
			}
		} else {
			background(start1);
                   songstart.play();
		}

		// Choose Role
	} else if (state == GameState.CHOOSE) {

		// Choose Role Page

		background(0);

		// Top of text
		textSize(48);
		String end = "Please Choose Your Hero";
		textMode(CENTER);

		// blink text
		if (frameCount % 30 < 15) {
			fill(0);
		} else {
			fill(255);
		}
		text(end, 230, 50);

		image(saber2, 518, 60, 461, 614);
		image(archar2, 110, 60, 384, 540);
		image(archartext, 160, 650, 260, 87);
		image(sabertext, 618, 650, 260, 87);

		// click
		if (mouseX >= 160 && mouseY >= 650) {
			if (mouseX <= 500 && mouseY <= 737) {
				if (mousePressed) {
					state = GameState.STAGE1;
					role = "archer";
                                 songstart.pause(); 
                                  game.play();
                                  game.loop();
				} else {
					image(archar1, 110, 60, 384, 540);
                                
				}
			} else {

			}
		}
		if (mouseX >= 618 && mouseY >= 650) {
			if (mouseX <= 898 && mouseY <= 737) {
				image(saber1, 518, 60, 461, 614);
				if (mousePressed) {
					state = GameState.STAGE1;
					role = "saber";
                                 songstart.pause();
                                 game.play();
                                 game.loop();
				} else {

				}
			}
		}
		// STAGE1
	} else if (state == GameState.STAGE1) {

		// Runnung Page

		// ---BACKGROUND-----

		// background(background1);
		// playingBg1x--;
		// playingBg2x--;

		// if (playingBg1x == -1024) {
		// playingBg1x = 1024;
		// }

		// if (playingBg2x ==-1024) {
		// playingBg2x = 1024;
		// }

		image(background1, playingBg1x, 0);
		// image(background2, playingBg2x, 0);
		// -----BACKGROUND------

		crtl = new Controller();
		int groupNum = enemyGroup + 1;

		if (pollyLill < 10) {
			enemyGroup = EnemyGroup.FIRST;
		} else if (pollyLill < 25 && dinaKill < 5) {
			enemyGroup = EnemyGroup.SECOND;
		} else if (wizardKill < 5) {
			enemyGroup = EnemyGroup.THIRD;
		} else if (wizardKill < 10 && dinaKill < 10) {
			enemyGroup = EnemyGroup.FORTH;
		} else if (wizardKill < 20 && dinaKill < 15) {
			enemyGroup = EnemyGroup.FIVE;
		} else if (wizardKill < 25 && dinaKill < 20) {
			enemyGroup = EnemyGroup.SIX;
		}

		// Group Info
		String groupInfo = "Group   " + groupNum;
		fill(0);
		textFont(enemyGroupFont);
		textSize(32);
		text(groupInfo, 870, 755);
		// ------Polly--------

		switch (enemyGroup) {
		case 0: {
			crtl.pollyController();

			break;
		}
		case 1: {
			crtl.pollyController();
			crtl.dinaController();
			break;
		}
		case 2: {
			crtl.pollyController();
			crtl.wizardController();
			break;
		}
		case 3: {
			crtl.dinaController();
			crtl.wizardController();
			break;
		}
		case 4: {
			crtl.dinaController();
			crtl.wizardController();
			crtl.pollyController();
			break;
		}
		case 5: {
			crtl.pollyController();
			crtl.bossConroller();
			break;
		}
		}

		if (infenityDefender) {
			if (frameCount % 40 == 0) {
				infenityDefender = false;
				infenityDefenderTime = 0;
			}
		}

		// role choose
		if (role == "archer") {
			player.draw();
			player.attack();
			hpDisplay.updateWithFighterHP(player.hp);
			if (frameCount % 1000 == 0)
				player.hpValueChange(10);
			for (int i = 0; i < arrowNum; i++) {
				if (arrows[i] != null) {
					arrows[i].move();
					arrows[i].draw();
				}
				if (arrows[i] != null) {
					if (arrows[i].x > 1024) {
						arrows[i] = null;
					}
				}

			}

		} else if (role == "saber") {
			players.draw();
                players.attack();
			hpDisplay.updateWithFighterHP(players.hp);
			if (frameCount % 1000 == 0)
				players.hpValueChange(10);
		}

	} else if (state == GameState.DIE) {
  game.pause();
  gameover.play();
		// background(end1);

		if (mouseX >= 267 && mouseY >= 522) {
			if (mouseX <= 741 && mouseY <= 631) {
				image(end3, 0, 0);
				println("end3");
				if (mousePressed) {
					exit();
                                  gameover.pause();
				}
			} else {
				image(end1, 0, 0);
			}
		} else if (mouseX >= 267 && mouseY >= 371) {
			if (mouseX <= 733 && mouseY <= 481) {
				image(end2, 0, 0);
				println("end1");
				if (mousePressed) {
					player.hpValueChange(100);
					player.archery = 470;
					player.archerx = 0;
					state = GameState.STAGE1;
				} else {

				}
			} else {
				image(end1, 0, 0);
			}

		}
	} else if (state == GameState.END) {
		background(win_Archer);
	}
}

boolean isHit(int ax, int ay, int aw, int ah, int bx, int by, int bw, int bh) {
	// Collision x-axis?
	boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
	// Collision y-axis?
	boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
	return collisionX && collisionY;
}

void keyPressed() {
	stop = true;
	switch (keyCode) {
	case UP:
		isMovingUp = true;
		break;
	case DOWN:
		isMovingDown = true;
		break;
	case LEFT:
		isMovingLeft = true;
		break;
	case RIGHT:
		isMovingRight = true;
		break;
	default:
		break;
	}

	if (key == ' ') {

		if (state == GameState.STAGE1 && attack == false) {
			attack = true;
			player.shoot();
		}
	}
}

void keyReleased() {
	stop = false;
	switch (keyCode) {
	case UP:

		break;
	case DOWN:
		isMovingDown = false;
		break;
	case LEFT:
		isMovingLeft = false;
		break;
	case RIGHT:
		isMovingRight = false;
		break;
	default:
		break;
	}
	if (key == ' ') {
		if (state == GameState.STAGE1) {
			// attack = false;

		}
	}
}