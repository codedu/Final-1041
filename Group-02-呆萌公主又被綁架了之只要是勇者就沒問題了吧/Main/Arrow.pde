class Arrow {
	PImage arrow;
	int x = 0;
	int y = 0;

	Arrow(int x, int y) {
		this.x = x;
		this.y = y;
		this.arrow = loadImage("img/archer/arrow.png");
	}

	void draw() {
		image(arrow, x + 120, y + 70);
	}

	void move() {
		this.x += 30;
	}
}
