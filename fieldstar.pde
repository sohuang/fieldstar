Particle[] theParticles = new Particle[10];

void setup() {
	size(600, 400);
	background(255);
	if (theParticles.length >= 3) {
		theParticles[0] = new OddballParticle();
		theParticles[1] = new JumboParticle();
		for (int i = 2; i < theParticles.length; i++) {
			theParticles[i] = new NormalParticle();
		}
	}
}

void draw() {
	for (int i = 0; i < theParticles.length; i++) {
		theParticles[i].move();
		theParticles[i].show();
	}
	onEdge();
}

void onEdge() {
	for (Particle particle : theParticles) {
		if (particle.getMyX() < 0 - (particle.getMyWidth() / 2) || 
			particle.getMyX() > width + (particle.getMyWidth() / 2) || 
			particle.getMyY() < 0 - (particle.getMyHeight() / 2) || 
			particle.getMyY() > height + (particle.getMyHeight() / 2)) {
			particle.restart();
		}
	}
}

class NormalParticle implements Particle {
	int myWidth, myHeight, myColor;
	double myX, myY;
	double mySpeed, myAngle;

	NormalParticle() {
		myX = Math.random() * width;
		myY = Math.random() * height;
		mySpeed = Math.random() * 10 - 5;
		myAngle = Math.random() * PI;
		myWidth = myHeight = 5;
	}

	double getMyX() {
		return myX;
	}

	double getMyY() {
		return myY;
	}

	int getMyWidth() {
		return myWidth;
	}

	int getMyHeight() {
		return myHeight;
	}

	void show() {
		ellipse((float)myX, (float)myY, myWidth, myHeight);
	}

	void move() {
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}

	void restart() {
		myX = Math.random() * width;
		myY = Math.random() * height;
		mySpeed = Math.random() * 10 - 5;
		myAngle = Math.random() * PI;
	}
}

interface Particle {
	public void show();
	public void move();
	public void restart();
	public double getMyX();
	public double getMyY();
	public int getMyWidth();
	public int getMyHeight();
}

class OddballParticle implements Particle {
	int myWidth, myHeight, myColor;
	public double myX, myY;
	double mySpeed, myAngle;

	OddballParticle() {
		myX = Math.random() * width;
		myY = Math.random() * height;
		mySpeed = Math.random() * 6 - 3;
		myAngle = Math.random() * PI;
		myWidth = 30;
		myHeight = 20;
	}

	double getMyX() {
		return myX;
	}

	double getMyY() {
		return myY;
	}

	int getMyWidth() {
		return myWidth;
	}

	int getMyHeight() {
		return myHeight;
	}

	void show() {
		rectMode(CENTER);
		rect((float)myX, (float)myY, myWidth, myHeight);
	}

	void move() {
		myX += Math.cos(myAngle) * mySpeed;
		myY += Math.sin(myAngle) * mySpeed;
	}

	void restart() {
		myX = Math.random() * width;
		myY = Math.random() * height;
		mySpeed = Math.random() * 6 - 3;
		myAngle = Math.random() * PI;
	}
}

class JumboParticle extends NormalParticle {
	JumboParticle() {
		myWidth = myHeight = 50;
	}
}