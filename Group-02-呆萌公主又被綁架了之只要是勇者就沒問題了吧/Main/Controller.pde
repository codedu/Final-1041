class Controller {

	void Controller() {

	}

	void pollyController() {
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
                        if (pollys[i].isCollideWithPlayers()) {
                             // println("hurt");
                            if (!infenityDefender)
                                players.hpValueChange(-2);
                                  infenityDefender = true;
          // pollys[i] = null;
                                   }
                                     if (pollys[i]!=null&&pollys[i].isCollideWithPlayersattack(saber)){
                                         if (pollys[i].hp <= 0) {
                                              pollys[i] = null;
                                                pollyLill++;
              }
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

	void dinaController() {
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
                        
                        if (dina[i].isCollideWithPlayers()) {
                                   if (!infenityDefender)
                                        players.hpValueChange(-5);
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

	void wizardController() {

		for (int i = 0; i < wizardNum; i++) {
			if (wizards[i] == null
					&& (frameCount % floor(random(400, 750)) == 0)) {
				wizards[i] = new Wizard(floor(random(200, 300)));
			}
			if (wizards[i] != null) {
				if ((1020 + wizards[i].wizardX) < 0) {
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

	void bossConroller() {
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
                 if (boss.isCollideWithPlayers()) {
                             if (!infenityDefender)
                              players.hpValueChange(-10);
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