import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Main extends PApplet {


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

public void setup() {
	
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

}

String role;

public void draw() {

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
				}
			}
		} else {
			background(start1);
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
			if (mouseX <= 420 && mouseY <= 737) {
				if (mousePressed) {
					state = GameState.STAGE1;
					role = "archer";
				} else {
					image(archar1, 110, 60, 384, 540);

				}
			} else {

			}
		}
		if (mouseX >= 618 && mouseY >= 650) {
			if (mouseX <= 878 && mouseY <= 737) {
				image(saber1, 518, 60, 461, 614);
				if (mousePressed) {
					state = GameState.STAGE1;
					role = "saber";

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
			hpDisplay.updateWithFighterHP(players.hp);
			if (frameCount % 1000 == 0)
				players.hpValueChange(10);
		}

	} else if (state == GameState.DIE) {
		// background(end1);

		if (mouseX >= 267 && mouseY >= 522) {
			if (mouseX <= 741 && mouseY <= 631) {
				image(end3, 0, 0);
				println("end3");
				if (mousePressed) {
					exit();
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

public boolean isHit(int ax, int ay, int aw, int ah, int bx, int by, int bw, int bh) {
	// Collision x-axis?
	boolean collisionX = (ax + aw >= bx) && (bx + bw >= ax);
	// Collision y-axis?
	boolean collisionY = (ay + ah >= by) && (by + bh >= ay);
	return collisionX && collisionY;
}

public void keyPressed() {
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

public void keyReleased() {
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

class Archer {
  PImage archerwalk1;
  PImage archerwalk2;

  PImage archerattack1;
  PImage archerattack2;

  int speed = 15;
  int timera = 0;

  int archerx;
  int archery;
  boolean jump;
  int hp;

  Archer(int hp) {
    this.archerwalk2 = loadImage("img/archer/archer walk1.png");
    this.archerwalk1 = loadImage("img/archer/archer walk0.png");
    this.archerattack1 = loadImage("img/archer/archer attack0.png");
    this.archerattack2 = loadImage("img/archer/archer attack1.png");
    this.hp = hp;
    this.archerx = 0;
    this.archery = 470;

  }

  public void draw() {
    if (view && !clear) {
      image(archerwalk2, this.archerx, this.archery);
    } else if (clear) {

    } else {
      image(archerwalk1, this.archerx, this.archery);
    }

    if (archerx % 30 == 0 && stop) {
      view = !view;
    } else {
      view = view;
    }
    if (isMovingUp) {
      jump = true;
      this.move(Direction.UP);
    }
    if (isMovingDown) {
      this.move(Direction.DOWN);
    }
    if (isMovingLeft) {
      this.move(Direction.LEFT);
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);
    }

    // if(archery != 470)
    // {
    // archery = 470;
    // }
  }

  int tmp = 0;// arrow num

  public void attack() {
    if (attack) {
      timera++;
      if (timera <= 10) {
        clear = true;
        // println("attack:");
        image(archerattack1, archerx, archery);
      } else if (timera > 10 && timera <= 20) {
        image(archerattack2, archerx, archery);
      }

    }

    if (timera > 20) {
      clear = false;
      attack = false;
      timera = 0;
    }

  }

  public void shoot() {
    if (tmp < 13) {
      arrows[tmp] = new Arrow(archerx, archery);
      tmp++;
    } else {
      for (int i = 0; i < tmp; i++) {
        if (arrows[i] == null || arrows[i].x < 0) {
          arrows[i] = new Arrow(archerx, archery);
          break;
        }
      }
    }
  }

  public void move(int direct) {

    switch (direct) {
    case Direction.UP:

      if (jump) {
        tmp++;
        if (tmp < 15) {
          this.archery -= 20;
        }
        if (tmp > 15 && tmp < 30) {
          this.archery += 20;
        }

      }

      if (tmp > 30) {
        jump = false;
        isMovingUp = false;
        tmp = 0;
        this.archery = 470;

      }

      break;

    case Direction.LEFT:

      if (this.archerx - speed > 0) {
        this.archerx -= speed;
      }
      break;

    case Direction.RIGHT:
      if (this.archerx + speed < width - this.archerwalk1.width) {
        this.archerx += speed;
      }
      break;
    }
  }

  public void hpValueChange(int value) {
    this.hp += value;
    if (this.hp <= 0) {
      state = GameState.DIE;
      return;
    } else if (this.hp >= 100) {
      this.hp = 100;
      return;
    }
    return;
  }
}
class Arrow {
	PImage arrow;
	int x = 0;
	int y = 0;

	Arrow(int x, int y) {
		this.x = x;
		this.y = y;
		this.arrow = loadImage("img/archer/arrow.png");
	}

	public void draw() {
		image(arrow, x + 120, y + 70);
	}

	public void move() {
		this.x += 30;
	}
}
class Boss{
  PImage boss1;
  PImage boss2;
  PImage background2;
  PImage stair1;
  PImage stair2;
  PImage stair3;
  int bossX = 800;
  int bossY = 350;
  int tmp = 0;
  int walkType = 0;
  int walkWard = 1;
  int[][] stair = new int[3][2];
  boolean hit;
  int tmp1;


  boolean bossWalk = true;
  int hp;

  Boss(int hp){
     boss1 = loadImage("img/boss/boss1.png");
     boss2 = loadImage("img/boss/boss2.png");
     stair1 = loadImage("img/boss/stair.png");
     stair2 = loadImage("img/boss/stair.png");
     stair3 = loadImage("img/boss/stair.png");
     this.hp = hp;
     stair[0][0] = 700;
     stair[0][1] = 500;
     stair[1][0] = 750;
     stair[1][1] = 550;
     stair[2][0] = 800;
     stair[2][1] = 600;
  }

  public void draw(){  
        tmp++;
      if (hit) {
         tmp1++;
        if(tmp1 > 45){
         hit = false;
      }
    }

      if(bossWalk == true && tmp == 20){
        tmp = 0;
        walkType++;
      }
        
      if(walkType%2 == 0){
        image(boss1,bossX,bossY);
      }else{
        image(boss2,bossX,bossY);
      }
      
      if(hit){
         bossX+=0;
      }else {
        if(walkWard%2 == 0){
         bossX+=5;
        }else{
          bossX-=5;
       }
     }
      
      
      if(bossX == 300){
        walkWard++;
      }
      if(bossX == 810){
        walkWard++;
      }
      
      image(stair1,stair[0][0],stair[0][1]);
      image(stair2,stair[1][0],stair[1][1]);
      image(stair3,stair[2][0],stair[2][1]);
      stair[0][0]-=10;
      stair[1][0]-=10;
      stair[2][0]-=10;
      if(stair[0][0]<-5){
        stair[0][0] = 800;
      }
      if(stair[1][0]<-5){
       stair[1][0] = 800;
      }
      if(stair[2][0]<-5){
       stair[2][0] = 800;
      }
     
  }


  public boolean isCollideWithPlayer() {
    int tmp = 0;
    if(isHit(bossX+70,bossY,170, 60,player.archerx+100, player.archery+30,
        70, 170)){
      hit = true;
      tmp++;
    }

    for(int i = 0;i < 3;i++){
        if (isHit(stair[i][0]+10,stair[i][1]+20, 70, 30, player.archerx, player.archery,
            100, 200)) {
         tmp ++;
         stair[i][0] = 10000;
        } else {
        
        }
    }
     if(tmp != 0){
      return true;
     }else {
      return false;
     }
  }

  public boolean isCollideWithArrow(Arrow arrow) {
    if (isHit(bossX+70,bossY,170, 60, arrow.x, arrow.y, 80, 60)) {
      // py = 0;
      hp -= floor(random(70,110));
      return true;
    } else {
      return false;
    }

  }
}    
class Controller {

	public void Controller() {

	}

	public void pollyController() {
		if (pollys[0] == null && starter) {
			pollys[0] = new Polly(floor(random(50, 100)));
			pollyCount++;
			starter = false;
		}

		for (int i = 0; i < pollyNum; i++) {
			if (pollys[i] == null
					&& (frameCount % floor(random(400, 750)) == 0)) {
				pollys[i] = new Polly(floor(random(100, 200)));
			}
			if (pollys[i] != null) {
				if ((1000 - pollys[i].px) < 0) {
					pollys[i] = null;
				}

			}
			if (pollys[i] != null) {
				pollys[i].draw();
				pollys[i].move();

				if (pollys[i].isCollideWithPlayer()) {
					// println("hurt");
					if (!infenityDefender)
						player.hpValueChange(-2);
					infenityDefender = true;
					// pollys[i] = null;
				}
				for (int j = 0; j < 13; j++) {
					if (arrows[j] != null && pollys[i] != null) {
						if (pollys[i].isCollideWithArrow(arrows[j])) {
							arrows[j] = null;
							if (pollys[i].hp <= 0) {
								pollys[i] = null;
								pollyLill++;
							}

						}
					}
				}

			}
		}
	}

	public void dinaController() {
		// if ((frameCount % 500 == 0) && (dinaCount < dinaNum)) {
		// println("make: "+ dinaCount);
		// dina[dinaCount] = new Dina(floor(random(200,250)));
		// dinaCount++;
		// }

		for (int i = 0; i < dinaNum; i++) {
			if (dina[i] == null && (frameCount % floor(random(400, 750)) == 0)) {
				dina[i] = new Dina(floor(random(500, 700)));
			}
			if (dina[i] != null) {
				if ((1020 + dina[i].dx) < 0) {
					dina[i] = null;
				}

			}
			if (dina[i] != null) {
				dina[i].draw();
				dina[i].move();

				if (dina[i].isCollideWithPlayer()) {
					if (!infenityDefender)
						player.hpValueChange(-5);
					infenityDefender = true;
					// pollys[i] = null;
				}
				for (int j = 0; j < 13; j++) {
					if (arrows[j] != null && dina[i] != null) {
						if (dina[i].isCollideWithArrow(arrows[j])) {
							arrows[j] = null;
							if (dina[i].hp <= 0) {
								dina[i] = null;
								dinaKill++;
							}

						}
					}
				}

			}
		}

		// for (int i = 0; i < dinaNum; ++i) {
		// if (dina[i] != null) {
		// if ((dinaCount >= dinaNum)) {
		// dinaCount = 0;
		// } else if ((dinaCount < dinaNum) && (1020-dina[i].dx) < -100) {
		// println("hi");
		// dina[i] = null;
		// }
		// }
		// // println("dina0 : "+(1020 - dina[0].dx));
		// if (dina[i] != null) {
		// dina[i].draw();
		// dina[i].move();

		// if (dina[i].isCollideWithPlayer()) {
		// if(!infenityDefender) player.hpValueChange(-10);
		// infenityDefender = true;
		// println("player");
		// }
		// for (int j = 0; j < 13; j++) {
		// if (arrows[j] != null && dina[i] != null) {
		// if (dina[i].isCollideWithArrow(arrows[j])) {
		// arrows[j] = null;
		// if (dina[i].hp <= 0) {
		// dina[i] = null;
		// dinaKill ++;
		// println("dinaKill"+dinaKill);
		// }
		// }
		// }
		// }

		// }
		// }
	}

	public void wizardController() {

		for (int i = 0; i < wizardNum; i++) {
			if (wizards[i] == null
					&& (frameCount % floor(random(400, 750)) == 0)) {
				wizards[i] = new Wizard(floor(random(200, 300)));
			}
			if (wizards[i] != null) {
				if ((1020 + dina[i].dx) < 0) {
					wizards[i] = null;
				}

			}
			if (wizards[i] != null) {
				wizards[i].draw();
				// wizards[i].move();

				if (wizards[i].isCollideWithPlayer()) {
					// println("hurt");
					if (!infenityDefender)
						player.hpValueChange(-5);
					infenityDefender = true;
					// pollys[i] = null;
				}
				for (int j = 0; j < 13; j++) {
					if (arrows[j] != null && wizards[i] != null) {
						if (wizards[i].isCollideWithArrow(arrows[j])) {
							arrows[j] = null;
							if (wizards[i].hp <= 0) {
								wizards[i] = null;
								wizardKill++;
							}

						}
					}
				}

			}
		}

		// if ((frameCount % 100 == 0) && (wizardCount < wizardNum)) {
		// wizards[wizardCount] = new Wizard(floor(random(200,250)));
		// wizardCount++;
		// }

		// for (int i = 0; i < wizardCount; ++i) {
		// if (wizards[i] != null) {
		// if ((wizardCount >= wizardNum)) {
		// wizardCount = 0;
		// }
		// }

		// if (wizards[i] != null) {
		// wizards[i].draw();

		// if (wizards[i].isCollideWithPlayer()) {

		// wizards[i].wizardAttack1X = 10000;
		// if(!infenityDefender) player.hpValueChange(-10);
		// infenityDefender = true;

		// }
		// for (int j = 0; j < 13; j++) {
		// if (arrows[j] != null && wizards[i] != null) {
		// if (wizards[i].isCollideWithArrow(arrows[j])) {
		// arrows[j] = null;
		// if (wizards[i].hp <= 0) {
		// wizards[i] = null;
		// wizardKill ++;
		// }
		// }
		// }
		// }

		// }
		// }
	}

	public void bossConroller() {
		if (bossGo) {
			boss = new Boss(1400);
			bossGo = false;
		}

		if (boss != null) {
			boss.draw();
			if (boss.isCollideWithPlayer()) {
				if (!infenityDefender)
					player.hpValueChange(-10);
				infenityDefender = true;
			}
			for (int j = 0; j < 13; j++) {
				if (arrows[j] != null && boss != null) {
					if (boss.isCollideWithArrow(arrows[j])) {
						arrows[j] = null;
						if (boss.hp <= 0) {
							boss = null;
							state = GameState.END;
							dinaKill++;
							println("dinaKill" + dinaKill);
						}
					}
				}
			}
		}
	}
}
class Dina{
  PImage dina;
  PImage dina2;
  PImage dinaDie;
  int dx;
  int dy;
  int hp;
  boolean hit;
  int tmp;

  boolean  dinaAnimation = true;
  Dina(int hp){
    dina = loadImage("img/dina/dina.png");
    dina2 = loadImage("img/dina/dina2.png");
    dinaDie = loadImage("img/dina/dinadDie.png");
    this.hp = hp;
  }

  public void move(){
     if(hit){
      dx-=0;
    }else  {
      dx-=3;
    }
  }
  public void draw(){
  if (hit) {
     tmp++;
      if(tmp > 45){
        hit = false;
      }

      image(dinaDie,1020+dx ,500+dy);
  }else {
     if(dx%60 == 0){
       dinaAnimation = !dinaAnimation;
       dy = floor(random(5, 10));
    }
    

    if(dinaAnimation){
      image(dina, 1020+dx ,500+dy);
    }else  {
      image(dina2,1020+dx ,500-dy);
    }
  }
   
  }

  public boolean isCollideWithPlayer() {
    if (isHit(1020+dx, 500, 102, 80,player.archerx+100, player.archery+30,
        70, 170)) {
      hit = true;
      return true;
    } else {
      return false;
    }

  }

  public boolean isCollideWithArrow(Arrow arrow) {
    if (isHit(1020+dx, 480 , 102, 80, arrow.x, arrow.y, 80, 60)) {
      hit = true;
      hp -= floor(random(70,110));
      return true;
    } else {
      return false;
    }

  }

}
class HpUi {

	PImage hpUI;

	HpUi() {
		this.hpUI = loadImage("img/hp.png");
	}

	public void updateWithFighterHP(int hp) {
		fill(255, 0, 0);
		rect(15, 10, hp*2 , 20);
		image(hpUI, 10, 10);
	}

}
class Polly {
  PImage polly1;
  PImage pollyDie;
  int px;
  int py;
  int time = 0;
  boolean jump;
  int hp;
  int x;
  boolean hit;
  int tmp;

  Polly(int hp) {
    polly1 = loadImage("img/poly/poly1.png");
    pollyDie = loadImage("img/poly/poly1Die.png");
    jump = false;
    this.hp = hp;
  }

  public void draw() {
    if (hit) {
      tmp++;
      if (tmp > 45) {
        hit = false;
      }

      image(pollyDie, x, 600 - py, 102, 70);

    } else {
      image(polly1, x, 600 - py, 102, 70);
    }
  }

  public void move() {
    x = 1000 - px;
    if (hit) {
      px += 0;
    } else {
      px += 3;
    }
    time++;
    if (time <= 15) {
      py += 7;
    }
    if (time > 15 && time <= 30) {
      py -= 7;
    }
    if (time >= 30) {
      time = 0;
    }
  }

  public boolean isCollideWithPlayer() {
    if (isHit(1020 - px, 600 - py, 102, 80, player.archerx + 100,
        player.archery + 30, 70, 170)) {
      hit = true;
      return true;
    } else {
      return false;
    }

  }

  public boolean isCollideWithArrow(Arrow arrow) {
    if (isHit(1020 - px, 600 - py, 102, 80, arrow.x, arrow.y, 80, 60)) {
      hit = true;
      hp -= floor(random(70, 100));
      return true;
    } else {
      return false;
    }

  }

}
class Saber{
  PImage saberwalk1;
  PImage saberwalk2;

  PImage saberattack1;
  PImage saberattack2;

  int speed = 5;
  int timera = 0;

  int saberx;
  int sabery;

  int hp;

  Saber(int hp) {
    this.saberwalk2 = loadImage("img/saber/saber1.jpg");
    this.saberwalk1 = loadImage("img/saber/saber2.jpg");
    this.saberattack1 = loadImage("img/saber/sabersttack.png");
    this.saberattack2 = loadImage("img/saber/saberattack2.png");
    this.hp = hp;
    this.saberx = 0;
    this.sabery = 470;

  }

  public void draw() {
    if (view && !clear) {
      image(saberwalk2, this.saberx, this.sabery);
    } else if (clear) {

    } else {
      image(saberwalk1, this.saberx, this.sabery);
    }

    if (saberx % 30 == 0 && stop) {
      view = !view;
    } else {
      view = view;
    }
    if (isMovingUp) {
      this.move(Direction.UP);
    }
    if (isMovingDown) {
      this.move(Direction.DOWN);
    }
    if (isMovingLeft) {
      this.move(Direction.LEFT);
    }
    if (isMovingRight) {
      this.move(Direction.RIGHT);
    }

  }

  int tmp = 0;// arrow num

  public void attack() {
    if (attack) {
      timera++;
      if (timera <= 10) {
        clear = true;
        // println("attack:");
        image(saberattack1, saberx, sabery);
      } else if (timera > 10 && timera <= 20) {
        image(saberattack2, saberx, sabery);
      }

    }

    if (timera > 20) {
      clear = false;
      attack = false;
      timera = 0;
    }

  }

  public void shoot() {
    
  }

  public void move(int direct) {

    switch (direct) {
    case Direction.UP:
      break;

    case Direction.LEFT:

      if (this.saberx - speed > 0) {
        this.saberx -= speed;
      }
      break;

    case Direction.RIGHT:
      if (this.saberx + speed < width - this.saberwalk1.width) {
        this.saberx += speed;
      }
      break;
    }
  }

  public void hpValueChange(int value) {
    this.hp += value;
    if (this.hp <= 0) {
      state = GameState.END;
      return;
    } else if (this.hp >= 100) {
      this.hp = 100;
      return;
    }
    return;
  }
}
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

	public void draw() {

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

	public boolean isCollideWithPlayer() {
		if (isHit(wizardAttack1X, wizardAttack1Y, 80, 60, player.archerx + 100,
				player.archery + 30, 70, 170)
				|| isHit(wizardX + 130, wizardY, 170, 60, player.archerx + 100,
						player.archery + 30, 70, 170)) {
			return true;
		} else {
			return false;
		}

	}

	public boolean isCollideWithArrow(Arrow arrow) {
		if (isHit(wizardX + 130, wizardY, 170, 60, arrow.x, arrow.y, 80, 60)) {
			// py = 0;
			hp -= floor(random(70, 110));
			return true;
		} else {
			return false;
		}

	}
}
//The MIT License (MIT)

//Copyright (c) 2013 Mick Grierson, Matthew Yee-King, Marco Gillies

//Permission is hereby granted, free of charge, to any person obtaining a copy\u2028of this software and associated documentation files (the "Software"), to deal\u2028in the Software without restriction, including without limitation the rights\u2028to use, copy, modify, merge, publish, distribute, sublicense, and/or sell\u2028copies of the Software, and to permit persons to whom the Software is\u2028furnished to do so, subject to the following conditions:
//The above copyright notice and this permission notice shall be included in\u2028all copies or substantial portions of the Software.

//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\u2028IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\u2028FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\u2028AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\u2028LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\u2028OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN\u2028THE SOFTWARE.


public PImage [] loadImages(String stub, String extension, int numImages)
{
  PImage [] images = new PImage[0];
  for(int i =0; i < numImages; i++)
  {
    PImage img = loadImage(stub+i+extension);
    if(img != null)
    {
      images = (PImage [])append(images,img);
    }
    else
    {
      break;
    }
  }
  return images;
}
  public void settings() { 	size(1024, 768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
